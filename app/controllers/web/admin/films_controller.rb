class Web::Admin::FilmsController < Web::Admin::ApplicationController
  def index
    @q = Film.search(params[:q])
    @films = @q.result.order(id: :asc).page(params[:page])
  end
end