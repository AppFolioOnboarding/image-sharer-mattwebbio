require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'index should render' do
    get feedbacks_path
    assert_response :ok
    assert_select('table')
  end

  test 'new should render react' do
    get new_feedback_path
    assert_response :ok
    assert_select('div#feedback-root')
  end

  test 'index should display feedback' do
    Feedback.create!(name: 'name1', comment: 'comment1')

    get feedbacks_path

    assert_response :ok
    assert_select('b', 'name1')
    assert_select('p', 'comment1')
  end
end
