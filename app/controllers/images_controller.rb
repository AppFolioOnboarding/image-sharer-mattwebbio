class ImagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_images = if params[:tag]
                    Image.tagged_with(params[:tag]).order('created_at DESC')
                  else
                    Image.all.order('created_at DESC')
                  end

    flash.now[:warning] = 'No images found :(' if @all_images.length <= 0
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params.require(:image).permit(:url, :tag_list))

    if @image.save
      flash[:success] = 'Image uploaded successfully!'
      redirect_to(@image)
    else
      flash.now[:danger] = 'Image upload failed :('
      render('new')
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    Image.destroy(params[:id])
    flash[:success] = 'Image deleted successfully!'
    redirect_to(images_path)
  end

  def not_found
    flash[:warning] = 'That image wasn\'t found :('
    redirect_to(images_path)
  end
end
