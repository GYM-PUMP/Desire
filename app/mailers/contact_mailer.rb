class ContactMailer < ApplicationMailer
  def send_user(user) #メソッドに対して引数を設定
    @user = User.find(user.user_id)
    mail(to: @user.email, subject: '【株式会社  BIG Muscle】 ご意見いただき誠にありがとうございます。')
  end

  def send_mail(contact)
  @contact = contact
  mail(
    to:   ENV["ADMIN_EMAIL"],
    subject: 'お問い合わせ通知'
  )
end
end
