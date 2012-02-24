module SeedDumper

  # Dumper
  class Fetcher

    def self.fetch_data(model)
      ignore = ['created_at', 'updated_at']
      ignore << 'id' unless ENV['WITH_ID'] == '1'
      ENV['IGNORE'].split(',').each { |to_ignore| ignore << to_ignore } if ENV['IGNORE']

      model_name = model.name.camelize

      puts "Adding #{model_name} seeds."

      records = model.all.map do |record|
        attr_s = [];

        record.attributes.each do |key, value|
          next if ignore.include?(key)
          value = value.class == Time ? "\"#{value}\"" : value.inspect
          value = nil if value.is_a?(String) && value == "\"\""
          value = nil if value == 'nil' || value == "nil"
          next if value.nil?
          attr_s.push(":#{key} => #{value}")
        end

        "#{model_name}.create(#{attr_s.join(', ')})"
      end

      records
    end

  end

end
