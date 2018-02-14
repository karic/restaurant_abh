class HomePage
  attr_accessor :session

  def initialize(session)
    @session = session
  end

  def goto_homepage(host_url)
    @session.visit(host_url)
  end

  def click_back
    @session.evaluate_script('window.history.back()')
  end

  def close
    @session.driver.browser.close
  end

  def quit
    @session.driver.browser.quit
  end

  def get_main
    Main.new(@session)
  end
end