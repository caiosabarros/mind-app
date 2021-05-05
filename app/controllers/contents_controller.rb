class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only:[:show,:edit,:update,:destroy]
  
  def index
    @contents = current_user.contents
  end

  def show 
    
  end

  def destroy
    
    @content.destroy

    redirect_to contents_path, notice: "You just deleted it!"
  end

  def new
    @content = Content.new
  end

  def create
    @content = current_user.contents.build(content_params)

    if @content.save
      redirect_to contents_path, notice: "You just created an awesome content!"
    else
      render :new
    end
  end

  def edit 
   
  end
  
  def update
    

    if @content.update(content_params)
      redirect_to content_path, notice:"You made it way better!"
    else
      render :edit
    end
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :description)
  end
end
