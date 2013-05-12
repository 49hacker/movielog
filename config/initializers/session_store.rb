# Be sure to restart your server when you modify this file.

=begin
require 'action_dispatch/middleware/session/dalli_store'

Movielog::Application.config.session_store :dalli_store
Movielog::Application.config.session_options = {
  :cookie_only => false,
  :key => SESSION_STORE_KEY,
  :memcache_server => SESSION_MEMCACHE_SERVER,
  :expire_after => 1.days
}
=end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Movielog::Application.config.session_store :active_record_store
