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

ActiveRecord::Schema.define(version: 20180208203308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "full_name"
  end

  create_table "pairs", force: :cascade do |t|
    t.integer  "base_currency_id"
    t.integer  "quote_currency_id"
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["base_currency_id"], name: "index_pairs_on_base_currency_id", using: :btree
    t.index ["quote_currency_id"], name: "index_pairs_on_quote_currency_id", using: :btree
  end

  create_table "tickers", force: :cascade do |t|
    t.decimal  "bid"
    t.integer  "pair_id"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_tickers_on_pair_id", using: :btree
  end

  add_foreign_key "pairs", "currencies", column: "base_currency_id"
  add_foreign_key "pairs", "currencies", column: "quote_currency_id"
  add_foreign_key "tickers", "pairs"
end
