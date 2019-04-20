class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_account_number

  has_many :transactions
  private
  def generate_account_number
    self.update(account_no: SecureRandom.base58(12))
  end

end
