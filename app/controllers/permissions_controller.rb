class PermissionsController < ApplicationController

  def index
    @permissions = Permission.all
  end


  def show
  end

  def new
    @permission = Permission.new
  end

  def edit
  end

  def create
    @permission = Permission.new(current_resource)

    if @permission.save
      redirect_to @permission, notice: 'Permission was successfully created.'
    else
      render :new
    end
  end

  def update
    if @permission.update(current_resource)
      redirect_to @permission, notice: 'Permission was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @permission.destroy
    redirect_to permissions_url, notice: 'Permission was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def current_resource
      @permission ||= Permission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def permission_params
      params.require(:permission).permit(:name, :create, :manage, :delete, :manage_all, :delete_all)
    end
end
