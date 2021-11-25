# Bad
def as_json(user)
  {
    :email => user.email,
    :full_name => "#{user.first_name} #{user.last_name}" 
  }
end

# Good
def as_json(user)
  {
    email: user.email,
    full_name: "#{user.first_name} #{user.last_name}" 
  }
end