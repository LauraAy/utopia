class Person < ActiveRecord::Base

  validates :name, :about, :likes, :dislikes, presence: true

  searchable do
    text :name, boost:5.0
    text :about, :likes
    latlon(:location) { Sunspot::Util::Coordinates.new(lat, lon)}
  end
end

