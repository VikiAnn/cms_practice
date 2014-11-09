require './test/test_helper'

class PageEditTest < FeatureTest
  def test_it_edits_a_page
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    Page.create( page_data_1 )

    visit '/pages/location'
    assert page.has_content?("We're located in Denver")
    find_link('Edit').click
    fill_in("slug", with: "better_location")
    fill_in("content", with: "We moved.")
    find_button('Submit').click
    find_link('Page slug: better_location')
    assert_equal "/pages", current_path
    assert page.has_content?("We moved.")
    # Create a page
    # Visit it and make sure the content is there
    # Click an EDIT link on that page
    # Change the content via the form
    # Submit the form
    # Verify that you're back to the article and "see" the updated content
  end
end
