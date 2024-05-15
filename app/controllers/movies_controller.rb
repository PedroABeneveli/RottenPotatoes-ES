class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]            # esse id eh a chave primaria do filme, que a gente usa para achar ele na tabela
    @movie = Movie.find(id)
  end
end