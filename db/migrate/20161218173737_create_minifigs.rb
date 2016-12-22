class CreateMinifigs < ActiveRecord::Migration
   def change
      create_table :minifigs do |t|
         t.text       :title
         t.text       :content
         t.references :user, index: true
         t.references :head, index: true
         t.references :torso, index: true
         t.references :leg, index: true
         t.references :accessory, index: true

         t.timestamps
      end
   end
end