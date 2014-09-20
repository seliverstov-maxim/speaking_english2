require 'test_helper'

class Web::Admin::LessonsControllerTest < ActionController::TestCase
  setup do
    @lesson = create :lesson
    @attrs = attributes_for :lesson
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
    get :edit, id: @lesson
    assert :success
  end

  test 'should create lesson' do
    post :create, lesson: @attrs
    assert_redirected_to :admin_lessons

    lesson = Lesson.where(title: @attrs[:title])
    assert lesson
  end

  test 'should not create lesson' do
    post :create
    assert :success
  end

  test 'should update' do
    put :update, id: @lesson, lesson: @attrs
    assert_redirected_to :admin_lessons

    @lesson.reload
    assert { @lesson.title == @attrs[:title] }
  end

  test 'should destroy lesson' do
    delete :destroy, id: @lesson
    assert_redirected_to :admin_lessons

    @lesson.reload
    assert { @lesson.deleted? }
  end

  test 'should recovery lesson' do
    @lesson.mark_as_deleted

    put :update, id: @lesson, lesson: { state_event: :restore }
    assert_redirected_to :admin_lessons

    @lesson.reload
    assert { @lesson.active? }
  end
end