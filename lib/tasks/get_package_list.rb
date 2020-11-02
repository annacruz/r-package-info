namespace :package do
    desc "get or update the packages" do
        task task: :environment do
            package_list = PackageService.get_package_list
            package_list.map do |package_hash|
                package = Package.find_by(name: package_hash["Package"], version: package_hash["Version"])
                if !package.nil?
                    package_hash = PackageService.get_package_description(package_hash)
                    PackageBuilderService.build_and_save!(package_hash)
                end
            end
        end
    end
end