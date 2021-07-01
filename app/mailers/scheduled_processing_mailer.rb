class ScheduledProcessingMailer < ApplicationMailer
  
  def check_notice_mail
    
    users_with_unckecked_notices = User.all.select do |user|
    # 通知を確認していないユーザを選出
    user.passive_notifications.where(visited_id: user.id, checked: false).count >= 3
    # false（通知未確認）が３件以上あるユーザ  
    end

    users_with_unckecked_notices_mails = users_with_unckecked_notices.pluck(:email)
    # 通知未確認のユーザのメールアドレスを取り出す

    mail(subject: "未読の通知が3件以上あります", bcc: users_with_unckecked_notices_mails)
    # bccで通知未確認ユーザへメール送信
  end
  
end
