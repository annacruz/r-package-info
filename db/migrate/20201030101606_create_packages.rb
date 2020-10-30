class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :version
      t.string :date_publication
      t.string :title
      t.string :description

      t.references :author, null: false, foreign_key: { to_table: :people }
      t.references :maintainer, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end

  end
end
