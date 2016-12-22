class CreateLegs < ActiveRecord::Migration
	def change
		create_table :legs do |t|
			t.string  :part_id
			t.string  :description
			t.string  :part_type
			t.integer :min_year
			t.integer :max_year
			t.string  :url
			t.string  :img_url

			t.timestamps
		end
	end
end