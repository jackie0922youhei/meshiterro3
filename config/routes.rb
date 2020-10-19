Rails.application.routes.draw do

  # deviseでは、ログイン認証が成功した場合、config/routes.rbファイル内で設定されているrootパスへリダイレクトされます。
  # ログイン認証が成功した後、投稿画像の一覧画面が表示されるように設定します。
  root 'post_images#index'

  devise_for :users

  # resourcesメソッドは、ルーティングを一括して自動生成してくれます。
  # onlyは、生成するルーティングを限定するオプションです。
  resources :post_images, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
