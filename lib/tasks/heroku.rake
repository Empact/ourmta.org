namespace :heroku do
  task :config do
    env_vars = %w(
      MAIL_CHIMP_API_KEY MAIL_CHIMP_FIXMTA_SUPPORTER_LIST_ID MAIL_CHIMP_TEST_LIST_ID
      FIXMTA_BETA_USERNAME FIXMTA_BETA_PASSWORD
    ).map do |var|
      "#{var}=#{ENV[var]}"
    end
    puts env_vars
    `heroku config:add #{env_vars.join(' ')}`
  end
end