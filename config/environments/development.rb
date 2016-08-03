Rails.application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.action_controller.perform_caching             = false

  config.eager_load = false

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  if ENV['REAL_REST']
    config.gem 'rest-client', :lib => 'rest_client'
  else
    module RestClient
      class << self
        def get(path, *args)
          case path
          when /^http:\/\/api\.meetup\.com/
            "{\"results\":[{\"rsvpcount\":\"3\",\"name\":\"Meet, Greet, Plan, Eat & Drink\",\"group_name\":\"FixMta.org Action Meetup Group\",\"lon\":\"-73.98999786376953\",\"venue_map\":\"http://maps.google.com/staticmap?center=40.75,-73.98999786376953&zoom=14&size=512x512&maptype=mobile&markers=40.75,-73.98999786376953,blues&key=ABQIAAAAiB79SpLrOxrYbOzqaYGrvhQrNhSbWhQbZXKDt0w9V4y2n6CzahTrHTbQjuSGhL4xdTPFH0lRNNe4-A&sensor=false\",\"event_url\":\"http://www.meetup.com/FixMta-Action-Meetup-Group/calendar/11447476/\",\"venue_address1\":\"325 E 14th St\",\"no_rsvpcount\":\"1\",\"questions\":[],\"feedesc\":\"\",\"venue_address2\":\"\",\"attendee_count\":\"0\",\"organizer_id\":\"429369\",\"time\":\"Tue Sep 29 19:00:00 EDT 2009\",\"venue_address3\":\"\",\"venue_id\":\"672928\",\"photo_url\":\"\",\"group_photo_url\":\"\",\"venue_lat\":\"40.732094\",\"venue_name\":\"Crocodile Lounge\",\"myrsvp\":\"yes\",\"id\":\"11447476\",\"ismeetup\":\"1\",\"venue_city\":\"New York\",\"rsvp_closed\":\"0\",\"venue_state\":\"NY\",\"rsvp_limit\":\"0\",\"group_id\":\"1527191\",\"organizer_name\":\"Ben Woosley\",\"feecurrency\":\"USD\",\"venue_lon\":\"-73.984344\",\"venue_zip\":\"10003\",\"fee\":\"0.0\",\"maybe_rsvpcount\":\"1\",\"description\":\"For our first meet-up we'll be heading to Crocodile Lounge, for beer & pizza, and more importantly to plan, organize and strategize the beginning stages of FixMta.\\r\\n\\r\\nCome by to meet up with other folks who want to bring on an MTA that truly works for the people of New York.\",\"rsvp_cutoff\":\"None\",\"venue_phone\":\"212-477-7747\",\"updated\":\"Wed Sep 23 16:55:17 EDT 2009\",\"lat\":\"40.75\",\"allow_maybe_rsvp\":\"1\"}],\"meta\":{\"lon\":\"\",\"title\":\"Meetup Events\",\"method\":\"Events\",\"url\":\"http://api.meetup.com/events/?_unicode=1&order=time&resource=%2Fevents.json%2F&offset=0&radius=25&page=200&format=json&key=1c4d574387c7f337b2357a64455f46&group_urlname=FixMta-Action-Meetup-Group\",\"id\":\"\",\"count\":1,\"link\":\"http://api.meetup.com/events/\",\"next\":\"\",\"description\":\"API method for accessing meetup events\",\"total_count\":1,\"updated\":\"2009-09-23 16:55:17 EDT\",\"lat\":\"\"}}"
          when /^http:\/\/blog\.ourmta\.org/
            'var tumblr_api_read = {"tumblelog":{"title":"OurMTA.org","description":"Helping New York City Transit Work for New Yorkers","name":"ourmta","timezone":"US\/Eastern","cname":"blog.ourmta.org","feeds":[]},"posts-start":0,"posts-total":2,"posts-type":false,"posts":[{"id":201383030,"url":"http:\/\/blog.ourmta.org\/post\/201383030","url-with-slug":"http:\/\/blog.ourmta.org\/post\/201383030\/fixmta-org-is-now-ourmta-org","type":"regular","date-gmt":"2009-10-01 01:48:13 GMT","date":"Wed, 30 Sep 2009 21:48:13","bookmarklet":0,"mobile":0,"feed-item":"","from-feed-id":0,"unix-timestamp":1254361693,"format":"html","regular-title":"FixMTA.org is now OurMTA.org","regular-body":"<p>One of many things to come out of last night&#8217;s first planning meeting was the question: who are we, what is our message, and does the name FixMTA suit our goals?<\/p>\n<p>On reflection, while we do think the MTA needs reform, that we in New York do need to &#8220;fix&#8221; the MTA, that&#8217;s not enough to capture who we are and what we&#8217;re doing.<\/p>\n<p>We love the subways.\u00a0 We love transit.\u00a0 We see everywhere in the city the way that transit brings people together and enables the vibrancy and beauty we find in New York.<\/p>\n<p>And loving the subways like we do, we want to embrace them, to address their current problems, to reform them and ultimately to expand on them.<\/p>\n<p>But for all that to happen, we don&#8217;t simply need to &#8220;fix&#8221; the MTA, we need to take responsibility for it.\u00a0 We need to re-assert that the MTA is ours, that it&#8217;s our responsibility and duty to look after them and ultimately help them to improve and succeed.<\/p>\n<p>We hope you&#8217;ll remember that it&#8217;s not only our commute, it&#8217;s also our MTA, and we here at OurMTA are working to bring the MTA back home, back to control by the people of NYC, and back to accountability to we the riders, the very reason for its existence.<\/p>"}]};'
          end
        end
      end
    end
  end
end
