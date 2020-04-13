class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :layouts

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
                 11f06107c78363628e14531d7431b89c)
  end
end
