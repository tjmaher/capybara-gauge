# frozen_string_literal: true

require_relative 'spec_helper'

SECURE_HEADER = 'h2'
LOGOUT_BUTTON = '#content > div > a > i'

step 'SECURE AREA: Verify heading: <page_header>' do |page_header|
  expect(SECURE_HEADER).to have_content(page_header)
end

step 'SECURE AREA: Log out of the secure area' do
  find(LOGOUT_BUTTON).click
end
