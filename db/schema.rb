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

ActiveRecord::Schema.define(version: 20141109115421) do

  create_table "games", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_players"
    t.datetime "starttime"
  end

  create_table "players", force: true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "type"
    t.boolean  "dead",       default: false
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id"

  create_table "rounds", force: true do |t|
    t.integer  "game_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deadline"
    t.boolean  "active"
  end

  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id"

  create_table "votings", force: true do |t|
    t.integer  "round_id"
    t.integer  "voter_id"
    t.integer  "voted_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votings", ["round_id"], name: "index_votings_on_round_id"
  add_index "votings", ["voted_id"], name: "index_votings_on_voted_id"
  add_index "votings", ["voter_id"], name: "index_votings_on_voter_id"

end
