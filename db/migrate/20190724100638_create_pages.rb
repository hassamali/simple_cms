class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :subject_id
      t.string :name
      t.integer :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
end
