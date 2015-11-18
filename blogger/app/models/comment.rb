class Comment < ActiveRecord::Base
  belongs_to :article  # many comments belong to one article
					   # the other side of this coin is in article.rb
end
