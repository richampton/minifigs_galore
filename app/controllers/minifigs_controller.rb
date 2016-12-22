class MinifigsController < ApplicationController

   def show
      puts '++++++++++++++++', 'session[:part_search]', session[:part_search]
      if session[:part_type]
         search_term = session[:part_search]
         case session[:part_type]
            when  nil        then 
               @parts = Head.where("lower(description) like ?", "%#{ search_term.downcase }%").page(params[:page])
            when "head"      then 
               @parts = Head.where("lower(description) like ?", "%#{ search_term.downcase }%").page(params[:page])
            when "torso"     then 
               @parts = Torso.where("lower(description) like ?", "%#{ search_term.downcase }%").page(params[:page])
            when "legs"       then 
               @parts = Leg.where("lower(description) like ?", "%#{ search_term.downcase }%").page(params[:page])
            when "accessory" then 
               @parts = Accessory.where("lower(description) like ?", "%#{ search_term.downcase }%").page(params[:page])
         end
      else
         @parts = Head.page(params[:page])
      end
   end

   def search
      session[:part_type]   = params[:part_type]
      session[:part_search] = params[:part_search]
      redirect_to "/minifigs/#{current_user.id}"
   end

   def build
      session[:form_name] = params[:form_name]
      session[:form_note] = params[:form_note]
      session[:part_type] = params[:part_type]
      case params[:part_type]
         when "head" then
            session[:head_id]      = params[:form_id]
            session[:head_img_url] = params[:form_img_url]
            session[:head_part_id] = params[:part_id]
            session[:head_desc]    = params[:form_desc]
         when "torso" then
            session[:torso_id]      = params[:form_id]
            session[:torso_img_url] = params[:form_img_url]
            session[:torso_part_id] = params[:part_id]
            session[:torso_desc]    = params[:form_desc]
         when "legs" then
            session[:leg_id]      = params[:form_id]
            session[:leg_img_url] = params[:form_img_url]
            session[:leg_part_id] = params[:part_id]
            session[:leg_desc]    = params[:form_desc]
         when "accessory" then
            session[:accessory_id]      = params[:form_id]
            session[:accessory_img_url] = params[:form_img_url]
            session[:accessory_part_id] = params[:part_id]
            session[:accessory_desc]    = params[:form_desc]
      end
      redirect_to "/minifigs/#{current_user.id}"
   end

   def create
      @Minifig = Minifig.new(minifig_params)
      if @Minifig.save
         # flash[:success] = "#{@Minifig[:title]} saved!"
      else
         flash[:errors] = @Minifig.errors.full_messages
      end
         redirect_to "/minifigs/#{current_user.id}"
   end

   def edit
   end

   def update
   end

   def destroy
   end

   private
      def minifig_params
         params.require(:minifig).permit(:user_id, :title, :head_id, :torso_id, :leg_id, :accessory_id, :content)
      end

   #def bricklink
   #   @bricklink = HTTP.get("https://rebrickable.com/api/search",
   #   :params => { 
   #     :key          => "#{key}", 
   #     :format       => "json",
   #     :type         => "P",
   #     :query        => params[:part_id],
   #     :part_type_id => "26"
   #   })
   #end
end



      # Brick Owl
      # key = "60bc73a3b961049c242064bc77a5632c7d3a6fa6ef23859334b9540a11010e10"
      # @parts = HTTP.get("https://api.brickowl.com/v1/wishlist/lists", :params => { :key => "#{key}" })
      # @parts = HTTP.get("https://api.brickowl.com/v1/catalog/lists", :params => { :key => "#{key}" })
      # @parts = HTTP.get("https://api.brickowl.com/v1/catalog/search", :params => { :key => "#{key}", :query => "torso" })
      # @parts = HTTP.get("https://api.brickowl.com/v1/catalog/search", :params => { :key => "#{key}", :query => "minifig torso", :type => "Part" })

      # Rebrickable
      #key = "QVH4zSR0PZ"
      #@parts = HTTP.get("https://rebrickable.com/api/search", 
      #:params => { 
      #  :key          => "#{key}", 
      #  :format       => "json",
      #  :type         => "P",
      #  :query        => "hair",
      #  :part_type_id => "26"
      #})


# COPY heads(part_id, description, part_type, min_year, max_year, url, img_url) FROM '/Users/richhampton/Documents/ror/rails/mfg/txt/rebrickable_heads.gdoc.csv' DELIMITER ',' CSV HEADER;
# COPY torsos(part_id, description, part_type, min_year, max_year, url, img_url) FROM '/Users/richhampton/Documents/ror/rails/mfg/txt/rebrickable_torsos.gdoc.csv' DELIMITER ',' CSV HEADER;
# COPY legs(part_id, description, part_type, min_year, max_year, url, img_url) FROM '/Users/richhampton/Documents/ror/rails/mfg/txt/rebrickable_legs.gdoc.csv' DELIMITER ',' CSV HEADER;
# COPY accessories(part_id, description, part_type, min_year, max_year, url, img_url) FROM '/Users/richhampton/Documents/ror/rails/mfg/txt/rebrickable_accessories.gdoc.csv' DELIMITER ',' CSV HEADER;

