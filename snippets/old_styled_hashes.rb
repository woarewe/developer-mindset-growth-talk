# Bad
def as_json(user)
  {
    :email => user.email,
    :name => user.name
  }
end

# Good
def as_json(user)
  {
    email: user.email,
    name: user.name
  }
end