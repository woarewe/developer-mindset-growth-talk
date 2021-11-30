# Bad

# Gemfile
gem 'bugsnag'

class ServiceA
  def call(params)
    # does some business logic
  rescue => error
    Bugsnag.notify(error)
  end
end

class ServiceB
  def call(params)
    # does some business logic
  rescue => error
    Bugsnag.notify(error)
  end
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

class ServiceA
  def call(params)
    # does some business logic
  rescue => error
    Bugtracker.notify(error)
  end
end

class ServiceB
  def call(params)
    # does some business logic
  rescue => error
    Bugtracker.notify(error)
  end
end
