class ChangeUserIdColumnTypeInPosts < ActiveRecord::Migration[7.0]
  def up
    change_column :posts, :user_id, :integer
  end

  def down
    change_column :posts, :user_id, :string
  end
end
