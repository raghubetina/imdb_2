class FriendRequestsController < ApplicationController
  before_action :current_user_must_be_friend_request_sender, :only => [:edit, :update, :destroy]

  def current_user_must_be_friend_request_sender
    friend_request = FriendRequest.find(params[:id])

    unless current_user == friend_request.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @friend_requests = current_user.sent_friend_requests.page(params[:page]).per(10)

    render("friend_request_templates/index.html.erb")
  end

  def show
    @friend_request = FriendRequest.find(params.fetch("id_to_display"))

    render("friend_request_templates/show.html.erb")
  end

  def new_form
    @friend_request = FriendRequest.new
    
    render("friend_request_templates/new_form.html.erb")
  end

  def create_row
    @friend_request = FriendRequest.new

    @friend_request.sender_id = params.fetch("sender_id")
    @friend_request.recipient_id = params.fetch("recipient_id")

    if @friend_request.valid?
      @friend_request.save

      redirect_to("/friend_requests", :notice => "Friend request created successfully.")
    else
      render("friend_request_templates/new_form.html.erb")
    end
  end

  def edit_form
    @friend_request = FriendRequest.find(params.fetch("prefill_with_id"))

    render("friend_request_templates/edit_form.html.erb")
  end

  def update_row
    @friend_request = FriendRequest.find(params.fetch("id_to_modify"))

    @friend_request.sender_id = params.fetch("sender_id")
    @friend_request.recipient_id = params.fetch("recipient_id")

    if @friend_request.valid?
      @friend_request.save

      redirect_to("/friend_requests/#{@friend_request.id}", :notice => "Friend request updated successfully.")
    else
      render("friend_request_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @friend_request = FriendRequest.find(params.fetch("id_to_remove"))

    @friend_request.destroy

    redirect_to("/friend_requests", :notice => "Friend request deleted successfully.")
  end
end
