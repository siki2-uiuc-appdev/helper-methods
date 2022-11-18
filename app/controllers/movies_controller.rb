class MoviesController < ApplicationController
  def new
    @movie = Movie.new

  end

  def index

    @movies = Movie.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
    end
  end

  def show

    @movie = Movie.find(params.fetch(:id))
  end

  def create
    movie_attributes = params.require(:movie).permit(:title, :description)

    #  Mass assignment = .new method can receive a hash that stores all the values needed to create new instance
    @movie = Movie.new(movie_attributes)

    if @movie.valid?
      @movie.save
      redirect_to(movies_url, { notice: "Movie created successfully." })
    else
      render "new"
    end
  end

  def edit

    @movie = Movie.find(params.fetch(:id))

  end

  def update
    @movie = Movie.find(params.fetch(:id))
    movie_params = params.require(:movie).permit(:title, :description)

    @movie.update(movie_params)

    # @movie.title = params.fetch(:title)
    # @movie.description = params.fetch(:description)
    # redirect_to movie_url(@movie.id), :notice => "Movie updated successfully."

    if @movie.valid?
      @movie.save
      redirect_to movie_url(@movie.id), :notice => "Movie updated successfully."
    else
      redirect_to movie_url(@movie.id), alert: "Movie failed to update successfully." 
    end
  end

  def destroy

    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully." 
  end
end
