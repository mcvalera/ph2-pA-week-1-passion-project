class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :description
      t.integer :photo_id

      t.timestamps
    end
  end
end

