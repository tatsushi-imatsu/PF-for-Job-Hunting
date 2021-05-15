class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications
    #current_userの投稿に紐づいた通知一覧
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
      #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    end
  end


end
