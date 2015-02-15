class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :destroy, :update]

  def index
    # displays all published stories
    @stories = Story.all.where(published: true)
  end

  def show
    find_vote(@story)
    Sanitize.fragment(@story, Sanitize::Config::RESTRICTED)
    # show particular story
  end

  def new
    # show a new story form
    @story = Story.create(snippet_id: params["snippet_id"], author_id: session[:user_id], published: false)
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
    p params
    @story = Story.find(params["id"])
    if @story.update(content: params["story"]["content"], title: params["story"]["title"], published: params["story"]["published"])
      if request.xhr?
        render plain: "Autosaved on " + @story.updated_at.strftime("%m/%d/%Y at %I:%M:%S %p")
      else
        redirect_to story_path(@story)
      end
    else
      redirect_to :back
    end
  end

  def destroy
    story.destroy
    redirect_to root_path
  end

  # def show_tags
  #   @story = Story.find(params[:id])
  #   @stories_with_tags = Tag.where(story_id: @story.id)
  # end

  private

  def find_vote(story)
    @vote = story.votes.find_by(user_id: session[:user_id], story_id: story.id )
  end

  def set_stories
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content, :snippet_id, :author_id, :published)
  end


end
