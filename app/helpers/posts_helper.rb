module PostsHelper
  def time_line_image(post)
    return 'cd-icon-picture.svg' if post.picture.present?
    return 'cd-icon-movie.svg' if post.video.present?
    'cd-icon-location.svg'
  end

  def time_line_class(post)
    return 'cd-picture' if post.picture.present?
    return 'cd-movie' if post.video.present?
    'cd-location'
  end
end
