# Bad

module ApplicationHelper
  GUEST_USERNAME = 'Guest'
  GUEST_AVATAR_PATH = '/guest.jpg'

  def current_user
    User.find_by(token: param[:token])
  end

  def chat_username
    return GUEST_USERNAME unless current_user

    current_user.username
  end

  def chat_avatar_path
    return GUEST_AVATAR_PATH unless current_user

    current_user.avatar_path
  end
end


# Good

class Guest
  USERNAME = 'Guest'
  AVATAR_PATH = '/guest.jpg'

  def username
    USERNAME
  end

  def avatar_path
    AVATAR_PATH
  end
end

module ApplicationHelper
  def current_user
    User.find_by(token: param[:token]) || Guest.new
  end

  def chat_username
    current_user.username
  end

  def chat_avatar_path
    current_user.avatar_path
  end
end

