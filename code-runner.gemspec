# code-runner.gemspec
Gem::Specification.new do |s|
  s.name          = "ruby-code-runner"
  s.version       = "1.0.3"
  s.summary       = "Run code in 40+ languages"
  s.description   = "a simple gem to compile and execute code in 40+ programming languages"
  s.author        = "Monji"
  s.email         = "hoseinmonjiofficial@gmail.com"
  s.homepage      = "https://github.com/monji024/code-runner"
  s.license       = "MIT"
  s.files         = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.6.0"
  
  s.add_dependency "httparty", "~> 0.21"
  s.add_development_dependency "minitest", "~> 5.18"
  s.add_development_dependency "rake", "~> 13.0"
  
s.metadata = {
  "source_code_uri" => "https://github.com/monji024/ruby-code-runner",
  "rubygems_mfa_required" => "false"
}
end