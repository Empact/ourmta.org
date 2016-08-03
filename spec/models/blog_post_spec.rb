require 'rails_helper'

RSpec.describe BlogPost do
  before do
    @json = 'var tumblr_api_read = {"tumblelog":{"title":"OurMTA.org","description":"Helping New York City Transit Work for New Yorkers","name":"ourmta","timezone":"US\/Eastern","cname":"blog.ourmta.org","feeds":[]},"posts-start":0,"posts-total":2,"posts-type":false,"posts":[{"id":201383030,"url":"http:\/\/blog.ourmta.org\/post\/201383030","url-with-slug":"http:\/\/blog.ourmta.org\/post\/201383030\/fixmta-org-is-now-ourmta-org","type":"regular","date-gmt":"2009-10-01 01:48:13 GMT","date":"Wed, 30 Sep 2009 21:48:13","bookmarklet":0,"mobile":0,"feed-item":"","from-feed-id":0,"unix-timestamp":1254361693,"format":"html","regular-title":"FixMTA.org is now OurMTA.org","regular-body":"<p>One of many things to come out of last night&#8217;s first planning meeting was the question: who are we, what is our message, and does the name FixMTA suit our goals?<\/p>\n<p>On reflection, while we do think the MTA needs reform, that we in New York do need to &#8220;fix&#8221; the MTA, that&#8217;s not enough to capture who we are and what we&#8217;re doing.<\/p>\n<p>We love the subways.\u00a0 We love transit.\u00a0 We see everywhere in the city the way that transit brings people together and enables the vibrancy and beauty we find in New York.<\/p>\n<p>And loving the subways like we do, we want to embrace them, to address their current problems, to reform them and ultimately to expand on them.<\/p>\n<p>But for all that to happen, we don&#8217;t simply need to &#8220;fix&#8221; the MTA, we need to take responsibility for it.\u00a0 We need to re-assert that the MTA is ours, that it&#8217;s our responsibility and duty to look after them and ultimately help them to improve and succeed.<\/p>\n<p>We hope you&#8217;ll remember that it&#8217;s not only our commute, it&#8217;s also our MTA, and we here at OurMTA are working to bring the MTA back home, back to control by the people of NYC, and back to accountability to we the riders, the very reason for its existence.<\/p>"}]};'  end

  subject do
    BlogPost.new(@json)
  end

  describe ".new" do
    it "should create a blog post" do
      expect(BlogPost.new(@json)).to be_an_instance_of(BlogPost)    end  end

  describe "#title" do
    it { expect(subject.title).to eq("FixMTA.org is now OurMTA.org") }  end

  describe "#body" do
    it { expect(subject.body).to start_with("<p>One of many things to come out of last night&#8217;s first planning meeting was the question: who are we, what is our message, and does the name FixMTA suit our goals?</p>") }  end

  describe "#url" do
    it { expect(subject.url).to eq("http://blog.ourmta.org/post/201383030/fixmta-org-is-now-ourmta-org") }  end

  describe "#posted_on" do
    it { expect(subject.posted_on).to eq(DateTime.parse('2009-10-01 01:48:13 GMT').to_date) }  endend