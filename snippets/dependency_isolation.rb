# Bad

# Gemfile
gem 'bugsnag'

def perform(params)
  # does some business logic
rescue => error
  Bugsnag.notify(error)
end

# Good

# Gemfile
gem 'bugsnag'

# lib/bugtracker.rb
class Bugtracker
  def self.notify(error)
    Bugsnag.notify(error)
  end
end

def perform(params)
  # does some business logic
rescue => error
  Bugtracker.notify(error)
end