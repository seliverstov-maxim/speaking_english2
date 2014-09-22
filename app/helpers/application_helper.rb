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
end
