class Web::Admin::VideoFilesController < Web::Admin::ApplicationController
  def index
    @q = VideoFile.search(params[:q])
    @video_files = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = VideoFileForm.new(VideoFile.new)
  end

  def create
    @form = VideoFileForm.new(VideoFile.new)
    if @form.validate(params[:video_file] || {})
      @form.save
      redirect_to admin_video_files_path
    end
  end

  def edit
    @form = VideoFileForm.new(VideoFile.find(params[:id]))
  end

  def update
    @form = VideoFileForm.new(VideoFile.find(params[:id]))
    if @form.validate(params[:video_file] || {})
      @form.save
      redirect_to admin_video_files_path
    else
      render :edit
    end
  end

  def destroy
    video_file = VideoFile.find params[:id]
    video_file.mark_as_deleted
    redirect_to admin_video_files_path
  end
end