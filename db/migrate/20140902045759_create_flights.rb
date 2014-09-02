class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.datetime :date
      t.string :class

      t.timestamps
    end
  end
end
