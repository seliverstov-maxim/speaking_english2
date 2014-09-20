require 'test_helper'

class Web::Admin::FilmSlicesControllerTest < ActionController::TestCase
  setup do
    @film_slice = create :film_slice
    @attrs = attributes_for :film_slice
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
    get :edit, id: @film_slice
    assert :success
  end

  test 'should create film_slice' do
    post :create, film_slice: @attrs
    assert_redirected_to :admin_film_slices

    film_slice = FilmSlice.where(title: @attrs[:title])
    assert film_slice
  end

  test 'should not create film_slice' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @film_slice, film_slice: @attrs
    assert_redirected_to :admin_film_slices

    @film_slice.reload
    assert { @film_slice.title == @attrs[:title] }
  end

  test 'should destroy film_slice' do
    delete :destroy, id: @film_slice
    assert_redirected_to :admin_film_slices

    @film_slice.reload
    assert { @film_slice.deleted? }
  end

  test 'should recovery film_slice' do
    @film_slice.mark_as_deleted

    put :update, id: @film_slice, film_slice: { state_event: :restore }
    assert_redirected_to :admin_film_slices

    @film_slice.reload
    assert { @film_slice.active? }
  end
end