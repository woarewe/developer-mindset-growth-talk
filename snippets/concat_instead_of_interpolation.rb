# Bad
def full_name(user)
  user.first_name + ' ' + user.last_name
end

# Good
def full_name(user)
  "#{user.first_name} #{user.last_name}"
end
