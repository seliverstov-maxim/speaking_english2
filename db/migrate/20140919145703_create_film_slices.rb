class CreateFilmSlices < ActiveRecord::Migration
  def change
    create_table :film_slices do |t|
      t.integer :start_at
      t.integer :stop_at
      t.string :title
      t.string :state
      t.text :description
      t.references :film
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
