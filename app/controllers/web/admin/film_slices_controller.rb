class Web::Admin::FilmSlicesController < Web::Admin::ApplicationController
  def index
    @q = FilmSlice.search(params[:q])
    @film_slices = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = FilmSliceForm.new(FilmSlice.new)
  end

  def create
    @form = FilmSliceForm.new(FilmSlice.new)
    if @form.validate(params[:film_slice] || {})
      @form.save
      redirect_to admin_film_slices_path
    end
  end

  def edit
    @form = FilmSliceForm.new(FilmSlice.find(params[:id]))
  end

  def update
    @form = FilmSliceForm.new(FilmSlice.find(params[:id]))
    if @form.validate(params[:film_slice] || {})
      @form.save
      redirect_to admin_film_slices_path
    else
      render :edit
    end
  end

  def destroy
    film_slice = FilmSlice.find params[:id]
    film_slice.mark_as_deleted
    redirect_to admin_film_slices_path
  end
end