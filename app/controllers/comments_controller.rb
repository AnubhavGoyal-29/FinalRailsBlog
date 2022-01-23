class CommentsController < ApplicationController

	def create
          @post = Post.where(params[:post_id]).first
          @comment = Comment.new(params[:comment].permit(:comment))
          @comment.post = @post
          @comment.user = current_user
          @comment.save
	  redirect_to post_path(@post)	
	end
	def destroy
          @post = Post.where(params[:post_id]).first
          @comment = @post.comments.where(params[:id]).first
	  @comment.destroy
	  redirect_to post_path(@post)
	end
end
