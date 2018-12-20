# frozen_string_literal: true

require_relative 'spec_helper'

APP_URL = 'https://the-internet.herokuapp.com/login'
LOGIN_HEADER = 'h2'
USERNAME_FIELD = 'Username'
PASSWORD_FIELD = 'Password'
ALERT_MESSAGES = 'flash-messages'
LOGIN_BUTTON = 'Login'

step 'LOGIN: Visit the Login Page' do
  Gauge.write_message("Navigating to: '#{APP_URL}'")
  visit(APP_URL)
end

step 'LOGIN: Verify heading: <page_header>' do |page_header|
   expect(LOGIN_HEADER).to have_content(page_header)
end

step 'LOGIN: Log into the site using username and password: <username> and <password>' do |username, password|
  Gauge.write_message("\t* Entering Username: '#{username}'")
  fill_in(USERNAME_FIELD, with: username)
  Gauge.write_message("\t* Entering Password: '#{password}'")
  fill_in(PASSWORD_FIELD, with: password)
  click_button(LOGIN_BUTTON)
end

step 'LOGIN: Verify alert message: <alert_message>' do |alert_message|
  expect(ALERT_MESSAGES).to have_content(alert_message)
end
