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

ActiveRecord::Schema.define(:version => 20130616112531) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "ename"
    t.integer  "sort",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "identities", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "ename"
    t.string   "flash"
    t.string   "bimg"
    t.string   "simg"
    t.string   "size"
    t.string   "params"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "play_link"
    t.integer  "category_id"
    t.string   "category"
    t.string   "source"
    t.string   "tags"
    t.text     "target"
    t.text     "operate"
    t.text     "desc"
    t.text     "start"
  end

  create_table "items_tags", :force => true do |t|
    t.integer "item_id"
    t.integer "tag_id"
  end

  create_table "kindeditor_assets", :force => true do |t|
    t.string   "asset"
    t.integer  "file_size"
    t.string   "file_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sysconfigs", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "sort",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "item_id",    :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "nickname"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
    t.boolean  "is_admin"
  end

end
