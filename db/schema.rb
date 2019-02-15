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

ActiveRecord::Schema.define(version: 20190214160131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.string "state"
    t.string "city"
    t.string "latitude"
    t.string "longitude"
  end

  add_index "locations", ["latitude"], name: "index_locations_on_latitude", unique: true, using: :btree
  add_index "locations", ["longitude"], name: "index_locations_on_longitude", unique: true, using: :btree

  create_table "weathers", force: true do |t|
    t.datetime "w_day"
    t.text     "temperature", default: [], array: true
    t.integer  "location_id"
  end

  add_index "weathers", ["w_day"], name: "index_weathers_on_w_day", using: :btree

end
