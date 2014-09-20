require 'test_helper'

class Web::Admin::VideoFilesControllerTest < ActionController::TestCase
  setup do
    @video_file = create :video_file
    @attrs = attributes_for :video_file
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
    get :edit, id: @video_file
    assert :success
  end

  test 'should create video_file' do
    post :create, video_file: @attrs
    assert_redirected_to :admin_video_files

    video_file = VideoFile.where(url: @attrs[:url])
    assert video_file
  end

  test 'should not create video_file' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @video_file, video_file: @attrs
    assert_redirected_to :admin_video_files

    @video_file.reload
    assert { @video_file.url == @attrs[:url] }
  end

  test 'should destroy video_file' do
    delete :destroy, id: @video_file
    assert_redirected_to :admin_video_files

    @video_file.reload
    assert { @video_file.deleted? }
  end

  test 'should recovery video_file' do
    @video_file.mark_as_deleted

    put :update, id: @video_file, video_file: { state_event: :restore }
    assert_redirected_to :admin_video_files

    @video_file.reload
    assert { @video_file.active? }
  end
end