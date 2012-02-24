namespace :db do
  namespace :seed  do
    desc 'Dump records from the database into db/seeds.rb'
    task :dump => :environment do
      models_to_include = (ENV['MODELS'] || (ENV['MODEL'] ? ENV['MODEL'] : "")).split(',')
      ActiveRecord::Base.connection.tables.map do |table_name|
        model_name = table_name.classify
        next unless models_to_include.include?(model_name) || models_to_include.empty?
        begin model = model_name.constantize rescue next end
        next unless model < ActiveRecord::Base
        SeedDumper::Writer.write_data(model.name, SeedDumper::Fetcher.fetch_data(model))
      end
    end

    desc 'Dump records from a legacy database into db/seeds.rb'
    task :legacy_dump => :environment do
      tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]

      tables.each do |table| 
        model_name = table.pluralize.classify
        body = proc { set_table_name table }
        model = Class.new(ActiveRecord::Base, &body)
        Object.const_set(model_name, model)

        SeedDumper::Writer.write_data model_name, SeedDumper::Fetcher.fetch_data(model)
      end
    end
  end
end
