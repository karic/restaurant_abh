require 'yaml'
require 'appium_capybara'
require 'capybara/rspec'
require "chromedriver/helper"
require 'require_all'
require 'rspec/retry'
require 'headless'
require_all './lib/'

class SetupBrowser

  attr_accessor :web, :url, :retry, :fast_fail, :headless

  def initialize
    config = YAML.load(File.open('./config/environment.yaml'))['environment']
    self.web       = config['web']
    self.url       = config['url']
    self.retry     = config['retry']
    self.fast_fail = config['fast_fail']
    self.headless  = config['headless']
    Capybara.default_selector = :xpath
    Capybara.default_max_wait_time = 30
  end

  def load_browser
    if ENV['BROWSER']
      browser = ENV['BROWSER']
    else
      browser = self.web['driver']
    end

    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 90
    client.open_timeout = 90

    Capybara.register_driver(browser.to_sym) do |app|
      Capybara::Selenium::Driver.new(app, :browser => browser.to_sym, http_client: client)
    end

    # Set default driver
    Capybara.default_driver = browser.to_sym

    # Start Capybara session
    
    @session = Capybara::Session.new(browser.to_sym)
    @homepage = HomePage.new(@session)

    @session.driver.browser.manage.window.move_to(0,0)
    @session.driver.browser.manage.window.maximize
    @homepage.goto_homepage(self.url)
    @homepage
  end
end
