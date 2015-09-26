class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  def index
    @announcements = Announcement.all
  end

  def show
  end

  def new
    @announcement = Announcement.new
  end

  def edit
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      redirect_to @announcement, notice: 'Announcement was successfully created.'
    else
      render :new
    end
  end

  def update
    if @announcement.update(announcement_params)
      redirect_to @announcement, notice: 'Announcement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @announcement.destroy
    redirect_to announcements_url, notice: 'Announcement was successfully destroyed.'
  end

  private
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:name, :content, :start_date, :end_date, :user_id)
    end
end
