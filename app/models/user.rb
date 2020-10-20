class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Userモデルに対して、PostImageモデルが1:Nになるよう関連付けます。
  # dependent: :destroyは、has_manyで使えるオプションです。
  # 1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定です。
  has_many :post_images, dependent: :destroy
  # Userモデルに、PostImageモデルとの関連付けを記述します。
  has_many :post_comments, dependent: :destroy
  # Favoriteモデルのカラム（user_idとpost_image_id）は、UserモデルのidやPostImageモデルのidと関連付けが必要です。
  has_many :favorites, dependent: :destroy

end
