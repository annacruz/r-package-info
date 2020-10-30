require 'rails_helper'

RSpec.describe PackageBuilderService, type: :service do
    describe "#build" do
        let(:package_hash) {{"Package"=>"A3", "Type"=>"Package", "Title"=>"Accurate, Adaptable, and Accessible Error Metrics for Predictive Models", "Version"=>"1.0.0", "Date"=>"2015-08-15", "Author"=>"Scott Fortmann-Roe", "Maintainer"=>"Scott Fortmann-Roe <scottfr@berkeley.edu>", "Description"=>"Supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.", "License"=>"GPL (>= 2)", "Depends"=>"R (>= 2.15.0), xtable, pbapply", "Suggests"=>"randomForest, e1071", "NeedsCompilation"=>"no", "Packaged"=>"2015-08-16 14", "Repository"=>"CRAN", "Date/Publication"=>"2015-08-16 23"}}
        let(:package) {PackageBuilderService.build(package_hash)}

        it "mount a package and return it" do
            expect(package.name).to eq("A3")
            expect(package.version).to eq("1.0.0")    
        end

        it "mount correctly package author and maintainer" do
            expect(package.author.name).to eq("Scott Fortmann-Roe")
            expect(package.author.email).to eq("scottfr@berkeley.edu")
        end
    end
end