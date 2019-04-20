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

  def self.deposit(user, amount, recipient_id)
    new_balance = user.total_balance + amount
    if user.update(total_balance: new_balance)
      user.transactions.create(transaction_type: "deposit", amount: amount, recipient_id: recipient_id)
    end
  end

  def self.withdraw(user, amount, recipient_id)
    new_balance = user.total_balance - amount
    if user.update(total_balance: new_balance)
      user.transactions.create(transaction_type: "withdraw", amount: amount, recipient_id: recipient_id)
    end
  end

  def self.get_user_name(id)
    user = User.find_by(id: id)
    user_name = user.first_name.titleize + user.last_name.titleize
    return user_name
  end

end
