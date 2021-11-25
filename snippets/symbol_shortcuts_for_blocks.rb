# Bad
def save_users
  @users.each { |user| user.save! }
end

# Good
def save_users
  @users.each(&:save!)
end