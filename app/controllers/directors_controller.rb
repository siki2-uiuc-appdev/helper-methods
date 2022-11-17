class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all

    @directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "directors/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })

    @director = matching_directors.at(0)

    render({ :template => "directors/show.html.erb" })
  end

  def create
    director = Director.new
    director.dob = params.fetch("query_dob")
    director.name = params.fetch("query_name")
    director.bio = params.fetch("query_bio")

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

    director.dob = params.fetch("query_dob")
    director.name = params.fetch("query_name")
    director.bio = params.fetch("query_bio")

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
