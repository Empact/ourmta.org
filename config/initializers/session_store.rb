# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fixmta.org_session',
  :secret      => 'cb06993bc7db6b9667387159360dc4e75045a3b653124cdd73d9775f7b63fdaafee0ee2a8caa9b3c51685d9d2a1dfc3b1f44eae5054aac706c3e6805f79184bd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
