class CommentsController < ApplicationController

  before_action :authenticate_user!

  before_action :user_signed_in?

  before_action :current_user

  before_action :user_session

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
