Gem::Specification.new do |s|
  s.name = "sprockets"
  s.version = "0.6.0"
  s.date = "2009-02-01"
  s.summary = "JavaScript dependency management and concatenation"
  s.email = "sstephenson@gmail.com"
  s.homepage = "http://github.com/sstephenson/sprockets"
  s.description = "Sprockets is a Ruby library that preprocesses and concatenates JavaScript source files."
  s.has_rdoc = false
  s.authors = ["Sam Stephenson"]
  s.files = Dir["Rakefile", "bin/**/*", "lib/**/*", "test/**/*"]
  s.test_files = Dir["test/test_*.rb"] unless $SAFE > 0
  s.executables = ["sprocketize"]
end
