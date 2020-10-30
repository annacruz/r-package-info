class Package < ApplicationRecord
    belongs_to :author, class_name: 'Person'
    belongs_to :maintainer, class_name: 'Person'

end
