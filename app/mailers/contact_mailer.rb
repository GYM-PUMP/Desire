class ContactMailer < ApplicationMailer
	def send_user(user) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    mail(to: @user.email, subject: '【株式会社　BIG Muscle】 お問い合わせありがとうございます')
  end
end
