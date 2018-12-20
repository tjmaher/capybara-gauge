# frozen_string_literal: true

require 'bundler'
require 'capybara/dsl'
require 'capybara/rspec'
Bundler.setup(:default)
Bundler.require

HEADLESS_MODE = ENV['HEADLESS']

# Designate project to use RSpec and Capybara
module DRIVER
  include RSpec::Matchers
  include Capybara::DSL
end

TIMEOUT = 20

Capybara.default_driver = :chrome
Capybara.current_driver = :chrome
Capybara.javascript_driver = :chrome

# Loggers Values: "OFF", "SEVERE", "WARNING", "INFO", "CONFIG", "FINE",
#   "FINER", "FINEST", "ALL"
# https://github.com/SeleniumHQ/selenium/wiki/DesiredCapabilities

CAPABILITIES = Selenium::WebDriver::Remote::Capabilities.chrome(
  loggingPrefs: {
    browser: ENV['CHROME_LOGGING'], # Capture JavaScript errors in Browser
    driver: ENV['CHROMEDRIVER_LOGGING'] # Capture WebDriver severe errors
  }
)

before_suite do
  Capybara.register_driver(:chrome) do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--window-size=1240,1400')

    puts "CHROME_DRIVER: Headless mode == #{HEADLESS_MODE}"

    if HEADLESS_MODE == true
      options.add_argument('--headless')
      options.add_argument('--disable-gpu')
      options.add_argument('--no-sandbox')
      options.add_argument('--disable-dev-shm-usage')
    end

  Capybara::Selenium::Driver.new(app, browser: :chrome,
                                      desired_capabilities: CAPABILITIES,
                                      options: options)
  end

  Capybara.configure do |config|
    config.default_max_wait_time = TIMEOUT
    config.ignore_hidden_elements = true
  end
end

Gauge.configure do |config|
  config.include DRIVER
  config.screengrabber = -> {
    Capybara.page.save_screenshot('/tmp/screenshot.png')
    return File.binread('/tmp/screenshot.png')
  }
end

# Execution Hooks: https://docs.gauge.org/language.html#execution-hooks
after_suite do
  browser_errors = page.driver.browser.manage.logs.get(:browser)
  driver_errors = page.driver.browser.manage.logs.get(:driver)

  open('logs/chrome.log', 'w') do |f|
    f << browser_errors
  end

  open('logs/chromedriver.log', 'w') do |f|
    f << driver_errors
  end
end
