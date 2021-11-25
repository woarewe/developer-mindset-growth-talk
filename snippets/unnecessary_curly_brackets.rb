# Bad
def request_paylod(user)
  common_params.merge({ user_id: user.id })
end

# Good
def request_paylod(user)
  common_params.merge(user_id: user.id)
end