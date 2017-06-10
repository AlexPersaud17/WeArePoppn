class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @party = Party.find(params[:party_id])
    @guest = Guest.find_by(user: current_user, party: @party)
    @comment = @guest.comments.create(comment_params)
    redirect_to @party
  end

  private
  def comment_params
    params.require(:comments).permit(:body)
  end

end
