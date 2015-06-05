Gem::Specification.new do |s|
  s.name        = "hash_formatter"
  s.version     = "0.0.1"
  s.summary     = "Formats Ruby Hashes"
  s.description = "Hash Formatter is a library that formats Ruby hashes for code editors."
  s.authors     = ["Norman Clarke"]
  s.email       = ["norman@njclarke.com"]
  s.homepage    = "https://github.com/norman/hash_formatter"
  s.files       = `git ls-files`.split("\n")
  s.license     = "MIT"

  s.add_dependency 'ruby2ruby'
  s.add_dependency 'ruby_parser'
  s.add_development_dependency 'rake'
end

