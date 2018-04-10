class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interviews, dependent: :destroy

  enum sex: { male:0, female:1, other:2 }

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birth.strftime(date_format).to_i) / 10000
  end
end
