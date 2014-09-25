[:ru, :en].each do |lang|
  Lang.where(name: lang).first_or_create!
end

[:rus, :eng].each do |tag|
  Tag.where(name: tag).first_or_create!
end

#create film slices
[
  {start_at: 0, stop_at: 34, title: 'test_film_slice1'},
  {start_at: 0, stop_at: 34, title: 'test_film_slice2'}
].each do |params|
  film_slice = FilmSlice.where(title: params[:title]).first_or_create!
  film_slice.update!({start_at: params[:start_at], stop_at: params[:stop_at]})
end

#create videos
[
  {lang: :en, url: '/system/videos/1.avi', name: 'video 1', film_title: 'test_film_slice1'},
  {lang: :en, url: '/system/videos/2.avi', name: 'video 2', film_title: 'test_film_slice2'}
].each do |params|
  lang = Lang.where(name: params[:lang]).first
  film_slice = FilmSlice.where(title: params[:film_title]).first

  video = VideoFile.where(url: params[:url]).first_or_create!
  video.update!({lang_id: lang.id, film_slice_id: film_slice.id, name: params[:name]})
end

#create subtitles
[
  {lang: :en, url: '/system/subs/1.src', name: 'subtitle 1', film_title: 'test_film_slice1'},
  {lang: :en, url: '/system/subs/2.src', name: 'subtitle 2', film_title: 'test_film_slice2'}
].each do |params|
  lang = Lang.where(name: params[:lang]).first
  film_slice = FilmSlice.where(title: params[:film_title]).first

  sub = SubFile.where(url: params[:url]).first_or_create!
  sub.update!({lang_id: lang.id, film_slice_id: film_slice.id, name: params[:name]})
end

#create lessons
[
  {title: 'lesson 1', film_slice: 'test_film_slice1'},
  {title: 'lesson 1', film_slice: 'test_film_slice1'}
].each do |params|
  lesson = Lesson.where(title: params[:title]).first_or_create!
  film_slice = FilmSlice.where(title: params[:film_slice]).first

  lesson.update!({film_slice_ids: [film_slice.id]})
end

raise 'Seeds failed' if !Lesson.first.film_slices.first.video_files.first.url
raise 'Seeds failed' if !Lesson.last.film_slices.last.sub_files.last.url