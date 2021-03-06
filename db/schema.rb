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

ActiveRecord::Schema.define(version: 20171023195754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer  "connector_id"
    t.integer  "connectee_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "connections", ["connectee_id"], name: "index_connections_on_connectee_id", using: :btree
  add_index "connections", ["connector_id"], name: "index_connections_on_connector_id", using: :btree

  create_table "ignoreds", force: :cascade do |t|
    t.integer  "ignorer_id"
    t.integer  "ignoree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ignoreds", ["ignoree_id"], name: "index_ignoreds_on_ignoree_id", using: :btree
  add_index "ignoreds", ["ignorer_id"], name: "index_ignoreds_on_ignorer_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invitations", ["invitee_id"], name: "index_invitations_on_invitee_id", using: :btree
  add_index "invitations", ["inviter_id"], name: "index_invitations_on_inviter_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "description"
  end

end
