require './test/test_helper'

class PageIndexTest < FeatureTest
  Capybara.use_default_driver
  def test_it_shows_all_pages
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    page_data_2 = {:slug => "contact",
                   :content => "Call us at 111-222-3333"}

    Page.create( page_data_1 )
    Page.create( page_data_2 )
    visit '/pages/'
    assert page.has_css?('ul li')
    assert page.has_content?(page_data_1[:content])
    assert page.has_content?(page_data_2[:content])
  end
end
