class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.string :status
      t.integer :curr_step
      t.integer :duration
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
    add_index :quizzes, :user_id
  end

  def self.down
    drop_table :quizzes
  end
end
