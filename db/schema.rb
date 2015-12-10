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

ActiveRecord::Schema.define(version: 20151210134637) do

  create_table "currencies", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payees", force: :cascade do |t|
    t.string   "email"
    t.string   "sign_up_url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "signed",      default: false
    t.string   "return_tag"
    t.float    "balance",     default: 0.0
    t.integer  "currency_id"
  end

  create_table "payouts", force: :cascade do |t|
    t.string   "payment_id"
    t.float    "amount"
    t.text     "description"
    t.string   "response_code"
    t.string   "response_description"
    t.integer  "payee_id"
    t.integer  "currency_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "payouts", ["currency_id"], name: "index_payouts_on_currency_id"
  add_index "payouts", ["payee_id"], name: "index_payouts_on_payee_id"

end
