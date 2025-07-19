class Apps::ProfilesController < Apps::ApplicationController
  def show
    @profile = current_user.prepare_profile
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'Successfully updated.'
    else
      flash.now[:error] = 'Failed to update.'
      render :edit
    end
   end

   private
   def profile_params
     params.require(:profile).permit(
      :avatar
     )
     # { avatar: params[:avatar] } if params[:avatar].present?
   end
end
