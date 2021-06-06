class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) # ログイン後画面遷移先
    case resource

    when User
      posts_path
    when Admin
      admins_users_path
    end
  end

  def after_sign_out_path_for(resource_or_scope) # ログアウト後画面遷移先
    if resource_or_scope == :user
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
  
  # 例外処理
  unless Rails.env.development? || Rails.env.test?
    rescue_from Exception,                      with: :render_500 
    rescue_from ActiveRecord::RecordNotFound,   with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
  end

# viewsでerrorディレクトリを作りそこに404.html.erb/505.html.erbを作成する
  def render_404
    render template: 'errors/404', status: 404 
  end

  def render_500
    render template: 'errors/500', status: 500
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted])
  end
  
  
end
