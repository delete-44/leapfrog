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

ActiveRecord::Schema[7.0].define(version: 2024_04_13_142319) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.text "description"
    t.bigint "parent_node_id"
    t.bigint "child_node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_node_id"], name: "index_connections_on_child_node_id"
    t.index ["parent_node_id"], name: "index_connections_on_parent_node_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "starting_node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["starting_node_id"], name: "index_games_on_starting_node_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_nodes_on_game_id"
  end

  add_foreign_key "connections", "nodes", column: "child_node_id"
  add_foreign_key "connections", "nodes", column: "parent_node_id"
  add_foreign_key "games", "nodes", column: "starting_node_id"
  add_foreign_key "nodes", "games"
end
