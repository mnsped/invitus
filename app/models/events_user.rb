class EventsUser < ActiveRecord::Base
  attr_accessible :attending, :comment, :event_id, :stuff, :user_id
  belongs_to :event
  belongs_to :user
end
