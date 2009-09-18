class MailingListStorage
  API_KEY = ENV['MAIL_CHIMP_API_KEY']

  def initialize(list_id)
    raise "Invalid Campaign Monitor setup" if list_id.blank? || API_KEY.blank?
    @list_id = list_id
    @hominid = Hominid.new(:api_key => API_KEY)
  end

  def after_create(record)
    @hominid.subscribe(@list_id, record.email, {:NAME => record.name.to_s}, 'html')
  end
end
