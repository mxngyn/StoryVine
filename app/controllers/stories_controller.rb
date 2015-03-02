class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :destroy, :update, :new_nested_story, :create_nested_story]
  # before_action :child_story_params, only: [:new_nested_story, :create_nested_story]

  def index
    @stories = Story.published
    @most_popular = Story.all_most_popular
    @most_recent = Story.all_most_recent
  end

  def search
    @search = Story.search do
      if params[:search].nil? || params[:search].empty?
        stext = ''
      else
        stext = params[:search]
      end
      fulltext stext, :highlight => true
    end

    @snip_search = Snippet.search do
      if params[:search].nil? || params[:search].empty?
        stext = ''
      else
        stext = params[:search]
      end
      fulltext stext, :highlight => true
    end

    @searched_snippets = @snip_search.results
    @searched_stories = @search.results
  end

  def show
    find_vote(@story)
    @story.remove_dangerous_html_tags!
    @snippet = @story.snippet
    @tags = Tag.tags_for_select
    # show particular story
  end

  def new
    @story = Story.create(snippet_id: params[:snippet_id])
  end


  def create
    # create new story
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end


  def edit
    @story.remove_dangerous_html_tags!
  end

  def update
    @story = Story.find(params["id"])
    story_content = Sanitize.fragment(params["story"]["content"], Sanitize::Config::BASIC)
    if @story.update(content: story_content, title: params["story"]["title"], published: params["story"]["published"])
      User.find(session[:user_id]).stories << @story
      if request.xhr?
        render plain: "Autosaved on " + @story.updated_at.strftime("%m/%d/%Y at %I:%M:%S %p")
      else
        redirect_to story_path(@story)
      end
    else
      if request.xhr?
        render plain: "Failed to autosave: #{@story.errors.messages.inspect}"
      else
        flash[:notice] = "There was an error saving your story. Please make sure the fields aren't blank."
        render :new
      end
    end
  end

  def destroy
    @story.destroy
    redirect_to root_path
  end


  def flag
    @story = Story.find(params[:id])
    Flag.create(flaggable_type: "Story", flaggable_id: @story.id)
    flash[:notice] = "Thank you. We'll look into this shortly."
    redirect_to story_path(@story.id)
  end

  def new_nested_story
    @story_new = Story.new
    # render :create_nested_story
  end

  def create_nested_story
     @story_new = Story.new(title: params[:title], author_id: params[:session_id], parent_id: set_story.id, snippet_id: params[:story][:snippet_id])
    if @story_new.save
      @parent = set_story
      @parent.children << @story_new
      redirect_to story_path(@story_new)
    else
      render :new
      # this should give errors
      # redirect_to login_path
    end
  end

  private

  def find_vote(story)
    @vote = story.votes.find_by(user_id: session[:user_id], story_id: story.id )
  end

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content, :snippet_id, :author_id, :published, :parent_id)
  end

  # def child_story_params
  #   @new_story = Story.find(params[:new_story].id)
  # end


end
