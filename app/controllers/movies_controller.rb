# inicialmente, o controlador com as funcoes de index e show, que devem aparecer no routes.rb

class MoviesController < ApplicationController
  def index
    @movies = Movie.all?          # salva uma lista de todos os filmes em uma var de instancia que o view vai conseguir acessar
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    # pelo que eu entendi essas linhas servem para tentar garantir que alguem nao mande dados proibidos pro model
    params.require(:movie)
    params[:movie].permit(:title, :rating, :release_date)

    # verifica se foi criado a instancia no BD e retorna um aviso
    if (@movie = Movie.create(params[:movie]))
      redirect_to movies_path(@movie), :notice => "#{@movie.title} criado."
    else
      flash[:alert] = "Filme #{@movie.title} não pode ser criado: " + @movie.errors.full_messages.join(",")
      render 'new'
    end
  end


end