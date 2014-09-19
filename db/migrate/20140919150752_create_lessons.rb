class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :state
      t.text :description

      t.timestamps
    end
  end
end
