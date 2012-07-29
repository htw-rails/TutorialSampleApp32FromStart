class AddNickToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
  end
  add_index :users, :nick, unique: true
end
