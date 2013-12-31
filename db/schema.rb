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

ActiveRecord::Schema.define(version: 20131226215813) do

  create_table "boards", force: true do |t|
    t.string   "cells"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "player_id_1"
    t.integer  "player_id_2"
    t.integer  "player_id_3"
    t.integer  "player_id_4"
    t.time     "game_time"
    t.integer  "winner_id"
    t.integer  "coins"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attack_board_id_1"
    t.integer  "defend_board_id_1"
    t.integer  "attack_board_id_2"
    t.integer  "defend_board_id_2"
    t.integer  "attack_board_id_3"
    t.integer  "defend_board_id_3"
    t.integer  "attack_board_id_4"
    t.integer  "defend_board_id_4"
  end

  create_table "ships", force: true do |t|
    t.string   "name"
    t.integer  "size"
    t.integer  "start_row"
    t.integer  "start_col"
    t.integer  "direction"
    t.string   "image"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turns", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "row"
    t.integer  "col"
    t.boolean  "hit"
    t.boolean  "sunk"
    t.integer  "ship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_name"
    t.integer  "level",                  default: 1
    t.integer  "coins",                  default: 0
    t.integer  "battles_won",            default: 0
    t.integer  "battles_lost",           default: 0
    t.integer  "battles_tied",           default: 0
    t.integer  "experience_points",      default: 0
    t.boolean  "available",              default: false
    t.boolean  "online",                 default: false
    t.boolean  "gaming",                 default: false
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_image",           default: "avatars/unknown.jpg"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
