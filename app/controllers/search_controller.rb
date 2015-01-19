class SearchController < ApplicationController
    def index
        @things = Thing.name_search(params[:thing]).to_a
    end
end
