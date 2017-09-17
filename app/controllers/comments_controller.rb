class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :edit, :update]
  before_action :set_picture, only: [:destroy, :edit, :update]
  
  # コメントを保存、投稿するためのアクションです。
  def create
    # Pictureをパラメータの値から探し出し,Pictureに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    set_picture
    #@notification = @comment.notifications.build(user_id: @picture.user.id )
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to picture_path(@picture), notice: 'コメントを投稿しました。' }
        format.js { render :index }
    #    unless @comment.picture.user_id == current_user.id
    #      Pusher.trigger("user_#{@comment.picture.user_id}_channel", 'comment_created', {
    #        message: 'あなたの作成したブログにコメントが付きました'
    #      })
    #    end
    #    Pusher.trigger("user_#{@comment.picture.user_id}_channel", 'notification_created', {
    #      unread_counts: Notification.where(user_id: @comment.picture.user.id, read: false).count
    #    })
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to picture_path(@picture), notice: 'コメントを編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      if @comment.save
        format.html { redirect_to picture_path(@picture), notice: 'コメントを削除しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:picture_id, :content)
    end
    def set_comment
      @comment=Comment.find(params[:id])
    end
    def set_picture
      @picture = @comment.picture
    end
end
