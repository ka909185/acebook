class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
  # Topicをパラメータの値から探し出し,Topicに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
  # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    respond_to do |format|
      @comment = Comment.find (params[:id])
      @comment.destroy
      @topic = @comment.topic
      format.html { redirect_to topic_path(@topic), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end
  end

  def edit
    @comment = Comment.find (params[:id])
    @topic = @comment.topic
  end

  def update
    @comment = Comment.find (params[:id])
    @topic = @comment.topic
    if @comment.update(comment_params)
      redirect_to topic_path(@topic), notice: 'コメントを変更しました！'
    else
      render 'edit'
    end
  end

  private
  # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
