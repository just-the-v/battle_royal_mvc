# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_05_235149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["users_id"], name: "index_articles_on_users_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.bigint "articles_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["articles_id"], name: "index_comments_on_articles_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.bigint "articles_id"
    t.index ["articles_id"], name: "index_users_on_articles_id"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users", column: "users_id"
  add_foreign_key "comments", "articles", column: "articles_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "users", "articles", column: "articles_id"
end