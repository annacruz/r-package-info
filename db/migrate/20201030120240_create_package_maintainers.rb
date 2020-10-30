class CreatePackageMaintainers < ActiveRecord::Migration[6.0]
  def change
    create_table :package_maintainers do |t|
      t.references :maintainer, foreign_key: {to_table: :people}
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
