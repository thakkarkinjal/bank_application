require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get deposit" do
    get transactions_deposit_url
    assert_response :success
  end

  test "should get show" do
    get transactions_show_url
    assert_response :success
  end

  test "should get withdraw" do
    get transactions_withdraw_url
    assert_response :success
  end

  test "should get transfer" do
    get transactions_transfer_url
    assert_response :success
  end

end
