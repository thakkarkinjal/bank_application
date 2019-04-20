class TransactionsController < ApplicationController
  def deposit
  end

  def show
  end

  def withdraw
  end

  def transfer
  end

  def deposit_update
    User.deposit(current_user,params[:transaction][:amount].to_f, nil)
    flash[:success] = "Your balance is updated."
    redirect_to root_path
  end

  def withdraw_update
    if current_user.total_balance > params[:transaction][:amount].to_f
      User.withdraw(current_user, params[:transaction][:amount].to_f, nil)
      flash[:success] = "Your balance is updated."
    else
      flash[:danger] = "Sorry you don't have enough balance!"
    end
    redirect_to root_path
  end

  def transfer_update
    if current_user.total_balance > params[:user][:amount].to_f
      recipient_user = User.find_by(account_no: params[:user][:account_no])
      User.withdraw(current_user, params[:user][:amount].to_f, recipient_user.id)
      User.deposit(recipient_user, params[:user][:amount].to_f,recipient_user.id)
      flash[:success] = "Transfer amount is done successfully."
    else
      flash[:danger] = "Sorry you don't have enough balance!"
    end
    redirect_to root_path
  end
end
