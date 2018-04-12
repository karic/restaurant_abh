class Review < Main

	def click_on_restaurant_name(restaurant_name)
    @session.within(:restaurant_page_area) do
      @session.driver.browser.find_element(:xpath,"//a[text()='#{restaurant_name}']").click
      sleep(2)
      res_name= @session.driver.browser.find_element(:xpath,"//h1[text()='#{restaurant_name}']").text
    end
  end

def click_on_rate_this_place_button
    @session.within(:review_area) do
      @session.driver.browser.find_element(:xpath,"//button[text()='Rate this place']").click
      sleep(2)
      rate= @session.driver.browser.find_element(:xpath,"//div[@class='modal-body']//h1").text
    end
  end

def select_stars(rate)
  @session.within(:rate_this_place_area) do
    stars= 6 - rate
    @session.driver.browser.find_element(:xpath,"//div[@class='star'][#{stars}]").click
    end
  end

def enter_comment(comment)
  @session.within(:rate_this_place_area) do
    @session.driver.browser.find_element(:xpath,"//textarea[@class='comment_field ember-view ember-text-area']").send_keys("#{comment}")
    end
  end

def click_on_rate_this_place
 @session.within(:rate_this_place_area) do
      prev_rate= @session.driver.browser.find_element(:xpath,"//span[@class='votes']").text
      prev_rate= prev_rate[1,prev_rate.length-2]
      @session.click_button('Rate this place')
      sleep(2)
      aft_rate= @session.driver.browser.find_element(:xpath,"//span[@class='votes']").text
      aft_rate= aft_rate[1,aft_rate.length-2]
      aft_rate.to_i - prev_rate.to_i
    end
  end

def click_on_rate_this_place_with_existing_rate
 @session.within(:rate_this_place_area) do
      prev_rate= @session.driver.browser.find_element(:xpath,"//span[@class='votes']").text
      prev_rate= prev_rate[1,prev_rate.length-2]
      @session.click_button('Rate this place')
      sleep(2)
      aft_rate= @session.driver.browser.find_element(:xpath,"//span[@class='votes']").text
      aft_rate= aft_rate[1,aft_rate.length-2]
      aft_rate.to_i == prev_rate.to_i
    end
  end

end
