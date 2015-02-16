class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.random
  end

  def new
    @snippet = Snippet.create
  end


  def update
    @snippet = Snippet.find(params["id"])
    if @snippet.update(content: params["snippet"]["content"])
      User.find(session[:user_id]).snippets << @snippet
      if request.xhr?
        render plain: "Autosaved on " + @snippet.updated_at.strftime("%m/%d/%Y at %I:%M:%S %p")
      else
        redirect_to snippet_path(@snippet)
      end
    else
      if request.xhr?
        render plain: "Failed to autosave: #{@snippet.errors.messages.inspect}"
      else
        flash[:notice] = "There was an error saving your snippet. Please make sure it isn't blank."
        render :new
      end
    end
  end

  def show
    set_snippet.remove_dangerous_html_tags!
    @stories = @snippet.stories.where(published: true)
  end

  def destroy
    @snippet = Snippet.find(params["id"])
    @snippet.destroy
    redirect_to "/"
  end

  def flag
    @snippet = Snippet.find(params[:id])
    if !(Flag.where(flaggable_type: "Snippet", flaggable_id: @snippet.id))
      @snippet.flag(session[:user_id])
    end
    flash[:notice] = "Thank you. We'll look into this shortly."
    redirect_to snippet_path(@snippet.id)
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
