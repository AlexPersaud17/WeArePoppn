class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @party = Party.find(params[:party_id])
    @guest = Guest.find_by(user: current_user, party: @party)
    @comment = @guest.comments.create(comment_params)
    if request.xhr?
      render :partial => "comment", locals: {comment: @comment}
    else
      redirect_to @party
    end
  end

  private
  def comment_params
    params.require(:comments).permit(:body)
  end

end
