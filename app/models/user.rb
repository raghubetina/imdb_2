class User < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :movies,
             :through => :bookmarks,
             :source => :movie

  has_many   :followers,
             :through => :received_friend_requests,
             :source => :sender

  has_many   :leaders,
             :through => :sent_friend_requests,
             :source => :recipient

  has_many   :leaders_movies,
             :through => :followers,
             :source => :movies

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
