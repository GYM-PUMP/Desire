class ContactMailer < ApplicationMailer
	def send_user(user) #メソッドに対して引数を設定
    @user = User.find(user.user_id)
 	# binding.pry
    mail(to: @user.email, subject: '【株式会社  BIG Muscle】 お問い合わせありがとうございます')
  end
end
