class CreateMovie < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      # nome das colunas da tabela
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'

      # timestamps deixam o rails rastrear quando um dado eh adicionado ou modificado
      t.timestamps
    end
  end
end
