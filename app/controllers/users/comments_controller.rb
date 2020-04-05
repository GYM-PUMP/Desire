class Users::CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
	    @supplement = Supplement.find(params[:supplement_id])
	    @supplement_comment = current_user.comments.build(supplement_comment_params)
	    @supplement_comment.supplement_id = @supplement.id
	    @supplement_comment.score = Language.get_data(supplement_comment_params[:body])
	  	if @supplement_comment.save
	      # logger.info @supplement_comment.errors.messages.inspect
		end
	    render 'comments/create.js.erb'
	end


	def destroy
		@supplement_comment = Comment.find(params[:supplement_id])
		@supplement = @supplement_comment.supplement
		if @supplement_comment.user != current_user
			redirect_to users_supplement_path(@supplement)
		end
	  	@supplement_comment.destroy
	  	@delete_supplement_comment_id = params[:supplement_id]
	  	render 'comments/destroy.js.erb'
	end

private

	def supplement_comment_params
	    params.require(:comment).permit(:body, :rate)
	end
	def gym_comment_params
	    params.require(:comment).permit(:body, :rate)
	end
end