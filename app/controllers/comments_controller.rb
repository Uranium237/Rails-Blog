class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @article = Article.find(params[:article_id])

    comment_permitted_params = comment_params
    comment_permitted_params[:user_id] = current_user.id
    @comment = @article.comments.create(comment_permitted_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if current_user.id == @comment.user.id or current_user.asadmin == true

      @comment.destroy
      redirect_to article_path(@article)
    else
      render :status => :forbidden, :text => "Forbidden fruit"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
