class CreateLangs < ActiveRecord::Migration
  def change
    create_table :langs do |t|
      t.string :name
      t.string :state
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
