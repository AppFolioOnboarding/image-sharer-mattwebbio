require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'create should fail with empty name' do
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: '', comment: 'This is an example comment' } }
    end
  end

  test 'create should fail with empty comment' do
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: 'User Name', comment: '' } }
    end
  end

  test 'create should succeed with valid name and comment' do
    assert_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: {
        name: 'User Name',
        comment: 'This is an example comment'
      } }
    end
  end
end
