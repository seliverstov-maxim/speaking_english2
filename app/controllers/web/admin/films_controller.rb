class Web::Admin::FilmsController < Web::Admin::ApplicationController
  def index
    @q = Film.search(params[:q])
    @films = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = FilmForm.new(Film.new)
  end

  def create
    @form = FilmForm.new(Film.new)
    if @form.validate(params[:film] || {})
      @form.save
      redirect_to admin_films_path
    end
  end

  def edit
    @form = FilmForm.new(Film.find(params[:id]))
  end

  def update
    @form = FilmForm.new(Film.find(params[:id]))
    if @form.validate(params[:film] || {})
      @form.save
      ap @form
      redirect_to admin_films_path
    else
      render :edit
    end
  end

  def destroy
    film = Film.find params[:id]
    film.mark_as_deleted
    redirect_to admin_films_path
  end
end