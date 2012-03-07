require 'rake' unless defined?(Rake)
require 'rails' unless defined?(Rails)

module SeedDumper
  VERSION = '0.1.5'

  autoload :Fetcher, 'seed_dumper/fetcher'
  autoload :Writer, 'seed_dumper/writer'

  def self.load_tasks
    Dir[File.expand_path("tasks/*.rake", File.dirname(__FILE__))].each { |ext| load ext }
  end

  require 'seed_dumper/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end
