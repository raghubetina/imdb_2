class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_friend_requests_count

  # Indirect associations

  # Validations

end
