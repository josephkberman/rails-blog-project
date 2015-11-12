class ArticlesController < ApplicationController

def index

@articles = Article.all

end

def show

@article = Article.find(params[:id]) 

end

=begin def new

@article = Article.new(params[:id])

end
=end

end
