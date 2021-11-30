# Bad

class CreateUser
  def call(params)
    # does some business logic
  rescue => error
    Bugtracker.notify(error) if Rails.env.production?
  end
end

class CreatePost
  def call(params)
    # does some business logic
  rescue => error
    Bugtracker.notify(error) if Rails.env.production?
  end
end

# Good

# app/factories/bugtracker_factory.rb
class BugtrackerFactory
  class Fake
    def self.notify(*); end
  end

  def self.build
    if Rails.env.production?
      Bugsnag
    else
      Fake
    end
  end
end

class CreateUser
  def call(params)
    # does some business logic
  rescue => error
    BugtrackerFactory.build.notify(error)
  end
end

class CreatePost
  def call(params)
    # does some business logic
  rescue => error
    BugtrackerFactory.build.notify(error)
  end
end




