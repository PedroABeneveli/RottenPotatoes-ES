# inicialmente, o controlador com as funcoes de index e show, que devem aparecer no routes.rb

class MoviesController < ApplicationController
  def index
    @movies = Movie.all?          # salva uma lista de todos os filmes em uma var de instancia que o view vai conseguir acessar
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end
end