require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:budgets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_budget
    assert_difference('Budget.count') do
      post :create, :budget => { }
    end

    assert_redirected_to budget_path(assigns(:budget))
  end

  def test_should_show_budget
    get :show, :id => budgets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => budgets(:one).id
    assert_response :success
  end

  def test_should_update_budget
    put :update, :id => budgets(:one).id, :budget => { }
    assert_redirected_to budget_path(assigns(:budget))
  end

  def test_should_destroy_budget
    assert_difference('Budget.count', -1) do
      delete :destroy, :id => budgets(:one).id
    end

    assert_redirected_to budgets_path
  end
end
