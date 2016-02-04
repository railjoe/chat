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

ActiveRecord::Schema.define(version: 20160121144916) do

  create_table "chat_conversation_hedears", force: :cascade do |t|
    t.integer  "client_1_id"
    t.integer  "client_2_id"
    t.datetime "last_read_client_1"
    t.datetime "last_read_client_2"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chat_conversation_hedears", ["client_1_id"], name: "index_chat_conversation_hedears_on_client_1_id"
  add_index "chat_conversation_hedears", ["client_2_id"], name: "index_chat_conversation_hedears_on_client_2_id"
  add_index "chat_conversation_hedears", ["conversation_id"], name: "index_chat_conversation_hedears_on_conversation_id"

  create_table "chat_conversations", force: :cascade do |t|
    t.string   "last_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "client_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chat_messages", ["client_id"], name: "index_chat_messages_on_client_id"
  add_index "chat_messages", ["conversation_id"], name: "index_chat_messages_on_conversation_id"
  add_index "chat_messages", ["created_at"], name: "index_chat_messages_on_created_at"

end
