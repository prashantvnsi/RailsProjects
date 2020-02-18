class CommentsController < ApplicationController

  before_action :authenticate_user!

  before_action :user_signed_in?

  before_action :current_user

  before_action :user_session

  

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comments_by_article = Comment.all.group_by(&:article_id)
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
