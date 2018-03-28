class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.text :bio
      t.string :image
      t.date :dob

      t.timestamps
    end
  end
end
