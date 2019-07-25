class AddContentToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :content, :text
  end
end
