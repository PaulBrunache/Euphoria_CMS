require "test_helper"

describe PagesController do
  let(:page) { pages :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:pages)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates page" do
    expect {
      post :create, page: { description: page.description, follow: page.follow, index: page.index, keywords: page.keywords, name: page.name }
    }.must_change "Page.count"

    must_redirect_to page_path(assigns(:page))
  end

  it "shows page" do
    get :show, id: page
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: page
    value(response).must_be :success?
  end

  it "updates page" do
    put :update, id: page, page: { description: page.description, follow: page.follow, index: page.index, keywords: page.keywords, name: page.name }
    must_redirect_to page_path(assigns(:page))
  end

  it "destroys page" do
    expect {
      delete :destroy, id: page
    }.must_change "Page.count", -1

    must_redirect_to pages_path
  end
end
