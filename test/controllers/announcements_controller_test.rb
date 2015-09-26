require "test_helper"

describe AnnouncementsController do
  let(:announcement) { announcements :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:announcements)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates announcement" do
    expect {
      post :create, announcement: { content: announcement.content, end_date: announcement.end_date, name: announcement.name, start_date: announcement.start_date, user_id: announcement.user_id }
    }.must_change "Announcement.count"

    must_redirect_to announcement_path(assigns(:announcement))
  end

  it "shows announcement" do
    get :show, id: announcement
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: announcement
    value(response).must_be :success?
  end

  it "updates announcement" do
    put :update, id: announcement, announcement: { content: announcement.content, end_date: announcement.end_date, name: announcement.name, start_date: announcement.start_date, user_id: announcement.user_id }
    must_redirect_to announcement_path(assigns(:announcement))
  end

  it "destroys announcement" do
    expect {
      delete :destroy, id: announcement
    }.must_change "Announcement.count", -1

    must_redirect_to announcements_path
  end
end
