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

ActiveRecord::Schema.define(version: 20140919150752) do

  create_table "film_slice_lessons", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "film_slice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "film_slice_lessons", ["film_slice_id"], name: "index_film_slice_lessons_on_film_slice_id"
  add_index "film_slice_lessons", ["lesson_id"], name: "index_film_slice_lessons_on_lesson_id"

  create_table "film_slices", force: true do |t|
    t.time     "start_at"
    t.time     "stop_at"
    t.string   "title"
    t.string   "state"
    t.text     "description"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films", force: true do |t|
    t.string   "title"
    t.string   "state"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "langs", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.string   "title"
    t.string   "state"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_files", force: true do |t|
    t.string   "url"
    t.string   "state"
    t.integer  "lang_id"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_files", ["film_id"], name: "index_sub_files_on_film_id"
  add_index "sub_files", ["lang_id"], name: "index_sub_files_on_lang_id"

  create_table "taggets", force: true do |t|
    t.integer  "target_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggets", ["tag_id"], name: "index_taggets_on_tag_id"
  add_index "taggets", ["target_id"], name: "index_taggets_on_target_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_files", force: true do |t|
    t.string   "url"
    t.string   "state"
    t.integer  "lang_id"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_files", ["film_id"], name: "index_video_files_on_film_id"
  add_index "video_files", ["lang_id"], name: "index_video_files_on_lang_id"

end