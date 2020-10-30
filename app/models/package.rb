class Package < ApplicationRecord
    has_many :package_authors
    has_many :authors, through: :package_authors, class_name: 'Person'
    has_many :package_maintainers
    has_many :maintainers, through: :package_maintainers, class_name: 'Person'
end
