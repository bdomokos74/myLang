class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :item_id
      t.integer :quiz_id

      t.timestamps
    end
    add_index :questions, :quiz_id
    add_index :questions, :item_id
    add_index :questions, [:quiz_id, :item_id], :unique => true
  end

  def self.down
    drop_table :questions
  end
end
