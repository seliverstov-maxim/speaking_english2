class CreateFilmSliceLessons < ActiveRecord::Migration
  def change
    create_table :film_slice_lessons do |t|
      t.references :lesson, index: true
      t.references :film_slice, index: true

      t.timestamps
    end
  end
end
