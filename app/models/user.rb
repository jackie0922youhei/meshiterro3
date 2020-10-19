class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Userモデルに対して、PostImageモデルが1:Nになるよう関連付けます。       
  has_many :post_images, dependent: :destroy
  
end
