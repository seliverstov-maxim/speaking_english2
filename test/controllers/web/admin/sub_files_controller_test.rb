require 'test_helper'

class Web::Admin::SubFilesControllerTest < ActionController::TestCase
  setup do
    @sub_file = create :sub_file
    @attrs = attributes_for :sub_file
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
    get :edit, id: @sub_file
    assert :success
  end

  test 'should create sub_file' do
    post :create, sub_file: @attrs
    assert_redirected_to :admin_sub_files

    sub_file = SubFile.where(url: @attrs[:url])
    assert sub_file
  end

  test 'should not create sub_file' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @sub_file, sub_file: @attrs
    assert_redirected_to :admin_sub_files

    @sub_file.reload
    assert { @sub_file.url == @attrs[:url] }
  end

  test 'should destroy sub_file' do
    delete :destroy, id: @sub_file
    assert_redirected_to :admin_sub_files

    @sub_file.reload
    assert { @sub_file.deleted? }
  end

  test 'should recovery sub_file' do
    @sub_file.mark_as_deleted

    put :update, id: @sub_file, sub_file: { state_event: :restore }
    assert_redirected_to :admin_sub_files

    @sub_file.reload
    assert { @sub_file.active? }
  end
end