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

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    @director = Director.find(params.fetch(:id))

    @director.dob = params.fetch("dob")
    @director.name = params.fetch("name")
    @director.bio = params.fetch("bio")

    if @director.valid?
      @director.save
      redirect_to("/directors/#{@director.id}", { :notice => "Director updated successfully."} )
    else
      redirect_to("/directors/#{@director.id}", { :alert => @director.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @director = Director.find(params.fetch(:id))

    @director.destroy

    redirect_to("/directors", { :notice => "Director deleted successfully."} )
  end
end
