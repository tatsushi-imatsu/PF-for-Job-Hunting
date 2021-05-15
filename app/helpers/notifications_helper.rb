module NotificationsHelper

    def notification_form(notification)
      @visiter = notification.visiter
      @post_comment = nil
      #notification.actionがfollowかlikeかcommentか
      case notification.action
        when "follow" then
          tag.a(notification.visiter.last_name_kana+notification.visiter.first_name_kana, href:user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
        when "favorite" then
          tag.a(notification.visiter.last_name_kana+notification.visiter.first_name_kana, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id), style:"font-weight: bold;")+"にいいねしました"
        when "post_comment" then
          tag.a(@visiter.last_name_kana+@visiter.first_name_kana, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id), style:"font-weight: bold;")+"にコメントしました"
      end
    end

    def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
    end
    # 未確認の通知(checked:falseの通知)を示すunchecked_notificationsメソッド

end
