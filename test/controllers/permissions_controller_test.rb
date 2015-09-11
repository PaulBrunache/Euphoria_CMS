require "test_helper"

describe PermissionsController do
  let(:permission) { permissions :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:permissions)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates permission" do
    expect {
      post :create, permission: { create: permission.create, delete: permission.delete, delete_all: permission.delete_all, manage: permission.manage, manage_all: permission.manage_all, name: permission.name }
    }.must_change "Permission.count"

    must_redirect_to permission_path(assigns(:permission))
  end

  it "shows permission" do
    get :show, id: permission
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: permission
    value(response).must_be :success?
  end

  it "updates permission" do
    put :update, id: permission, permission: { create: permission.create, delete: permission.delete, delete_all: permission.delete_all, manage: permission.manage, manage_all: permission.manage_all, name: permission.name }
    must_redirect_to permission_path(assigns(:permission))
  end

  it "destroys permission" do
    expect {
      delete :destroy, id: permission
    }.must_change "Permission.count", -1

    must_redirect_to permissions_path
  end
end
