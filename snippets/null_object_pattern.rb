# Bad

def current_user
  # returns a current user or nil
end

def chat_username
  return 'Guest' unless current_user

  current_user.pro?
end

def chat_avatar_path
  return '/guest.png' unless current_user

  current_user.avatar_path
end



# Good

class Guest
  def pro?
    false
  end

  def stars
    []
  end
end

def current_user
  User.find_by(token: params[:token]) || Guest.new
end

def display_pro_badge?
  current_user.pro?
end

def stars_count
  current_user.stars.size
end
