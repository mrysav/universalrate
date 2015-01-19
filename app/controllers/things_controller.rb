class ThingsController < ApplicationController
    before_filter :require_valid_user, :except => :show
    
    def new
        @thing = Thing.new
    end
    
    def create
        @thing = Thing.create(thing_params)
        @thing.num_ratings = 1
        
        if @thing.save
            redirect_to @thing
        else
            flash[:danger] = "Creation of " + @thing.name + " failed miserably."
            redirect_to new_thing_path
        end
    end
    
    def show
        @thing = Thing.find(params[:id])
    end
    
    def rate
        @thing = Thing.find(params[:id])
        @thing.rating = (@thing.num_ratings * @thing.rating + params[:rating].to_i) / (@thing.num_ratings + 1)
        @thing.num_ratings += 1
        
        if @thing.save
            flash[:success] = "You rated it."
            redirect_to @thing
        else
            flash[:danger] = "Creation of " + @thing.name + " failed miserably."
            redirect_to new_thing_path
        end
    end
    
    private
    
    def thing_params
        params.require(:thing).permit(:name, :image, :rating)
    end
end
