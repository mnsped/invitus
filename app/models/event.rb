class Event < ActiveRecord::Base
  attr_accessible :end_time, :image_url, :location, :map_url, :start_time, :title, :description, :map_html, :active
  validates_presence_of :title, :description, :start_time
  #has_and_belongs_to_many :users
  has_many :events_users
end
