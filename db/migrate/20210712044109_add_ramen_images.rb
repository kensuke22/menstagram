class AddRamenImages < ActiveRecord::Migration[5.2]
  def change
    
    add_column :ramen_images, :taste, :string
    add_column :ramen_images, :address, :string
    add_column :ramen_images, :tax_price, :integer
  
  end
end
