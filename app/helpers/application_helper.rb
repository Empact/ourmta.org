# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def email_address_path
    'mailto:ourmta@gmail.com'
  end

  def blog_path
    'http://blog.ourmta.org/'
  end

  def meetup_group_path
    'http://www.meetup.com/OurMTA-Action-Meetup-Group/'
  end

  def slogan
    'Helping Transit Work for New Yorkers'
  end

  def event_time(event)
    DateTime.parse(event.time).to_s(:event)
  end

  def venue_url(event)
    "#{meetup_group_path}venue/#{event.venue_id}/"
  end
end

