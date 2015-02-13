class StoriesController < ApplicationController
  before_action :set_stories, only: [:show, :edit, :destroy, :update]

  def index
    # displays all published stories
    @stories = Story.all
  end

  def show
    # show particular story

  end

  def new
    # show a new story form
    # @story = Story.new
    @story = Story.new
  end

  def create
    # create new story
    @story = Story.new story_params
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def edit
    # edit a particular story
  end

  private

  def set_stories
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end

  private

  def set_stories
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end


end