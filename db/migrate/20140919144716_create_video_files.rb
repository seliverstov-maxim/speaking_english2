class CreateVideoFiles < ActiveRecord::Migration
  def change
    create_table :video_files do |t|
      t.string :url
      t.string :state
      t.references :lang, index: true
      t.references :film, index: true

      t.timestamps
    end
  end
end
