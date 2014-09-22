class Web::LessonsController < Web::ApplicationController
  def index
    @lessons = Lesson.order(id: :asc).page(params[:page])
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end