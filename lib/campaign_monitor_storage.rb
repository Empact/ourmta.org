class CampaignMonitorStorage
  class SubscriptionError < StandardError
  end

  def initialize(list_id)
    @list_id = list_id
    @cm = CampaignMonitor.new(CAMPAIGN_MONITOR_API_KEY)
  end

  def after_create(record)
    @cm.Subscriber.Add(
      'ListID' => @list_id,
      'Email'  => record.email,
      'Name'   => record.name
    )
  end
end
