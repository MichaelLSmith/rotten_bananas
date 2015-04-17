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

ActiveRecord::Schema.define(version: 2) do

  create_table "movies", force: true do |t|
    t.string   "director"
    t.string   "leadactor"
    t.string   "supporting_actor"
    t.string   "genre"
    t.date     "release_date"
    t.string   "title"
    t.text     "poster_image_url"
    t.time     "running_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "reviews_id"
  end

  create_table "reviews", force: true do |t|
    t.integer "rating"
    t.text    "review_text"
    t.text    "movie_summary"
    t.float   "rating_number_value"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
