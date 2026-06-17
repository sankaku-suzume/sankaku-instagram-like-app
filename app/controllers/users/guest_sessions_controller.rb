class Users::GuestSessionsController < Devise::SessionsController
  def create
    user = User.guest
    sign_in user
    redirect_to  root_path, notice: 'Logged in as a guest user.'
  end
end
