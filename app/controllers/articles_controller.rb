class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new

    if current_user.present? and current_user.asadmin == true
    else
      render :status => :forbidden, :text => "Forbidden fruit"
    end
  end


  def create

    article_permitted_params = article_params
    article_permitted_params[:user_id] = current_user.id
    if current_user.asadmin == true
      @article = Article.new(article_permitted_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    else
      render :status => :forbidden, :text => "Forbidden fruit"
    end
  end

  def edit
    @article = Article.find(params[:id])
    if !current_user.present? or current_user.id != @article.user.id or current_user.asadmin != true
      render :status => :forbidden, :text => "Forbidden fruit"
    end
  end

  def update
    @article = Article.find(params[:id])
    if current_user.present? and current_user.id == @article.user.id and current_user.asadmin == true
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    else
      render :status => :forbidden, :text => "Forbidden fruit"
    end
  end


  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if current_user.present? and current_user.id == @article.user.id
      @article.destroy
      redirect_to articles_path
    else
      render :status => :forbidden, :text => "Forbidden fruit"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
