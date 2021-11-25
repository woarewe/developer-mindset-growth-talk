# Bad

def current_user
  User.find_by(token: params[:token])
end

def display_pro_badge?
  return false unless current_user

  current_user.pro?
end

# Good

class Guest
  def pro?
    false
  end
end

def current_user
  User.find_by(token: params[:token]) || Guest.new
end

def display_pro_badge?
  current_user.pro?
end