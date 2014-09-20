require 'test_helper'

class Web::Admin::LangsControllerTest < ActionController::TestCase
  setup do
    @lang = create :lang
    @attrs = attributes_for :lang
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
    get :edit, id: @lang
    assert :success
  end

  test 'should create lang' do
    post :create, lang: @attrs
    assert_redirected_to :admin_langs

    lang = Lang.where(name: @attrs[:name])
    assert lang
  end

  test 'should not create lang' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @lang, lang: @attrs
    assert_redirected_to :admin_langs

    @lang.reload
    assert { @lang.name == @attrs[:name] }
  end

  test 'should destroy lang' do
    delete :destroy, id: @lang
    assert_redirected_to :admin_langs

    @lang.reload
    assert { @lang.deleted? }
  end

  test 'should recovery lang' do
    @lang.mark_as_deleted

    put :update, id: @lang, lang: { state_event: :restore }
    assert_redirected_to :admin_langs

    @lang.reload
    assert { @lang.active? }
  end
end