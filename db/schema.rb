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

ActiveRecord::Schema.define(version: 20170923061007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer_word"
    t.boolean  "accurate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: :cascade do |t|
    t.boolean  "started",    default: false
    t.boolean  "finished",   default: false
    t.string   "category",   default: "spelling"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "word_id"
    t.integer  "answer_id"
  end

  add_index "exercises", ["answer_id"], name: "index_exercises_on_answer_id", using: :btree
  add_index "exercises", ["word_id"], name: "index_exercises_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "complete_word"
    t.string   "audio_source"
    t.string   "letter_pool",   array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "exercises", "answers"
  add_foreign_key "exercises", "words"
end
