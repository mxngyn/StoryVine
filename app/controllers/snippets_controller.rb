class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.random
  end

  def new
    p params
    @snippet = Snippet.create
  end


  def update
    @snippet = Snippet.find(params["id"])
    snippet_content = Sanitize.fragment(params["snippet"]["content"], Sanitize::Config::BASIC)
    if @snippet.update(content: snippet_content)
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
    Flag.create(flaggable_type: "Snippet", flaggable_id: @snippet.id)
    flash[:notice] = "Thank you. We'll look into this shortly."
    redirect_to snippet_path(@snippet.id)
  end

  def vine
    @snippet = Snippet.find(params[:id])
    # @snippet.remove_dangerous_html_tags
    render layout: false
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
