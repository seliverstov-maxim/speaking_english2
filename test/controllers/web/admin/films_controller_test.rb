require 'test_helper'

class Web::Admin::FilmsControllerTest < ActionController::TestCase
  setup do
  end

  test 'should get index' do
    get :index
    assert :success
  end
end