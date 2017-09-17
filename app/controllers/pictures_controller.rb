class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  
  def index
    #@pictures = Picture.all.order("id DESC")
    @pictures = Picture.page(params[:page]).order("id DESC")
  end

 # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
 def show
    @comment = @picture.comments.build
    @comments = @picture.comments
 end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "投稿しました！"
      #NoticeMailer.sendmail_picture(@picture).deliver
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end
  
  private
    def pictures_params
      params.require(:picture).permit(:content, :image, :image_cache, :remove_image)
    end
    
    def set_picture
      @picture = Picture.find(params[:id])
    end    
end
