require 'spec_helper'
describe Grbio::RailsMigration do
  
  VCR.use_cassette(:download) do
    before(:all) { Grbio.download_resources }
  end

  context "::generate_migration" do
    specify "returns a more or less complete migration" do
      expect(Grbio::RailsMigration.generate_migration(:institutions)).to match(/CreateInstitutions/)
      expect(Grbio::RailsMigration.generate_migration(:institutions)).to match(/Institutions/)
      expect(Grbio::RailsMigration.generate_migration(:institutions)).to match(/t.timestamps/)
      # ... etc.
    end
  end

  context "::all_migrations" do
    specify "puts to screen" do
      expect{ Grbio::RailsMigration.all_migrations }.to output(/CreateInstitutions/).to_stdout
    end 
  end

  specify "::labels_migration" do
    expect{ Grbio::RailsMigration.labels_migration }.to output(/CreateGrbioLabels/).to_stdout
  end 

  specify "::collections_migration" do
    expect{ Grbio::RailsMigration.collections_migration }.to output(/CreateGrbioCollections/).to_stdout
  end

  specify "::staff_migration" do
    expect{ Grbio::RailsMigration.staff_migration }.to output(/CreateGrbioStaff/).to_stdout
  end

  specify "::institutions_migration" do
    expect{ Grbio::RailsMigration.institutions_migration }.to output(/CreateGrbioInstitutions/).to_stdout
  end

end
