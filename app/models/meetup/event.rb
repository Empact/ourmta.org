class Meetup::Event
  class << self
    def all
      if @all && @last_requested && @last_requested < 1.day.ago
        @all
      else
        @last_requested = DateTime.now
        @all = RestClient.get('http://api.meetup.com/events.json/?' + {:key => Meetup::API_KEY, :group_urlname => Meetup::GROUP_URL_NAME}.map {|k, v| "#{k}=#{v}"}.join('&'))
      end
    end
  end
end