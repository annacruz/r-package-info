class PackageBuilderService
    def self.build(package_hash)
        author = PersonBuilderService.build_one(package_hash["Author"])
        maintainer = PersonBuilderService.build_one(package_hash["Maintainer"])

        package = Package.new(
            name: package_hash["Package"],
            title: package_hash["Title"],
            description: package_hash["Description"],
            version: package_hash["Version"],
            author: author.reload,
            maintainer: maintainer.reload
        )

        package.save!
        package
    end
end