# Bad

class User
  # many other methods

  def full_name
    first_name + ' ' + last_name
  end
end

# Good

class User
  # many other methods

  def full_name
    "#{first_name} #{last_name}"
  end
end
