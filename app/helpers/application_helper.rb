# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def email_address_path
    'mailto:fixthemta@gmail.com'
  end

  def blog_path
    'http://blog.ourmta.org/'
  end

  def meetup_group_path
    'http://www.meetup.com/OurMTA-Action-Meetup-Group/'
  end

  def slogan
    'Helping New York City Transit Work for New Yorkers'
  end

  def event_time(event)
    DateTime.parse(event.time).to_s(:event)
  end

  def venue_url(event)
    "#{meetup_group_path}venue/#{event.venue_id}/"
  end
  
  # http://henrik.nyh.se/2008/01/rails-truncate-html-helper
  # Like the Rails _truncate_ helper but doesn't break HTML tags or entities.
  def truncate_html(text, max_length = 30, ellipsis = "...")
    return if text.nil?

    doc = Hpricot(text.to_s)
    ellipsis_length = Hpricot(ellipsis).inner_text.length
    content_length = doc.inner_text.length
    actual_length = max_length - ellipsis_length

    content_length > max_length ? doc.truncate(actual_length).inner_html + ellipsis : text.to_s
  end
end

# By Henrik Nyh <http://henrik.nyh.se> 2008-01-30.
# Free to modify and redistribute with credit.

module HpricotTruncator
  module NodeWithChildren
    def truncate(max_length)
      return self if inner_text.length <= max_length
      truncated_node = self.dup
      truncated_node.children = []
      each_child do |node|
        remaining_length = max_length - truncated_node.inner_text.length
        break if remaining_length <= 0
        truncated_node.children << node.truncate(remaining_length)
      end
      truncated_node
    end
  end

  module TextNode
    def truncate(max_length)
      # We're using String#scan because Hpricot doesn't distinguish entities.
      Hpricot::Text.new(content.scan(/&#?[^\W_]+;|./).first(max_length).join)
    end
  end

  module IgnoredTag
    def truncate(max_length)
      self
    end
  end
end

Hpricot::Doc.send(:include,       HpricotTruncator::NodeWithChildren)
Hpricot::Elem.send(:include,      HpricotTruncator::NodeWithChildren)
Hpricot::Text.send(:include,      HpricotTruncator::TextNode)
Hpricot::BogusETag.send(:include, HpricotTruncator::IgnoredTag)
Hpricot::Comment.send(:include,   HpricotTruncator::IgnoredTag)