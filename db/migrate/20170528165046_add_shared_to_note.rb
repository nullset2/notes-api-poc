class AddSharedToNote < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :shared, :boolean, default: false
  end
end
