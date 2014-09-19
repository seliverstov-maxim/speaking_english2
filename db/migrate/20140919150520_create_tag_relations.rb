class CreateTagRelations < ActiveRecord::Migration
  def change
    create_table :tag_relations do |t|
      t.references :tag, index: true
      t.references :target, index: true
      t.string :target_type

      t.timestamps
    end
  end
end
