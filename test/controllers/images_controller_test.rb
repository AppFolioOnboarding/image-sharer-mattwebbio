require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'new should render' do
    get new_image_path

    assert_response :ok
    assert_select 'form'
  end

  test 'create should fail with invalid url' do
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: 'iuashdfiuh' } }
    end

    assert_response :ok
    assert_select 'div', 'Image upload failed :('
  end

  test 'create should fail with empty url' do
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: '' } }
    end

    assert_response :ok
    assert_select 'div', 'Image upload failed :('
  end

  test 'create should redirect to successfully saved image' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png' } }
    end

    assert_redirected_to(Image.last)
  end

  test 'show should display saved image' do
    image = Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png')

    get image_path(image)

    assert_response :ok
    assert_select 'img', src: image.url
  end

  test 'show should throw error when accessing nonexisting image' do
    assert_raises ActiveRecord::RecordNotFound do
      get image_path(-1)
    end
  end

  test 'index should render' do
    get images_path
    assert_response :ok
    assert_select('table')
  end

  test 'index should display image' do
    image = Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png')
    image2 = Image.create!(url: 'https://i.stack.imgur.com/RQvYG.png')
    image3 = Image.create!(url: 'https://cdn4.buysellads.net/uu/1/49556/1565364760-1559831407-Monday_tp_desk_mobile1.jpg')

    get images_path

    assert_response :ok
    assert_select 'img', src: image.url
    assert_select 'img', src: image2.url
    assert_select 'img', src: image3.url
  end

  test 'create should save tags' do
    post images_path, params: { image: { url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png',
                                         tag_list: 'tag1, tag2' } }

    assert_redirected_to(Image.last)
    assert_equal Image.last.tag_list, %w[tag1 tag2]
  end

  test 'index should display tags' do
    Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png', tag_list: 'tag1, tag2')

    get images_path

    assert_response :ok
    assert_select 'td', 'tag1, tag2'
  end

  test 'show should display tags' do
    image = Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png',
                          tag_list: 'tag1, tag2')

    get image_path(image)

    assert_response :ok
    assert_select 'span', 'tag1, tag2'
  end
end
