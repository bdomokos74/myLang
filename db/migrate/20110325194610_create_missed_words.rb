class CreateMissedWords < ActiveRecord::Migration
  def self.up
    create_table :missed_words do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :count

      t.timestamps
    end
    add_index :missed_words, :user_id    
    add_index :missed_words, :count
  end

  def self.down
    drop_table :missed_words
  end
end
