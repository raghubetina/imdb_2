class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :characters,
             :class_name => "Casting",
             :dependent => :destroy

  # Indirect associations

  has_many   :fans,
             :through => :bookmarks,
             :source => :user

  has_many   :leaders,
             :through => :fans,
             :source => :followers

  has_many   :actors,
             :through => :characters,
             :source => :actor

  # Validations

  validates :title, :uniqueness => { :scope => [:year, :director_id] }

  validates :title, :presence => true

end
