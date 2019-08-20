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

ActiveRecord::Schema.define(version: 2019_08_20_192231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "timescaledb"

  create_table "conditions", id: false, force: :cascade do |t|
    t.datetime "time", null: false
    t.text "location", null: false
    t.float "temperature"
    t.float "humidity"
    t.index ["time"], name: "conditions_time_idx", order: :desc
  end

  create_table "stats", id: false, force: :cascade do |t|
    t.date "date", null: false
    t.integer "clicks"
    t.integer "webpage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date", "clicks"], name: "stats_date_clicks_idx", order: { date: :desc }
    t.index ["date"], name: "index_stats_on_date", unique: true
  end

end
