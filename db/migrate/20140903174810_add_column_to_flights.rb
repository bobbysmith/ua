class AddColumnToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :day, :string
    add_column :flights, :month, :string
    add_column :flights, :year, :string
  end
end
