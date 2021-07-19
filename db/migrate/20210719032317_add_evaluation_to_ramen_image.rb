class AddEvaluationToRamenImage < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen_images, :evaluation, :float
  end
end
