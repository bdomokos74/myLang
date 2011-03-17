class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :item_id
      t.integer :quiz_id

      t.timestamps
    end
    add_index :question, :quiz_id
  end

  def self.down
    drop_table :questions
  end
end
