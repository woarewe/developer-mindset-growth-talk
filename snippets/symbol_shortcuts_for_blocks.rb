# Bad
def user_full_names
  @users.map { |user| user.full_name }
end

# Good
def user_full_names
  @users.map(&:full_name)
end