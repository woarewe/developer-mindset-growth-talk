# Bad
def display_pro_badge?
  return unless current_user

  current_user.pro?
end

# Good
def display_pro_badge?
  return false unless current_user

  current_user.pro?
end