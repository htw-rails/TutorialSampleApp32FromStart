class AddReplyToUserFieldToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :to_id, :integer
  end
end
