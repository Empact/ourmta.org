class BlogPost
  class << self
    def first
      new(RestClient.get('http://blog.ourmta.org/api/read/json?num=1&type=text'))
    rescue
      nil
    end
  end

  def initialize(json)
    @attrs = JSON.parse(json.sub('var tumblr_api_read = ', '').sub(/; *$/, ''))['posts'][0]
  end
  
  def url
    @attrs['url-with-slug']
  end
  
  def posted_on
    DateTime.parse(@attrs['date-gmt']).to_date
  end
  
  def title
    @attrs['regular-title']
  end
  
  def body
    @attrs['regular-body']
  end
end