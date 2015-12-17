# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151216082128) do

  create_table "addresses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "lat",        limit: 24
    t.float    "lng",        limit: 24
    t.integer  "review_id",  limit: 4
    t.integer  "region_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["region_id"], name: "index_addresses_on_region_id", using: :btree
  add_index "addresses", ["review_id"], name: "index_addresses_on_review_id", using: :btree

  create_table "avatars", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.string   "user_id",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "rating",     limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "review_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "descriptions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.integer  "review_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "descriptions", ["review_id"], name: "index_descriptions_on_review_id", using: :btree

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "stars",         limit: 24,  null: false
    t.string   "dimension",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id",   limit: 4
    t.string   "cacheable_type", limit: 255
    t.float    "avg",            limit: 24,  null: false
    t.integer  "qty",            limit: 4,   null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "review_images", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.string   "review_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "content",      limit: 65535
    t.integer  "phone_number", limit: 4
    t.boolean  "portable"
    t.float    "rating",       limit: 24
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
  end

  add_foreign_key "addresses", "regions"
  add_foreign_key "addresses", "reviews"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "descriptions", "reviews"
  add_foreign_key "reviews", "users"
end
