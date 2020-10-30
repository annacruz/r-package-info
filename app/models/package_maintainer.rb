class PackageMaintainer < ApplicationRecord
    belongs_to :package
    belongs_to :maintainer, class_name: 'Person'
end
