class SnippetsController < ApplicationController

  def index
    # displays all snippets based on new or popularity
  end

  def new
    # show new snippet form
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
  end

  private

    def set_user

    end

    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def snippet_params
      params.require(:snippet).permit(:user_id, :content)
    end

end
