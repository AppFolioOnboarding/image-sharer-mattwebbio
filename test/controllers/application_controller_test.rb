require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get '/'
    assert_response :success
  end

  test 'should get home content' do
    get '/'
    assert_select 'a', 'Image Sharing Site'
  end
end
