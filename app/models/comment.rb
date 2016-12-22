class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :minifig

	validates :content, length: { minimum: 2 }
end