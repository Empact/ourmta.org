class CampaignMonitorStorage
  API_KEY = ENV['CAMPAIGN_MONITOR_API_KEY']

  def initialize(list_id)
    raise "Invalid Campaign Monitor setup" if list_id.blank? || API_KEY.blank?
    @list_id = list_id
    @cm = CampaignMonitor.new(API_KEY)
  end

  def after_create(record)
    @cm.Subscriber.Add(
      'ListID' => @list_id,
      'Email'  => record.email,
      'Name'   => record.name
    )
  end
end
