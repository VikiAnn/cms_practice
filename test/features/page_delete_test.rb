require './test/test_helper'

class PageDeleteTest < FeatureTest
  def test_it_deletes_a_page
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    page_data_2 = {:slug => "contact",
                   :content => "Call us at 111-222-3333"}

    Page.create( page_data_1 )
    Page.create( page_data_2 )

    Page.delete(page_data_2[:slug])

    visit '/pages'
    refute page.has_content?(page_data_2[:content])
    get '/pages/content'
    last_response.not_found?
    assert page.has_content?(page_data_1[:content])
  end
end
