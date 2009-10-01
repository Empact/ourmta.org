namespace :heroku do
  task :config do
    env_vars = %w(
      MAIL_CHIMP_API_KEY MAIL_CHIMP_FIXMTA_SUPPORTER_LIST_ID MAIL_CHIMP_TEST_LIST_ID
      MEETUP_API_KEY
    ).map do |var|
      "#{var}=#{ENV[var]}"
    end
    puts env_vars
    `heroku config:add #{env_vars.join(' ')}`
  end
end