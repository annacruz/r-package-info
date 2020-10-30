require 'rails_helper'

RSpec.describe PackageService, type: :service do
  describe '#get_package_list' do
    before do
      VCR.use_cassette('package_list') do
        @package_list = PackageService.get_package_list
      end
    end

    it "retrieve a hash with the package list" do      
        expect(@package_list.size).to eq(7)
        expect(@package_list[0]["Package"]).to eq("A3")
        expect(@package_list[0]["Version"]).to eq("1.0.0")
    end
  end

  describe '#get_package_description' do
    before do
      package = {"Package" => "A3", "Version" => "1.0.0"}

      VCR.use_cassette('package_description') do
        @package_description = PackageService.get_package_description package
      end
    end

    it "retrieve a hash with the other informations of the package" do
      expect(@package_description["Description"]).to eq("Supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.")
      expect(@package_description["Author"]).to eq("Scott Fortmann-Roe")
      expect(@package_description["Maintainer"]).to eq("Scott Fortmann-Roe <scottfr@berkeley.edu>")
      expect(@package_description["Date/Publication"]).to eq("2015-08-16 23")
    end
  end
end
