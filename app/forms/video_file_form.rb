class VideoFileForm < Reform::Form
  property :name
  property :url
  property :state_event

  property :lang_ids
end