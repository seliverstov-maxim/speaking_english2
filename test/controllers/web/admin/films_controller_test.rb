require 'test_helper'

class Web::Admin::FilmsControllerTest < ActionController::TestCase
  setup do
    @film = create :film
    @attrs = attributes_for :film
  end

  test 'should get index' do
    get :index
    assert :success
  end

  test 'should get new' do
    get :new
    assert :success
  end

  test 'should get edit' do
    get :edit, id: @film
    assert :success
  end

  test 'should create film' do
    post :create, film: @attrs
    assert_redirected_to :admin_films

    film = Film.where(title: @attrs[:title])
    assert film
  end

  test 'should not create film' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @film, film: @attrs
    assert_redirected_to :admin_films

    @film.reload
    assert { @film.title == @attrs[:title] }
  end

  test 'should destroy film' do
    delete :destroy, id: @film
    assert_redirected_to :admin_films

    @film.reload
    assert { @film.deleted? }
  end

  test 'should recovery film' do
    @film.mark_as_deleted

    put :update, id: @film, film: { state_event: :restore }
    assert_redirected_to :admin_films

    @film.reload
    assert { @film.active? }
  end
end