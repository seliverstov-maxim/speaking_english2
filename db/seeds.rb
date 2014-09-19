[:ru, :en].each do |lang|
  Lang.where(name: lang).first_or_create!
end

[:rus, :eng].each do |tag|
  Tag.where(name: tag).first_or_create!
end

[
  {title: 'test_film1'},
  {title: 'test_film2'}
].each do |params|
  Film.where(title: params[:title]).first_or_create!
end

[
  {tag: :eng, lang: :en, url: '/system/videos/1.avi', film_title: 'test_film1'},
  {tag: :eng, lang: :en, url: '/system/videos/2.avi', film_title: 'test_film2'}
].each do |params|
  lang = Lang.where(name: params[:lang]).first
  tag = Tag.where(name: params[:tag]).first
  film = Film.where(title: params[:film_title]).first

  video = Film::VideoFile.where(url: params[:url]).first_or_create!
  video.update!({lang_id: lang.id, film_id: film.id})
end

[
  {tag: :eng, lang: :en, url: '/system/subs/1.src', film_title: 'test_film1'},
  {tag: :eng, lang: :en, url: '/system/subs/2.src', film_title: 'test_film2'}
].each do |params|
  lang = Lang.where(name: params[:lang]).first
  tag = Tag.where(name: params[:tag]).first
  film = Film.where(title: params[:film_title]).first

  sub = Film::SubFile.where(url: params[:url]).first_or_create!
  sub.update!({lang_id: lang.id, film_id: film.id})
end

[
  {start_at: Time.at(0.second), stop_at: Time.at(34.seconds), film_title: 'test_film1', title: 'slice1'},
  {start_at: Time.at(0.second), stop_at: Time.at(34.seconds), film_title: 'test_film2', title: 'slice2'}
].each do |params|
  film = Film.where(title: params[:film_title]).first
  film_slice = FilmSlice.where(title: params[:title]).first_or_create!
  film_slice.update!({start_at: params[:start_at], stop_at: params[:stop_at], film_id: film.id})
end