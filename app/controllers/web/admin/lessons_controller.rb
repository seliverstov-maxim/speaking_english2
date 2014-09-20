class Web::Admin::LessonsController < Web::Admin::ApplicationController
  def index
    @q = Lesson.search(params[:q])
    @lessons = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = LessonForm.new(Lesson.new)
  end

  def create
    @form = LessonForm.new(Lesson.new)
    if @form.validate(params[:lesson] || {})
      @form.save
      redirect_to admin_lessons_path
    end
  end

  def edit
    @form = LessonForm.new(Lesson.find(params[:id]))
  end

  def update
    @form = LessonForm.new(Lesson.find(params[:id]))
    if @form.validate(params[:lesson] || {})
      @form.save
      redirect_to admin_lessons_path
    else
      render :edit
    end
  end

  def destroy
    lesson = Lesson.find params[:id]
    lesson.mark_as_deleted
    redirect_to admin_lessons_path
  end
end