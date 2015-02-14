class StoriesController < ApplicationController
  before_action :set_stories, only: [:show, :edit, :destroy, :update]

  def index
    # displays all published stories
    @stories = Story.all.where(published: true)
  end

  def show
    # show particular story
  end

  def new
    # show a new story form
    @story = Story.create
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

  def update
    if @story.update_attributes story_params
      redirect_to story_path(@story)
    else
      render :edit
    end
  end

  def destroy
    story.destroy
    redirect_to root_path
  end


  private

  def set_stories
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end


end
