Capybara.add_selector(:menu_area) do
 xpath { "//ul[@class=\"navbar-right\"]" }
end

Capybara.add_selector(:login_area) do
  xpath { "//form[@data-toggle=\"validator\"]" }
end

Capybara.add_selector(:register_area) do
  xpath { "//form" }
end

Capybara.add_selector(:create_account_area) do
  xpath { "//h1[@class=\"title\"]" }
end

Capybara.add_selector(:find_a_table_area) do
  xpath { "//div[@class=\"form-group\"]" }
end

Capybara.add_selector(:time_slots_area) do
  xpath { "//div[@class=\"reservation_choose_time\"]" }
end

Capybara.add_selector(:complete_reservation_area) do
  xpath { "//div[@class=\"complete_reservation_button_container\"]" }
end

Capybara.add_selector(:cancel_reservation_area) do
  xpath { "//div[@class=\"box_shadow restaurant_data_container\"]" }
end

Capybara.add_selector(:reserve_now_area) do
  xpath { "//div[@class=\"ember-view restaurantbox\"]" }
end


# admin

Capybara.add_selector(:admin_navigation_area) do
  xpath { "//div[@class=\"navigation_column\"]" }
end

Capybara.add_selector(:add_restaurants_area) do
  xpath { "//div[@class=\"col-md-2\"]" }
end

Capybara.add_selector(:add_restaurants_buttons_area) do
  xpath { "//div[@class=\"buttons_container\"]" }
end

Capybara.add_selector(:add_restaurants_form_area) do
  xpath { "//div[@class=\"box_shadow administration_fields column_same_height\"]" }
end

Capybara.add_selector(:restaurants_table_area) do
  xpath { "//table[@class=\"table table-bordered table-hover box_shadow administration_table\"]" }
end

Capybara.add_selector(:edit_restaurants_navigation_area) do
  xpath { "//ul[@class=\"nav nav-tabs admin_restaurants_add_tabls_container\"]" }
end

Capybara.add_selector(:restaurant_tab_area) do
  xpath { "//div[@class=\"box_shadow administration_fields\"]" }
end