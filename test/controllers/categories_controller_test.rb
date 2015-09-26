require "test_helper"

describe CategoriesController do
  let(:category) { categories :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:categories)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates category" do
    expect {
      post :create, category: { default: category.default, name: category.name, post_id: category.post_id }
    }.must_change "Category.count"

    must_redirect_to category_path(assigns(:category))
  end

  it "shows category" do
    get :show, id: category
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: category
    value(response).must_be :success?
  end

  it "updates category" do
    put :update, id: category, category: { default: category.default, name: category.name, post_id: category.post_id }
    must_redirect_to category_path(assigns(:category))
  end

  it "destroys category" do
    expect {
      delete :destroy, id: category
    }.must_change "Category.count", -1

    must_redirect_to categories_path
  end
end
