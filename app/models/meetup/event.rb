class Meetup::Event
  class << self
    def event_url
      'http://api.meetup.com/events.json/?' + {:key => Meetup::API_KEY, :group_urlname => Meetup::GROUP_URL_NAME}.map {|k, v| "#{k}=#{v}"}.join('&')
    end
    
    def all
      @all ||= JSON.parse(RestClient.get(event_url))['results'].map {|result| OpenStruct.new(result) }
    end
  end
end