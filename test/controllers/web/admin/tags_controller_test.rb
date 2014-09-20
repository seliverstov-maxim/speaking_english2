require 'test_helper'

class Web::Admin::TagsControllerTest < ActionController::TestCase
  setup do
    @tag = create :tag
    @attrs = attributes_for :tag
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
    get :edit, id: @tag
    assert :success
  end

  test 'should create tag' do
    post :create, tag: @attrs
    assert_redirected_to :admin_tags

    tag = Tag.where(name: @attrs[:name])
    assert tag
  end

  test 'should not create tag' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @tag, tag: @attrs
    assert_redirected_to :admin_tags

    @tag.reload
    assert { @tag.name == @attrs[:name] }
  end

  test 'should destroy tag' do
    delete :destroy, id: @tag
    assert_redirected_to :admin_tags

    @tag.reload
    assert { @tag.deleted? }
  end

  test 'should recovery tag' do
    @tag.mark_as_deleted

    put :update, id: @tag, tag: { state_event: :restore }
    assert_redirected_to :admin_tags

    @tag.reload
    assert { @tag.active? }
  end
end