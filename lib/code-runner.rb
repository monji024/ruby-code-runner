# lib/code-runner.rb
require 'httparty'
require 'json'

module CodeRunner
  class Error < StandardError; end

  SUPPORTED_LANGUAGES = {
    'python' => 'python', 'py' => 'python',
    'javascript' => 'javascript', 'js' => 'javascript',
    'java' => 'java',
    'cpp' => 'cpp', 'c' => 'c',
    'csharp' => 'csharp', 'cs' => 'csharp',
    'ruby' => 'ruby', 'rb' => 'ruby',
    'php' => 'php',
    'go' => 'go',
    'rust' => 'rust', 'rs' => 'rust',
    'kotlin' => 'kotlin', 'kt' => 'kotlin',
    'swift' => 'swift',
    'typescript' => 'typescript', 'ts' => 'typescript',
    'bash' => 'bash', 'sh' => 'bash',
    'r' => 'r',
    'perl' => 'perl', 'pl' => 'perl',
    'lua' => 'lua',
    'haskell' => 'haskell', 'hs' => 'haskell',
    'elixir' => 'elixir', 'exs' => 'elixir',
    'clojure' => 'clojure', 'clj' => 'clojure',
    'dart' => 'dart',
    'assembly' => 'assembly', 'asm' => 'assembly',
    'fortran' => 'fortran', 'f90' => 'fortran',
    'julia' => 'julia', 'jl' => 'julia',
    'cobol' => 'cobol', 'cbl' => 'cobol',
    'vb' => 'vbnet', 'vba' => 'vbnet',
    'scala' => 'scala',
    'racket' => 'racket', 'rkt' => 'racket',
    'erlang' => 'erlang', 'erl' => 'erlang',
    'fsharp' => 'fsharp', 'fs' => 'fsharp',
    'groovy' => 'groovy', 'gvy' => 'groovy',
    'powershell' => 'powershell', 'ps1' => 'powershell',
    'sql' => 'sql'
  }.freeze

  API_URL = "https://emkc.org/api/v2/piston/execute".freeze

  def self.run(code, language, options = {})
    piston_lang = normalize_language(language)
    raise Error, "Language '#{language}' not supported" unless piston_lang

    payload = {
      language: piston_lang,
      version: options[:version] || "*",
      files: [{ content: code }],
      stdin: options[:stdin] || "",
      args: options[:args] || [],
      compile_timeout: options[:compile_timeout] || 10000,
      run_timeout: options[:run_timeout] || 5000,
      compile_memory_limit: options[:compile_memory_limit] || -1,
      run_memory_limit: options[:run_memory_limit] || -1
    }

    response = HTTParty.post(API_URL,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' },
      timeout: options[:timeout] || 30
    )

    unless response.success?
      raise Error, "API Error: #{response.code} - #{response.message}"
    end

    parse_response(response.parsed_response)
  end

  def self.execute(code, language, options = {})
    run(code, language, options)
  end

  def self.eval_code(code, language, options = {})
    run(code, language, options)
  end

  def self.supported_languages
    SUPPORTED_LANGUAGES.keys.uniq.sort
  end

  def self.supported?(language)
    !normalize_language(language).nil?
  end

  def self.version
    "1.0.2"
  end

  private

  def self.normalize_language(lang)
    SUPPORTED_LANGUAGES[lang.to_s.downcase]
  end

  def self.parse_response(data)
    output = data.dig('run', 'output') || ''
    error = data.dig('run', 'stderr') || ''
    compile_output = data.dig('compile', 'output') || ''
    
    output = output.force_encoding('UTF-8') if output.encoding != Encoding::UTF_8
    error = error.force_encoding('UTF-8') if error.encoding != Encoding::UTF_8
    compile_output = compile_output.force_encoding('UTF-8') if compile_output.encoding != Encoding::UTF_8

    {
      success: data.dig('run', 'code') == 0,
      output: output,
      error: error,
      compile_output: compile_output,
      language: data['language'],
      version: data['version'],
      code: data.dig('run', 'code')
    }
  end
end