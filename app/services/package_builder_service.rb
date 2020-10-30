class PackageBuilderService
    def self.build(package_hash)
        author, maintainer = build_people(package_hash)

        package = Package.new(
            name: package_hash["Package"],
            title: package_hash["Title"],
            description: package_hash["Description"],
            version: package_hash["Version"],
            author: author,
            maintainer: maintainer
        )

        package.save!
        package
    end

    private
    def self.build_people(package_hash)
        author_name, author_email = package_hash["Author"].split('<')
        maintainer_name, maintainer_email = package_hash["Maintainer"].split('<')

        author_name = author_name.strip
        maintainer_name = maintainer_name.strip
        author_email = author_email.delete_suffix('>') unless author_email.nil?
        maintainer_email = maintainer_email.delete_suffix('>') unless maintainer_email.nil?
        
        author = Person.find_or_create_by(name: author_name)
        if !author_email.nil?
            author.email = author_email
            author.save!
        end
        maintainer = Person.find_or_create_by(name: maintainer_name)
        if !maintainer_email.nil?
            maintainer.email = maintainer_email
            maintainer.save!
        end
        [ author.reload, maintainer.reload ]
    end
end