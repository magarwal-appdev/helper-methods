class MoviesController < ApplicationController
  def new
    @movie = Movie.new

  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
      # format.html do
      #   render "movies/index"
      # end
    end
  end

  def show

    @movie = Movie.find(params.fetch(:id))

    # @movie = Movie.where(id: params.fetch(:id)).first

  end

  def create
    movie_attributes = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attributes)


    if @movie.valid?
      @movie.save
      redirect_to("/movies",  :notice => "Movie created successfully." )
    else
      # render "movies/new" --->>>> folder name matches the name of the controller but function name doesn't match the template name so we can drop folder name
      render "new"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    @movie = Movie.find(params.fetch(:id))
    @movie.title = params.fetch("movie[title]")
    @movie.description = params.fetch("movie[description]")


    if @movie.valid?
      @movie.save
      redirect_to movie_path(@movie.id), notice: "Movie updated successfully." 
    else
      redirect_to movie_path(@movie.id), alert: "Movie failed to update successfully."
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_path, notice: "Movie deleted successfully."
  end
end
