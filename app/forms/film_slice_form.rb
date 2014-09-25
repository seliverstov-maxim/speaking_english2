class FilmSliceForm < Reform::Form
  property :title
  property :description
  property :state_event
  property :start_at
  property :stop_at

  property :tag_ids
  property :video_file_ids
  property :sub_file_ids
end