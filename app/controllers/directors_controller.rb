class DirectorsController < ApplicationController

  def new
    @director = Director.new
  end

  def index

    @directors = Director.order( created_at: :desc )
  end

  def show

    @director = Director.find(params.fetch(:id))

  
  end

  def create
    director = Director.new
    director.dob = params.fetch("dob")
    director.name = params.fetch("name")
    director.bio = params.fetch("bio")

    if director.valid?
      director.save
      redirect_to("/directors", { :notice => "Director created successfully." })
    else
      redirect_to("/directors", { :alert => director.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)

    director.dob = params.fetch("dob")
    director.name = params.fetch("name")
    director.bio = params.fetch("bio")

    if director.valid?
      director.save
      redirect_to("/directors/#{director.id}", { :notice => "Director updated successfully."} )
    else
      redirect_to("/directors/#{director.id}", { :alert => director.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)

    director.destroy

    redirect_to("/directors", { :notice => "Director deleted successfully."} )
  end
end
