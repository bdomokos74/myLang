class FixUserUidType < ActiveRecord::Migration
  def self.up
    change_column :users, :uid, :string
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
