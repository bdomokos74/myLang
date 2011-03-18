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

ActiveRecord::Schema.define(:version => 20110317012842) do

  create_table "answers", :force => true do |t|
    t.string   "text"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["quiz_id"], :name => "index_answers_on_quiz_id"

  create_table "items", :force => true do |t|
    t.string   "expression"
    t.string   "translation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "item_id"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["item_id"], :name => "index_questions_on_item_id"
  add_index "questions", ["quiz_id", "item_id"], :name => "index_questions_on_quiz_id_and_item_id", :unique => true
  add_index "questions", ["quiz_id"], :name => "index_questions_on_quiz_id"

  create_table "quizzes", :force => true do |t|
    t.string   "status"
    t.integer  "curr_step"
    t.integer  "duration"
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quizzes", ["user_id"], :name => "index_quizzes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
