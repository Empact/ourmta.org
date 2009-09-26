# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

if ENV['REAL_REST']
  config.gem 'rest-client', :lib => 'rest_client'
else
  module RestClient
    class << self
      def get(*args)
        "{\"results\":[{\"rsvpcount\":\"3\",\"name\":\"Meet, Greet, Plan, Eat & Drink\",\"group_name\":\"FixMta.org Action Meetup Group\",\"lon\":\"-73.98999786376953\",\"venue_map\":\"http://maps.google.com/staticmap?center=40.75,-73.98999786376953&zoom=14&size=512x512&maptype=mobile&markers=40.75,-73.98999786376953,blues&key=ABQIAAAAiB79SpLrOxrYbOzqaYGrvhQrNhSbWhQbZXKDt0w9V4y2n6CzahTrHTbQjuSGhL4xdTPFH0lRNNe4-A&sensor=false\",\"event_url\":\"http://www.meetup.com/FixMta-Action-Meetup-Group/calendar/11447476/\",\"venue_address1\":\"325 E 14th St\",\"no_rsvpcount\":\"1\",\"questions\":[],\"feedesc\":\"\",\"venue_address2\":\"\",\"attendee_count\":\"0\",\"organizer_id\":\"429369\",\"time\":\"Tue Sep 29 19:00:00 EDT 2009\",\"venue_address3\":\"\",\"venue_id\":\"672928\",\"photo_url\":\"\",\"group_photo_url\":\"\",\"venue_lat\":\"40.732094\",\"venue_name\":\"Crocodile Lounge\",\"myrsvp\":\"yes\",\"id\":\"11447476\",\"ismeetup\":\"1\",\"venue_city\":\"New York\",\"rsvp_closed\":\"0\",\"venue_state\":\"NY\",\"rsvp_limit\":\"0\",\"group_id\":\"1527191\",\"organizer_name\":\"Ben Woosley\",\"feecurrency\":\"USD\",\"venue_lon\":\"-73.984344\",\"venue_zip\":\"10003\",\"fee\":\"0.0\",\"maybe_rsvpcount\":\"1\",\"description\":\"For our first meet-up we'll be heading to Crocodile Lounge, for beer & pizza, and more importantly to plan, organize and strategize the beginning stages of FixMta.\\r\\n\\r\\nCome by to meet up with other folks who want to bring on an MTA that truly works for the people of New York.\",\"rsvp_cutoff\":\"None\",\"venue_phone\":\"212-477-7747\",\"updated\":\"Wed Sep 23 16:55:17 EDT 2009\",\"lat\":\"40.75\",\"allow_maybe_rsvp\":\"1\"}],\"meta\":{\"lon\":\"\",\"title\":\"Meetup Events\",\"method\":\"Events\",\"url\":\"http://api.meetup.com/events/?_unicode=1&order=time&resource=%2Fevents.json%2F&offset=0&radius=25&page=200&format=json&key=1c4d574387c7f337b2357a64455f46&group_urlname=FixMta-Action-Meetup-Group\",\"id\":\"\",\"count\":1,\"link\":\"http://api.meetup.com/events/\",\"next\":\"\",\"description\":\"API method for accessing meetup events\",\"total_count\":1,\"updated\":\"2009-09-23 16:55:17 EDT\",\"lat\":\"\"}}"
      end
    end
  end
end