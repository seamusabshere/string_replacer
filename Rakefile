require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "string_replacer"
    gem.summary = %Q{Repeatedly replace text in a file without disturbing the rest of the file.}
    gem.description = %Q{For example, if you need to make sure that a particular package is unmasked in /etc/portage/package.keywords/local, you can use string_replacer to put it there without disturbing the other lines.}
    gem.email = "seamus@abshere.net"
    gem.homepage = "http://github.com/seamusabshere/string_replacer"
    gem.authors = ["Seamus Abshere"]
    gem.executables = ['string_replacer']
    # sabshere 9/22/10 currently no tests
    # gem.add_development_dependency "shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# sabshere 9/22/10 currently no tests
# require 'rake/testtask'
# Rake::TestTask.new(:test) do |test|
#   test.libs << 'lib' << 'test'
#   test.pattern = 'test/**/test_*.rb'
#   test.verbose = true
# end
# 
# begin
#   require 'rcov/rcovtask'
#   Rcov::RcovTask.new do |test|
#     test.libs << 'test'
#     test.pattern = 'test/**/test_*.rb'
#     test.verbose = true
#   end
# rescue LoadError
#   task :rcov do
#     abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
#   end
# end
# 
# task :test => :check_dependencies
# 
# task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "string_replacer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
