class FollowsController < ApplicationController
  before_action :authenticate_user!

  def show
    follower = current_user
    following = User.find(params[:account_id])
    follow_status = follower.has_followed?(following)
    render json: { hasFollowed: follow_status, followerID: follower.id }
  end

  def create
    current_user.follow!(params[:account_id])
    render json: { status: 'ok' }
  end
end
