class Users::LikesController < ApplicationController
  def create
        @supplement = Supplement.find(params[:supplement_id])
        like = current_user.likes.new(supplement_id: @supplement.id)
        like.save
        # redirect_back(fallback_location: root_path) #非同期の場合は不要
    end

    def destroy
        @supplement = Supplement.find(params[:supplement_id])
        like = current_user.likes.find_by(supplement_id: @supplement.id)
        like.destroy
        # redirect_back(fallback_location: root_path)非同期の場合は不要
    end
end
