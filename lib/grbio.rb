
require_relative 'grbio/version'
require_relative 'grbio/metadata'
require_relative 'grbio/rails_migrations'

require 'http'

require 'byebug'

module Grbio

  @existing_headers = []

  ::CSV::HeaderConverters[:uniqify] = lambda do |header|
    s = header.downcase.gsub(/[\/\s]/, '_').gsub(/[^A-Za-z0-9_]/, '') 
    i = 1
    t = s.to_sym
  
    while @existing_headers.include?(t)
      t = "#{s}_#{i}".to_sym
    end

    @existing_headers.push(t)
    t 
  end

  SOURCE_DATA = {
    institutions: 'http://grbio.org/sites/default/files/export/grbio/grbio_institutions.csv',
   
    grbio_staff: 'http://grbio.org/sites/default/files/export/grbio/grbio_staff.csv',

    collections: 'http://grbio.org/sites/default/files/export/grbio/grbio_collections.csv',
    collections_pers: 'http://grbio.org/sites/default/files/export/grbio/grbio_collections_pers.csv',

    institutions_labels: 'http://grbio.org/sites/default/files/export/grbio/grbio_institutions_labels.csv',
    collections_labels: 'http://grbio.org/sites/default/files/export/grbio/grbio_collections_labels.csv',
    collections_pers_labels: 'http://grbio.org/sites/default/files/export/grbio/grbio_collections_pers_labels.csv',
    staff_labels: 'http://grbio.org/sites/default/files/export/grbio/grbio_staff_labels.csv'
  }

  class << self
    def create_directory(dirname)
      unless Dir.exists?(dirname)
        Dir.mkdir(dirname)
      end
    end

    def download_resources(to: '/tmp')
      create_directory(to)
      SOURCE_DATA.each do |k,v|
        f = HTTP.get(v)
        File.write("#{to}/#{k}.csv", f.to_s)
      end
    end

    def file_for(name)
      @existing_headers = []
      CSV.read( path_for(name), { headers:           true,
                                  header_converters: :uniqify } )
    end

    def headers(file)
      @existing_headers = []
      file_for(file).headers
    end

    def path_for(name)
      "/tmp/#{name}.csv"
    end
  end

end
