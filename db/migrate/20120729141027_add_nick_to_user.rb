class AddNickToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
    add_index :users, :nick, unique: true
  end
end
