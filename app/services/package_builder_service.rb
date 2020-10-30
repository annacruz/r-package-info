class PackageBuilderService
    def self.build(package_hash)
        authors = PersonBuilderService.build(package_hash["Author"])
        maintainers = PersonBuilderService.build(package_hash["Maintainer"])

        package = Package.new(
            name: package_hash["Package"],
            title: package_hash["Title"],
            description: package_hash["Description"],
            version: package_hash["Version"],
            authors: authors,
            maintainers: maintainers
        )
        package.save!
        package
    end
end