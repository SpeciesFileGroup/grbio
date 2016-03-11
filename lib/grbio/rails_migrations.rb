require 'tilt'

module Grbio
  module RailsMigration

    class << self

      def generate_migration(file)
        template = Tilt::ERBTemplate.new( __dir__ + '/templates/migration.erb')
        template.render(self, file: file, fields: Grbio.headers(file)) 
      end

      def all_migrations
        Grbio::SOURCE_DATA.each do |k,v|
          puts generate_migration(k)
        end
      end

      # STI style migrations

      def collections_migration
        template = Tilt::ERBTemplate.new( __dir__ + '/templates/collections_migration.erb')
        puts template.render(self, file: 'grbio_collections', fields: Grbio::Metadata.collections_fields) 
      end

      def labels_migration
        template = Tilt::ERBTemplate.new( __dir__ + '/templates/labels_migration.erb')
        puts template.render(self, file: 'grbio_labels', fields: Grbio::Metadata.labels_fields) 
      end

      def staff_migration
        template = Tilt::ERBTemplate.new( __dir__ + '/templates/staff_migration.erb')
        puts template.render(self, file: 'grbio_staff', fields: Grbio.headers(:grbio_staff))
      end

      def institutions_migration
        template = Tilt::ERBTemplate.new( __dir__ + '/templates/institutions_migration.erb')
        puts template.render(self, file: 'grbio_institutions', fields: Grbio.headers(:institutions)) 
      end

    end
  end
end
