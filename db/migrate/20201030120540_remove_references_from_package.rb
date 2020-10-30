class RemoveReferencesFromPackage < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:packages, :author, foreign_key: { to_table: :people })
    remove_reference(:packages, :maintainer, foreign_key: { to_table: :people })
  end
end
