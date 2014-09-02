class RenameColumnFlights < ActiveRecord::Migration
  def change
    rename_column :flights, :class, :seat
  end
end
