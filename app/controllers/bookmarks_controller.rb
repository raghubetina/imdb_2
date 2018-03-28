class BookmarksController < ApplicationController
  before_action :current_user_must_be_bookmark_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_bookmark_user
    bookmark = Bookmark.find(params[:id])

    unless current_user == bookmark.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)

    render("bookmark_templates/index.html.erb")
  end

  def show
    @bookmark = Bookmark.find(params.fetch("id_to_display"))

    render("bookmark_templates/show.html.erb")
  end

  def new_form
    @bookmark = Bookmark.new
    
    render("bookmark_templates/new_form.html.erb")
  end

  def create_row
    @bookmark = Bookmark.new

    @bookmark.user_id = params.fetch("user_id")
    @bookmark.movie_id = params.fetch("movie_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/bookmarks", :notice => "Bookmark created successfully.")
    else
      render("bookmark_templates/new_form.html.erb")
    end
  end

  def edit_form
    @bookmark = Bookmark.find(params.fetch("prefill_with_id"))

    render("bookmark_templates/edit_form.html.erb")
  end

  def update_row
    @bookmark = Bookmark.find(params.fetch("id_to_modify"))

    @bookmark.user_id = params.fetch("user_id")
    @bookmark.movie_id = params.fetch("movie_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/bookmarks/#{@bookmark.id}", :notice => "Bookmark updated successfully.")
    else
      render("bookmark_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @bookmark = Bookmark.find(params.fetch("id_to_remove"))

    @bookmark.destroy

    redirect_to("/bookmarks", :notice => "Bookmark deleted successfully.")
  end
end
