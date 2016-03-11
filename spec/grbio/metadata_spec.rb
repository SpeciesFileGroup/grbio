require 'spec_helper'

describe Grbio::Metadata do
  VCR.use_cassette(:download) do
    before(:all) { Grbio.download_resources }
  end

  specify "csv headers match parsed labels" do
    f = Grbio.file_for(:institutions).headers
    i = Grbio.headers(:institutions)
    i.each do |h|
      expect(f).to include(h)
    end 
  end

  specify "::report returns all headers" do
    expect(Grbio::Metadata.report).to match(/staff_labels/) 
  end

  specify "personal and institution collections have the same fields" do
    expect(Grbio::Metadata.collections_unified?).to eq([])
  end

  specify "_labels have the same fields" do
    expect(Grbio::Metadata.labels_unified?).to eq([])
  end

  specify "::labels_fields" do
    expect(Grbio::Metadata.labels_fields).to be_truthy
  end

  specify "::collections_fields" do
    expect(Grbio::Metadata.collections_fields).to be_truthy
  end

end
