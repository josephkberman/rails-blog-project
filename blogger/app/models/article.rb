class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
		tags.join(", ")  #joins them all with a comma & white space
	end	

	def tag_list=(tags_string)  #not sure about how this works
		
		#splits at commas, strips the white spaces, downcases, and tosses dupes (uniq)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq 
		#collects the names from above and "finds or creates" a tag with that name
		new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name)}
		self.tags = new_or_found_tags  #final assignment of all the newly created or found (previously existing) tags
	end
end
