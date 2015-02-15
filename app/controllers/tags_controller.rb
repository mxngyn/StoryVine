class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @stories_with_tag = StoryTag.where(tag_id: @tag.id)
    # @story = StoryTag.where(tag)

  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.where(name: tag_params[:name]).first_or_create

    if @tag.save
      StoryTag.create(tag_id: @tag.id, story_id: tag_params[:story_id])
      redirect_to :back
    else
      @errors = @comment.errors.messages
      redirect_to :back
    end
  end

  private

  def set_name
    if !params[:tag][:add_name].empty?
      params[:tag][:name] = params[:tag][:add_name]
    else
      params[:tag][:name] = params[:tag][:select_name]
    end
  end

  def tag_params
    set_name
    params.require(:tag).permit(:id, :name, :story_id)
  end

end
