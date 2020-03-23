class Users::HomesController < ApplicationController
  def top
    @popular_articles = Article.order('impressions_count DESC').take(6)
  end

  def about
  end

  def privacy
  end

  def contact
    @user = User.new
  end

  def tos
  end


  def create
    if @user.save(user_params) #ユーザーのインスタンスが新しく生成されて保存されたら
      ContactMailer.send_user(@user).deliver #確認メールを送信
      redirect_to @user
    else
      render 'top'
    end
  end

private

  def user_params
      params.require(:user).permit(:name, :postal_code, :address, :height, :age, :gender, :weight, :gym_id, :user_status, :movement, :message)
  end

end
