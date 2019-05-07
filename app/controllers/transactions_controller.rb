class TransactionsController < ApplicationController
  def deposit
  end

  def show
  end

  def withdraw
  end

  def transfer
  end

  def index
    @transactions = current_user.transactions
  end

  def deposit_update
    amount = params[:transaction][:amount]
    if amount > 0
      User.deposit(current_user,amount.to_f, nil)
      flash[:success] = "Your balance is updated."
    end
    redirect_to root_path
  end

  def withdraw_update
    amount = params[:transaction][:amount].to_f
    if current_user.total_balance > amount
      User.withdraw(current_user, amount, nil)
      flash[:success] = "Your balance is updated."
    else
      flash[:danger] = "Sorry you don't have enough balance!"
    end
    redirect_to root_path
  end

  def transfer_update
    amount = params[:user][:amount].to_f
    if current_user.total_balance > amount
      recipient_user = User.find_by(account_no: params[:user][:account_no])
      if recipient_user.present?
        User.withdraw(current_user, amount, recipient_user.id)
        User.deposit(recipient_user, amount,recipient_user.id)
        flash[:success] = "Transfer amount is done successfully."
      end
    else
      flash[:danger] = "Sorry you don't have enough balance!"
    end
    redirect_to root_path
  end
end
