require 'rails_helper'

describe SnippetsController do
  let(:snippet) {FactoryGirl.create(:snippet)}

  it "shows stuff" do
    get :show, id: snippet
    expect(response).to have_http_status(:success)
  end

end
