class HomeController < ApplicationController
  def index
    @events = Event.where(:active => true)
  end
end
