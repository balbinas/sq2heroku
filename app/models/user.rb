class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :layouts

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
                 "d9c2fb4fbd8dece91adf53604d0662376112aff81c36f911931d57e1e2880ea12e2733f770a188117c23673e6dff00bee413225d42360d130c4512995e77b71b")
  end
end
