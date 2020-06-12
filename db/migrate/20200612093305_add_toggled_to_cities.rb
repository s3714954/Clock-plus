class AddToggledToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :toggled, :boolean, default: false
  end
end
