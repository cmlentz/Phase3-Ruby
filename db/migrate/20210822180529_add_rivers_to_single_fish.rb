class AddRiversToSingleFish < ActiveRecord::Migration[5.2]
  def change
    add_reference :single_fishes, :river, foreign_key: true
  end
end
