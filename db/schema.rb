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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130414153637) do

  create_table "characters", :force => true do |t|
    t.string   "nickname"
    t.integer  "scene_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "characters", ["scene_id"], :name => "index_characters_on_scene_id"

  create_table "lines", :force => true do |t|
    t.string   "content"
    t.string   "kind"
    t.integer  "character_id"
    t.integer  "scene_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "lines", ["character_id"], :name => "index_lines_on_character_id"

  create_table "scenes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "starters", :force => true do |t|
    t.text     "content"
    t.string   "title"
    t.integer  "scene_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "starters", ["scene_id"], :name => "index_starters_on_scene_id"

end
