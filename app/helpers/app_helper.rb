module AppHelper
  def user_avatar
    if current_user.avatar.present?
      current_user.avatar.thumb.url
    else
      'avatar.png'
    end
  end
end
