# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_11_130654) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "objective_id", null: false
    t.integer "radius_id", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_budgets_on_objective_id"
    t.index ["radius_id"], name: "index_budgets_on_radius_id"
  end

  create_table "campaign_channel_mixes", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "channel_mix_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_channel_mixes_on_campaign_id"
    t.index ["channel_mix_id"], name: "index_campaign_channel_mixes_on_channel_mix_id"
  end

  create_table "campaign_sub_channels", force: :cascade do |t|
    t.string "name"
    t.integer "campaign_id", null: false
    t.integer "sub_channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_sub_channels_on_campaign_id"
    t.index ["sub_channel_id"], name: "index_campaign_sub_channels_on_sub_channel_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "objective_id"
    t.index ["objective_id"], name: "index_campaigns_on_objective_id"
  end

  create_table "channel_mixes", force: :cascade do |t|
    t.string "name"
    t.integer "objective_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_channel_mixes_on_objective_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radius", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "channel_mix_id"
  end

  add_foreign_key "budgets", "objectives"
  add_foreign_key "budgets", "radius", column: "radius_id"
  add_foreign_key "campaign_channel_mixes", "campaigns"
  add_foreign_key "campaign_channel_mixes", "channel_mixes"
  add_foreign_key "campaign_sub_channels", "campaigns"
  add_foreign_key "campaign_sub_channels", "sub_channels"
  add_foreign_key "campaigns", "objectives"
end
