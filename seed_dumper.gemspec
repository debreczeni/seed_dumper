#!/usr/bin/env gem build
# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require "base64"

Gem::Specification.new do |s|
  s.name = "seed_dumper"
  s.version = '0.1.4'
  s.authors = ["Rob Halff", "Kevin Edwards", "David Debreczeni"]
  s.homepage = "http://github.com/debreczeni/seed_dumper"
  s.summary = "Create seed files for models based on your model files and database data"
  s.description = "#{s.summary}."
  s.email = "david.debreczeni@gmail.com"

  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.rdoc",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "lib/seed_dumper.rb",
    "lib/seed_dumper/railtie.rb",
    "lib/seed_dumper/fetcher.rb",
    "lib/seed_dumper/writer.rb",
    "lib/tasks/seed_dumper.rake",
    "seed_dumper.gemspec"
  ]
  s.require_paths = ["lib"]
  s.add_dependency 'rails'
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{{Seed Dumper for Rails}}
  s.test_files = [
    "test/seed_dumper_test.rb",
    "test/test_helper.rb"
  ]
  s.post_install_message = %q{
================================================================================

Rails 2.x
---------
If you are using SeedDumper with Rails 2.x you will need to place the following at 
the end of your Rakefile so Rubygems can load the SeedDumper tasks;

  require 'seed_dumper'
  SeedDumper.load_tasks if defined?(SeedDumper)

Rails 3.x
---------
Your work here is done!

================================================================================
} 
end
