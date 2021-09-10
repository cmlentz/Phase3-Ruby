class CreateRivers < ActiveRecord::Migration[5.2]
  def change
    create_table :rivers do |t|
      t.string :name
      t.string :country
    end
  end
end