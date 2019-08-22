class ImagesController < ApplicationController
  def index
    @all_images = Image.all.reverse
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
end
