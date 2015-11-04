class StoriesController < ApplicationController
  def index
  	@stories = Story.all
  end

  def create
  	@story = Story.create(safe_story_params)
    redirect_to '/'
  end

  private
    def safe_story_params
      params.require('story').permit(:title, :link, :upvotes, :category)
    end

end
