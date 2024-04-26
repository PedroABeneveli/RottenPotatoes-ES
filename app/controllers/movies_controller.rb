# inicialmente, o controlador com as funcoes de index e show, que devem aparecer no routes.rb

class MoviesController < ApplicationController
  def index
    @movies = Movie.all          # salva uma lista de todos os filmes em uma var de instancia que o view vai conseguir acessar
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

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    params.require(:movie)
    params[:movie].permit(:title, :rating, :release_date)

    @movie = Movie.find params[:id]
    if @movie.update_attributes(params[:movie])
      redirect_to movie_path(@movie), :notice => "#{@movie.title} atualizado."
    else
      flash[:alert] = "#{@movie.title} não pode ser atualizado: " + @movie.errors.full_messages.join(",")
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice => "#{@movie.title} deletado."
  end

end