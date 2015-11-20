class CommentsController < ApplicationController

#actually creates the comment
#note how it is virtually the same as in articles_controller
def create
#passes the comment security params as an argument
@comment = Comment.new(comment_params)  
@comment.article_id = params[:article_id]

@comment.save

redirect_to article_path(@comment.article) #sends you to the article page you just commented on
end


def destroy
@comment = Comment.delete(params[:id])
redirect_to article_path(params[:article_id])
end


=begin
def edit
@comment = Comment.find(params[:article_id])
end

def update
@comment = Comment.find(params[:article_id])
@comment.update(comment_params)

flash.notice = "Comment '#{@comment.title}' Updated!"

redirect_to article_path(@comment.article)
end
=end
#security - require a comment and only permit author name and body to be passed
def comment_params
params.require(:comment).permit(:author_name, :body)
end


end