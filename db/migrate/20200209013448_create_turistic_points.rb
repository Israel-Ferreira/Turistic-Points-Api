class CreateTuristicPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :turistic_points do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
