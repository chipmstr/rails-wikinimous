class ArticlesController < ApplicationController
  def index
    @articles = Article.all  # fetch all articles to display in index view
  end

  def show
    @article = Article.find(params[:id])  # find article by ID to display in show view
  end

  def new
    @article = Article.new  # initialize a new article for the form in new view
  end

  def create
    @article = Article.new(article_params)  # create a new article with form data
    if @article.save
      redirect_to @article  # if the article is saved, redirect to show view
    else
      render :new  # if save fails, re-render the new form
    end
  end

  def edit
    @article = Article.find(params[:id])  # find article by ID to populate the edit form
  end

  def update
    @article = Article.find(params[:id])  # find article by ID to update
    if @article.update(article_params)
      redirect_to @article  # if the update is successful, redirect to show view
    else
      render :edit  # if update fails, re-render the edit form
    end
  end

  def destroy
    @article = Article.find(params[:id])  # find article by ID to delete
    @article.destroy
    redirect_to articles_path  # after deleting, redirect to index view
  end

  private

  # strong parameters to allow title and content to be mass-assigned
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
