# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }, 
  { :name => 'VIP' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Ped', :email => 'pedram.rahmati@monster.com', :password => 'pedman', :password_confirmation => 'passw0rd'
puts 'New user created: ' << user.name
user.add_role :admin
puts 'SETTING UP DEFAULT EVENT'
event = Event.create! :end_time => '2012/12/1 23:30:00', :image_url => 'centrio_courtyard_view.jpg', :location => 'Centrio (near Pantai Hillpark)', :map_url => 'https://maps.google.com.my/maps?q=Centrio,+Pantai+Hillpark+Kuala+Lumpur&hl=en&sll=4.18646,109.48935&sspn=20.467694,36.628418&oq=centrio&hq=Centrio,+Pantai+Hillpark&hnear=Kuala+Lumpur,+Federal+Territory+of+Kuala+Lumpur&t=m&z=14', :start_time => '2012/12/1 19:30:00', :title => 'BBQ on the roof!', :description => 'Too long since the last one, let''s do it up!  Pot-luck style, what will you bring?', :map_html => '<iframe width="550" height="306" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.my/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Centrio,+Pantai+Hillpark+Kuala+Lumpur&amp;aq=4&amp;oq=centrio&amp;sll=4.18646,109.48935&amp;sspn=20.467694,36.628418&amp;ie=UTF8&amp;hq=Centrio,+Pantai+Hillpark&amp;hnear=Kuala+Lumpur,+Federal+Territory+of+Kuala+Lumpur&amp;t=m&amp;ll=3.106379,101.664294&amp;spn=0.071773,0.049634&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com.my/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Centrio,+Pantai+Hillpark+Kuala+Lumpur&amp;aq=4&amp;oq=centrio&amp;sll=4.18646,109.48935&amp;sspn=20.467694,36.628418&amp;ie=UTF8&amp;hq=Centrio,+Pantai+Hillpark&amp;hnear=Kuala+Lumpur,+Federal+Territory+of+Kuala+Lumpur&amp;t=m&amp;ll=3.106379,101.664294&amp;spn=0.071773,0.049634" style="color:#0000FF;text-align:left">View Larger Map</a></small>', :active => true
puts 'New event created: ' << event.title
