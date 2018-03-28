class CastingsController < ApplicationController
  def index
    @castings = Casting.page(params[:page]).per(10)

    render("casting_templates/index.html.erb")
  end

  def show
    @casting = Casting.find(params.fetch("id_to_display"))

    render("casting_templates/show.html.erb")
  end

  def new_form
    @casting = Casting.new
    
    render("casting_templates/new_form.html.erb")
  end

  def create_row
    @casting = Casting.new

    @casting.movie_id = params.fetch("movie_id")
    @casting.actor_id = params.fetch("actor_id")
    @casting.character_name = params.fetch("character_name")

    if @casting.valid?
      @casting.save

      redirect_to("/castings", :notice => "Casting created successfully.")
    else
      render("casting_templates/new_form.html.erb")
    end
  end

  def edit_form
    @casting = Casting.find(params.fetch("prefill_with_id"))

    render("casting_templates/edit_form.html.erb")
  end

  def update_row
    @casting = Casting.find(params.fetch("id_to_modify"))

    @casting.movie_id = params.fetch("movie_id")
    @casting.actor_id = params.fetch("actor_id")
    @casting.character_name = params.fetch("character_name")

    if @casting.valid?
      @casting.save

      redirect_to("/castings/#{@casting.id}", :notice => "Casting updated successfully.")
    else
      render("casting_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @casting = Casting.find(params.fetch("id_to_remove"))

    @casting.destroy

    redirect_to("/castings", :notice => "Casting deleted successfully.")
  end
end
