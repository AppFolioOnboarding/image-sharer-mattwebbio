require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'model should create with a tag' do
    Image.create!(url: 'https://image.jpg', tag_list: 'tag1')
    assert_equal Image.last.tag_list, ['tag1']
  end

  test 'model should create with tags' do
    Image.create!(url: 'https://image.jpg', tag_list: 'tag1, tag2, tag3')
    assert_equal Image.last.tag_list, %w[tag1 tag2 tag3]
  end

  test 'model should create without tags' do
    Image.create!(url: 'https://image.jpg')
    assert_empty Image.last.tag_list
  end
end
