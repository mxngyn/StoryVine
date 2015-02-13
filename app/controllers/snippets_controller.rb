class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.random
  end

  def new
    @snippet = Snippet.create
  end

  def create
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      flash[:success] = "Snippet successfully created."
      redirect_to snippet_path(@snippet)
    else
      flash[:error] = "There was a problem creating your snippet."
      redirect_to :back
    end
  end

  def show
    set_snippet
    @stories = @snippet.stories
  end

  private

    def set_user
      params[:snippet][:user_id] = session[:user_id]
    end

    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def snippet_params
      set_user
      params.require(:snippet).permit(:user_id, :content)
    end

end
