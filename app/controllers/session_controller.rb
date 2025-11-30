class SessionController < ApplicationController
  # create では authenticate の実行を skip していいよと言う意味。
  # only を書かない場合は destroy でも skip される
  skip_before_action :authenticate, only: :create

  def create
    # omniauth.auth には github から渡された user 情報や OAuth のアクセストークンが入っている
    user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
    # この session というのは Rails が提供する built-in の機能です。
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end
