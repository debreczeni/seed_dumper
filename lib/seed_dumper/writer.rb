module SeedDumper

  class Writer

    def self.write_data(class_name, records)
      seeds_dir = Rails.root.join 'db', 'seeds'
      FileUtils.mkdir(seeds_dir) unless File.exist?(seeds_dir)
      seed_file_name = "#{seeds_dir}/#{class_name.tableize}.rb"

      puts "Writing #{seed_file_name}."
      File.open(seed_file_name, 'w') do |f|
        records.each { |record| f.puts(record) }
      end
    end

  end

end