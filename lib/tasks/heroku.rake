namespace :heroku do
  task :config do
    env_vars = %w(
      CAMPAIGN_MONITOR_API_KEY CAMPAIGN_MONITOR_FIXMTA_SUPPORTER_LIST_ID CAMPAIGN_MONITOR_TEST_LIST_ID
      FIXMTA_BETA_USERNAME FIXMTA_BETA_PASSWORD
    ).map do |var|
      "#{var}=#{ENV[var]}"
    end
    puts env_vars
    `heroku config:add #{env_vars.join(' ')}`
  end
end