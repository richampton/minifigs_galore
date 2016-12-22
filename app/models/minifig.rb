class Minifig < ActiveRecord::Base
	has_many   :comments
	has_many   :heads
	has_many   :torsos
	has_many   :legs
	has_many   :accessories
	belongs_to :user

	validates :title, presence: true, length: { in: 1..48 }
	validates :user_id, presence: true
	validates :head_id, presence: true
	validates :torso_id, presence: true
	validates :leg_id, presence: true
end