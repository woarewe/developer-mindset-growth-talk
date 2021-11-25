# Bad
def user_emails
  emails = []
  @users.each do |user|
    emails << user.email
  end
  emails
end

# Good
def user_emails
  @users.map(&:email)
end