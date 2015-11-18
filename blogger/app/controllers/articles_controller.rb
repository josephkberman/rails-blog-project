class ArticlesController < ApplicationController

include ArticlesHelper #the security params are stored there

#main article page
def index
@articles = Article.all
end

#shows you a particular article
def show
@article = Article.find(params[:id]) 
#Creates the comment form on an article
#Placed here instead of in def new b/c wen we view the article and display the comment form we're not running the article's "new" method - we're running the "show" method
@comment = Comment.new
@comment.article_id = @article.id  #links the comment to an article / many - one relationship
end

#takes you to the page where you WILL create an article
def new
@article = Article.new
end

#actually creates the article
def create
@article = Article.new(article_params)  #passes the article security params from the helper file as an argument
@article.save
redirect_to article_path(@article) #sends you to the newly created article page
end

def destroy
@article = Article.delete(params[:id])
redirect_to (articles_path)
end

def edit
@article = Article.find(params[:id])
end

def update
@article = Article.find(params[:id])
@article.update(article_params)

flash.notice = "Article '#{@article.title}' Updated!"

redirect_to article_path(@article)
end

end
