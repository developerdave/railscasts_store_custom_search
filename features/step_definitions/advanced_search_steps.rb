Given /^I go to the "([^"]*)" page$/ do |name_of_page|
  case name_of_page
    when 'list of products'
      visit products_path
    when 'advanced search'
      visit new_search_path
  end
end

When /^I select advanced search$/ do
  click_link 'Advanced Search'
end

When /^I search for "([^"]*)"$/ do |search_term|
  @search_term = search_term
  within("#new_search") do
    fill_in 'search_keywords', :with => search_term
    click_button 'Search'
  end
end

When /^I search for "([^"]*)" in the category "([^"]*)"$/ do |search_term, category|
  @search_term = search_term
  @category = category
  within("#new_search") do
    fill_in 'search_keywords', :with => search_term
    select category, :from => 'search_category_id'
    click_button 'Search'
  end
end

When /^I search for a product between \$(\d+) and \$(\d+)$/ do |min_price, max_price|
  fill_in 'search_min_price', :with => min_price
  fill_in 'search_max_price', :with => max_price
  click_button 'Search'
end

Then /^I should be taken to the advanced search page$/ do
  page.should have_content 'Advanced Search'
end

Then /^I should see my search results$/ do
  page.should have_content 'Search Results'
  page.should have_content @search_term if @search_term.present?
  page.should have_content @category if @category.present?
end

Then /^I should see the no records found message$/ do
  page.should have_content 'No records found'
end