class Users::HomesController < ApplicationController

  before_action :authenticate_user!, except: [:top,:about,:privacy,:tos]

  def top
    @popular_articles = Article.order('impressions_count DESC').take(8)
    @training = Training.where(params[:id])
  end

  def about
  end

  def privacy
  end

  def tos
  end

  def contact
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save #ユーザーのインスタンスが新しく生成されて保存されたら
      ContactMailer.send_user(@contact).deliver #確認メールを送信
      ContactMailer.send_mail(@contact).deliver #確認メールを送信
      flash[:success] = 'ご意見賜りましてありがとうございます。'
      redirect_to root_path
    else
      render 'contact'
    end
  end


private

  def contact_params
    params.require(:contact).permit(:message).merge(user_id: current_user.id)
  end

end



  private