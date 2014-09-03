class Flight < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :origin, :destination, :date, :seat
end
