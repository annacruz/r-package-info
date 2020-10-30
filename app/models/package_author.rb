class PackageAuthor < ApplicationRecord
    belongs_to :package
    belongs_to :author, class_name: 'Person'
end
