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
    new_balance = current_user.total_balance + params[:transaction][:amount].to_f
    if current_user.update(total_balance: new_balance)
      current_user.transactions.create(transaction_type: "deposit", amount: params[:transaction][:amount])
    end
    flash[:success] = "Your balance is updated."
    redirect_to root_path
  end

  def withdraw_update
    if current_user.total_balance > params[:transaction][:amount].to_f
      new_balance = current_user.total_balance - params[:transaction][:amount].to_f
      if current_user.update(total_balance: new_balance)
        current_user.transactions.create(transaction_type: "withdraw", amount: params[:transaction][:amount])
      end
      flash[:success] = "Your balance is updated."
    else
      flash[:danger] = "Sorry you don't have enough balance!"
    end
    redirect_to root_path
  end
end
