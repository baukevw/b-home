module AppHelper
  def user_avatar
    if current_user.avatar.present?
      current_user.avatar.thumb.url
    else
      'avatar.png'
    end
  end

  def time_separator
    content_tag :span, ':', class: 'input-group-addon'
  end
end
