Capybara.server = :puma
Capybara.server_port = 3001

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('window-size=1366,768')
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-gpu')
    options.add_argument('--disable-dev-shm-usage')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium
end

Capybara.javascript_driver = :selenium
