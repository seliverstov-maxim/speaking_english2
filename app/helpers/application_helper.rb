module ApplicationHelper
  def tag_collection
    Tag.pluck(:name, :id)
  end

  def video_collection
    VideoFile.pluck(:name, :id)
  end

  def sub_collection
    SubFile.pluck(:name, :id)
  end

  def film_collection
    Film.pluck(:title, :id)
  end

  def film_slice_collection
    FilmSlice.pluck(:title, :id)
  end

  def lang_collection
    Lang.pluck(:name, :id)
  end
end
