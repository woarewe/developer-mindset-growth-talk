# Bad

def current_user
  User.find_by(token: params[:token])
end

def display_pro_badge?
  return false unless current_user

  current_user.pro?
end

def stars_count
  return 0 unless current_user

  current_user.stars.size
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
