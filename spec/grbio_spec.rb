require 'spec_helper'

describe Grbio do

  it 'has a version number' do
    expect(Grbio::VERSION).not_to be nil
  end

  context 'resource availability' do
    VCR.use_cassette(:ping) do
      Grbio::SOURCE_DATA.each do |k,v|
        specify "#{k} is locatable" do
          r = Net::HTTP.get_response(URI.parse(v)) 
          expect( r.code =~ /2|3\d{2}/ ).to be_truthy
        end
      end
    end
  end

  context '::download_resources' do
    VCR.use_cassette(:download) do
      before(:all) { Grbio.download_resources }
    end

    specify 'creates/uses a directory' do
      expect(Dir.exists?('/tmp')).to be_truthy
    end

    specify 'gets and writes files' do
      Grbio::SOURCE_DATA.each do |k, v|
        expect(File.exists?("/tmp/#{k}.csv")).to be_truthy
      end
    end

    specify '::headers' do
      expect(Grbio.headers(:institutions)).to include(:cool_uri)
    end

  end


end
