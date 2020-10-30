class Person < ApplicationRecord
    has_many :author_packages, class_name: 'Package', foreign_key: 'author_id'
    has_many :maintainer_packages, class_name: 'Package', foreign_key: 'maintainer_id'
end
