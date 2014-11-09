require './test/test_helper'

class PageTest < Minitest::Test
  def test_it_stores_a_page
    page_data = {:slug    => "about-us",
                 :content => "Our site is great!"}

    returned_page = Page.create( page_data )
    found_page    = Page.find_by_slug( page_data[:slug] )

    assert_equal returned_page, found_page
    assert_equal page_data[:slug], found_page.slug
    assert_equal page_data[:content], found_page.content
  end

  def test_it_can_find_all_pages
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    page_data_2 = {:slug => "contact",
                   :content => "Call us at 111-222-3333"}

    returned_page_1 = Page.create(page_data_1)
    returned_page_2 = Page.create(page_data_2)

    assert_includes Page.all, returned_page_1
    assert_includes Page.all, returned_page_2
  end

  def test_it_can_delete_a_page
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    page_data_2 = {:slug => "contact",
                   :content => "Call us at 111-222-3333"}

    returned_page_1 = Page.create(page_data_1)
    returned_page_2 = Page.create(page_data_2)

    Page.delete(page_data_2[:slug])
    refute_includes Page.all, returned_page_2
  end

  def test_it_can_edit_a_page
    page_data_1 = {:slug => "location",
                   :content => "We're located in Denver, CO!"}
    Page.create(page_data_1)
    new_data = {slug: "new location",
                content: "We moved, yo"}
    new_page = Page.update(page_data_1[:slug], new_data)
    assert_includes Page.all, new_page
  end
end
