class NotificationMailer < ActionMailer::Base
  default from: "admin@gmail.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "退会処理が完了しました。", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
