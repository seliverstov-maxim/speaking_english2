class CreateLangRelations < ActiveRecord::Migration
  def change
    create_table :lang_relations do |t|
      t.references :lang, index: true
      t.references :target, index: true
      t.string :target_type

      t.timestamps
    end
  end
end
