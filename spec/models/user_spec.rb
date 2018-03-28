require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    it { should have_many(:received_friend_requests) }

    it { should have_many(:sent_friend_requests) }

  end

  describe "InDirect Associations" do

    it { should have_many(:followers) }

    it { should have_many(:leaders) }

    it { should have_many(:leaders_movies) }

  end

  describe "Validations" do
    
  end
end
