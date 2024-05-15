class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'
      # permite que o rail rastreie quando filmes sao adicionados ou removidos
      t.timestamps
    end
  end
end
