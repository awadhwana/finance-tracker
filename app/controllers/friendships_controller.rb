# Friendship controller
class FriendshipsController < ApplicationController
  def destroy
    id = params[:id]
    current_user.friendships.find_by_friend_id(id).destroy
    redirect_to friends_url
  end
end
