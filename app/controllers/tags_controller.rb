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
    @tag = Tag.create()
  end



end
