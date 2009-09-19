class MailingListStorage
  API_KEY = ENV['MAIL_CHIMP_API_KEY']

  def initialize(list_id)
    raise "Invalid mail list storage setup: no list id" if list_id.blank?
    raise "Invalid mail list storage setup: no api key" if API_KEY.blank?
    @list_id = list_id
    @hominid = Hominid.new(:api_key => API_KEY, :send_notify => true)
  end

  def after_create(record)
    @hominid.subscribe(@list_id, record.email, {:NAME => record.name.to_s}, 'html')
  end
end
