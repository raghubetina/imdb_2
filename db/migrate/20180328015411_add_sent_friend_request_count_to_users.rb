class AddSentFriendRequestCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sent_friend_requests_count, :integer
  end
end
