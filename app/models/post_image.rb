class PostImage < ApplicationRecord

  # PostImageモデルに対して、Userモデルとの関係性を追加していきます。
  # PostImageモデルに関連付けられるのは、1つのUserモデルです。
  # 単数形の「user」になっている点に注意しましょう。
  belongs_to :user

  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
  attachment :image

  # has_manyでPostCommentモデルを複数持つことを表しています。
  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  # favorited_by?メソッドを作成します。
  # このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
  # 存在していればtrue、存在していなければfalseを返すようにしています。
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
