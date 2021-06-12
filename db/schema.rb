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

ActiveRecord::Schema.define(version: 2021_06_09_084958) do

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.string "purpose"
    t.integer "estimated_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.string "commented_type", null: false
    t.integer "commented_id", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["commented_type", "commented_id"], name: "index_comments_on_commented"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "discussion_topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "campaign_id"
    t.string "topic_creator_type", null: false
    t.integer "topic_creator_id", null: false
    t.index ["campaign_id"], name: "index_discussion_topics_on_campaign_id"
    t.index ["topic_creator_type", "topic_creator_id"], name: "index_discussion_topics_on_topic_creator"
    t.index ["user_id"], name: "index_discussion_topics_on_user_id"
  end

  create_table "do_lists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "campaign_id"
    t.boolean "completed"
    t.index ["campaign_id"], name: "index_do_lists_on_campaign_id"
  end

  create_table "experts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "novices", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "campaign_id"
    t.index ["campaign_id"], name: "index_tags_on_campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "profession"
    t.string "service"
    t.integer "status"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end