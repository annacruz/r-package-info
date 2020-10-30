# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_30_120540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "package_authors", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "package_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_package_authors_on_author_id"
    t.index ["package_id"], name: "index_package_authors_on_package_id"
  end

  create_table "package_maintainers", force: :cascade do |t|
    t.bigint "maintainer_id"
    t.bigint "package_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maintainer_id"], name: "index_package_maintainers_on_maintainer_id"
    t.index ["package_id"], name: "index_package_maintainers_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.string "date_publication"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "package_authors", "packages"
  add_foreign_key "package_authors", "people", column: "author_id"
  add_foreign_key "package_maintainers", "packages"
  add_foreign_key "package_maintainers", "people", column: "maintainer_id"
end
