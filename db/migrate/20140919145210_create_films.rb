class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :state
      t.text :description

      t.timestamps
    end
  end
end
