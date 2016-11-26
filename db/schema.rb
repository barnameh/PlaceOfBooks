# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161125142623) do

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id",   null: false
    t.integer "author_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.boolean  "available"
    t.text     "description"
    t.datetime "publication_date"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "book_id"
    t.datetime "loan_date"
    t.datetime "due_date"
    t.datetime "return_date"
  end

end
