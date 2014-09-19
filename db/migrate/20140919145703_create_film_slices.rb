class CreateFilmSlices < ActiveRecord::Migration
  def change
    create_table :film_slices do |t|
      t.time :start_at
      t.time :stop_at
      t.string :title
      t.string :state
      t.text :description
      t.references :film

      t.timestamps
    end
  end
end
