class AddScoreToRamenImages < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen_images, :score, :decimal, precision: 5, scale: 3
  end
end
