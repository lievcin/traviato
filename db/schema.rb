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

ActiveRecord::Schema.define(version: 20180808203628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "unaccent"
  enable_extension "hstore"

  create_table "composers", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "url"
    t.string "uri"
    t.string "country"
    t.text "wikipedia_text"
    t.text "aka"
    t.hstore "information"
    t.integer "date_of_birth"
    t.integer "date_of_death"
    t.index ["uri"], name: "index_composers_on_uri", unique: true
  end

  create_table "listing_mappers", force: :cascade do |t|
    t.string "composer"
    t.string "work"
    t.string "work_uri"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "map_key"
    t.index ["composer", "work"], name: "index_listing_mappers_on_composer_and_work", unique: true
    t.index ["map_key"], name: "listing_mappers_map_key_index"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "source_id"
    t.string "composer"
    t.string "work"
    t.string "additional_text"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "map_key"
    t.string "theatre"
    t.string "city"
    t.string "state"
    t.string "country"
    t.date "date_start"
    t.date "date_end"
    t.integer "performance_count"
    t.index ["map_key"], name: "listings_map_key_index"
    t.index ["source_id"], name: "listings_source_id_index"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "work"
    t.string "composer"
    t.string "theatre"
    t.date "review_date"
    t.text "full_text"
    t.integer "rating"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "url"
    t.decimal "sentiment_score"
    t.decimal "sentiment_magnitude"
    t.string "map_key"
    t.integer "source_id"
    t.index ["source_id"], name: "index_reviews_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.text "comments"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "content"
  end

  create_table "theatre_mapping", force: :cascade do |t|
    t.string "name"
    t.string "opera_america_name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "uri"
    t.string "composer_uri"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "composer_id"
    t.text "wikipedia_text"
    t.text "aka"
    t.string "work_type"
    t.hstore "information"
    t.integer "premiere_date"
    t.index "to_tsvector('english'::regconfig, (name)::text)", name: "works_to_tsvector_idx1", using: :gin
    t.index "to_tsvector('english'::regconfig, aka)", name: "works_to_tsvector_idx", using: :gin
    t.index "to_tsvector('english'::regconfig, wikipedia_text)", name: "works_to_tsvector_idx2", using: :gin
    t.index ["uri", "composer_uri"], name: "index_works_on_uri_and_composer_uri", unique: true
  end

end
