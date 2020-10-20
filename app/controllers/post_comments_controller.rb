class PostCommentsController < ApplicationController

  # コメント投稿だけの一覧画面や投稿画面は作成せず、その代わり、投稿画像の詳細画面（/post_image/:id/）にコメント投稿機能を実装します。
  def create
    post_image = PostImage.find(params[:post_image_id])
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id　を省略↓
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    # binding.pry
    # PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    # post_image_id : 3
    # id : 1
    @post_image = PostImage.find(id: params[:post_image_id])
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to post_image_path(@post_image.id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
