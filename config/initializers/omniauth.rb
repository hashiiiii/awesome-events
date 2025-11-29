Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, Rails.application.credentials.client_id, Rails.application.credentials.client_secret
  # ベタ書きしていたけど、credentials.yml.enc を設定したので変更した
  else
    # prod でそのまま書くのは危険
    # credentials.yml.enc に書いておく
    # credentials.yml.enc はファイルに暗号化した yml ファイルを保存
    # 複合化キーは master.key に保存
    # これ以外にも RAILS_MASTER_KEY 環境変数に設定する方法もある
    # VISUAL="code --wait" bin/rails credentials:edit コマンドを打つと複合化した状態で VScode 上で編集できる
    # 環境変数を変更すれば rubymine でも編集可能
    # 編集したので not prod 環境でも credentials.yml.enc を使うように変更した
    provider :github, Rails.application.credentials.client_id, Rails.application.credentials.client_secret
  end
end
