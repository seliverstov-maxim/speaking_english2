class CreateTaggets < ActiveRecord::Migration
  def change
    create_table :taggets do |t|
      t.references :target, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
