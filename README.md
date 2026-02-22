<div align="center">
  <h1>ruby-code-runner</h1>
  <p><strong>Run code in 40+ programming languages – simple, fast, and perfect for learning!</strong></p>
  
  <a href="https://rubygems.org/gems/ruby-code-runner">
    <img src="https://img.shields.io/gem/v/ruby-code-runner?color=red&style=flat-square" alt="Gem Version">
  </a>
  <a href="https://github.com/monji024/ruby-code-runner">
    <img src="https://img.shields.io/github/stars/monji024/ruby-code-runner?style=flat-square" alt="GitHub Stars">
  </a>
  <a href="https://github.com/monji024/ruby-code-runner/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/monji024/ruby-code-runner?style=flat-square" alt="MIT License">
  </a>
  <a href="https://rubygems.org/gems/ruby-code-runner">
    <img src="https://img.shields.io/gem/dt/ruby-code-runner?style=flat-square" alt="Downloads">
  </a>
</div>

<br>

## Features

Here's what you can do with Code-Runner:

- **40+ languages** – Python, Ruby, JavaScript, Java, C++, Go, Rust, and many more
- **Instant execution** – Write code, run it, see results. No setup needed
- **Pass input** – Your code can read from stdin, just like a real program
- **Command line args** – Test how your script handles arguments
- **Timeouts** – No more infinite loops crashing your app
- **Clean output** – Get stdout, stderr, and compiler messages separately

<br>

## Installation

```bash
gem install ruby-code-runner
```

```Ruby
require 'code-runner'

# Ruby
result = CodeRunner.run('puts "Hello World!"', 'ruby')
puts result[:output]  # Hello World!
```

```Ruby
# Python
result = CodeRunner.run('print("Hello Python!")', 'python')
puts result[:output]  # Hello Python!
```
```Ruby
# JavaScript
result = CodeRunner.run('console.log("Hello JS!")', 'javascript')
puts result[:output]  # Hello JS!
```

## 1. Simple math

```Ruby
# Ruby
result = CodeRunner.run('puts 2 + 2', 'ruby')
puts result[:output]  # 4
```
```Ruby
# Python
result = CodeRunner.run('print(3 * 4)', 'python')
puts result[:output]  # 12
```
## 2. Reading input (stdin)

```Ruby
code = <<~PYTHON
name = input("What's your name? ")
print(f"Hello {name}!")
PYTHON

result = CodeRunner.run(code, 'python', stdin: "Monji")
puts result[:output]
```
# What's your name? Hello Monji!

## 3. Command line arguments

```Ruby
code = 'puts "Args: #{ARGV.join(", ")}"'
result = CodeRunner.run(code, 'ruby', args: ["hello", "world"])
puts result[:output]  # Args: hello, world
```
## 4. Error handling

```Ruby
result = CodeRunner.run('print(1 / 0)', 'python')

if result[:success]
  puts "ok : #{result[:output]}"
else
  puts "err : #{result[:error]}"
end
```

## Supported Languages

full list:

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="16" height="16"> Python
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original.svg" width="16" height="16"> Ruby
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="16" height="16"> JavaScript
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" width="16" height="16"> Java
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg" width="16" height="16"> C
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" width="16" height="16"> C++
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg" width="16" height="16"> C#
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/php/php-original.svg" width="16" height="16"> PHP
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/go/go-original.svg" width="16" height="16"> Go
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/rust/rust-original.svg" width="16" height="16"> Rust
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" width="16" height="16"> Bash
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.svg" width="16" height="16"> Swift
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kotlin/kotlin-original.svg" width="16" height="16"> Kotlin
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" width="16" height="16"> TypeScript
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg" width="16" height="16"> Dart
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/r/r-original.svg" width="16" height="16"> R
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/perl/perl-original.svg" width="16" height="16"> Perl
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/lua/lua-original.svg" width="16" height="16"> Lua
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/haskell/haskell-original.svg" width="16" height="16"> Haskell
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/elixir/elixir-original.svg" width="16" height="16"> Elixir
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/erlang/erlang-original.svg" width="16" height="16"> Erlang
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/clojure/clojure-original.svg" width="16" height="16"> Clojure
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/scala/scala-original.svg" width="16" height="16"> Scala
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fortran/fortran-original.svg" width="16" height="16"> Fortran
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/julia/julia-original.svg" width="16" height="16"> Julia
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/groovy/groovy-original.svg" width="16" height="16"> Groovy




# 📬 Get in Touch

| | |
|---|---|
| **GitHub** | [monji024](https://github.com/monji024) |
| **RubyGems** | [code-runner](https://rubygems.org/gems/ruby-code-runner) |

---

# Show Your Support

If you find this gem useful, here's how you can support me:

## ⭐ Star it on GitHub
Visit [github.com/monji024/ruby-code-runner](https://github.com/monji024/ruby-code-runner) and click the ★ button.
