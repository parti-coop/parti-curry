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

ActiveRecord::Schema.define(version: 20151217134742) do

  create_table "administrative_notices", force: :cascade do |t|
    t.integer "ogAdmPpSeq"
    t.text    "admRulNm"
    t.string  "lsClsNm"
    t.string  "asndOfiNm"
    t.string  "pntcNo"
    t.string  "pntcDt"
    t.string  "stYd"
    t.string  "edYd"
    t.string  "FileName"
    t.string  "FileDownLink"
    t.integer "readCnt"
    t.string  "mappingAdmRulSeq"
    t.string  "announceType"
    t.string  "lmTpNm"
    t.string  "telNo"
    t.string  "faxNo"
    t.string  "email"
    t.text    "admPpCts"
    t.text    "ogAdmFlList"
    t.text    "ptcpAdmPpFlList"
  end

  add_index "administrative_notices", ["pntcNo"], name: "index_administrative_notices_on_pntcNo", unique: true

  create_table "draft_bill_notices", force: :cascade do |t|
    t.integer "ogLmPpSeq"
    t.text    "lsNm"
    t.string  "lsClsNm"
    t.string  "asndOfiNm"
    t.string  "pntcNo"
    t.string  "pntcDt"
    t.string  "stYd"
    t.string  "edYd"
    t.string  "FileName"
    t.string  "FileDownLink"
    t.integer "readCnt"
    t.string  "mappingLbicId"
    t.string  "announceType"
    t.string  "lmTpNm"
    t.string  "telNo"
    t.string  "faxNo"
    t.string  "email"
    t.text    "lmPpCts"
    t.text    "ogLsFlList"
    t.text    "ogLmPpFlList"
  end

  add_index "draft_bill_notices", ["pntcNo"], name: "index_draft_bill_notices_on_pntcNo", unique: true

  create_table "notices", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
