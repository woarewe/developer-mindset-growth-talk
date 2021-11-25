# Bad
def create_user(params)
  User.create!(params)
rescue => error
  Bugsnag.notify(error) if Rails.env.production? || Rails.env.staging?
  raise error
end

# Better
# lib/bugtracker.rb
class Bugtracker
  def self.notify(error)
    Bugsnag.notify(error)
  end
end

def create_user(params)
  User.create!(params)
rescue => error
  Bugtracker.notify(error) if Rails.env.production? || Rails.env.staging?
  raise error
end

# Good
# lib/bugtracker.rb
class Bugtracker
  def self.notify(error)
    Bugsnag.notify(error)
  end
end

# app/factories/bugtracker_factory.rb
class BugtrackerFactory
  class Fake
    def self.notify(*); end
  end

  def self.build
    if Rails.env.production? || Rails.env.staging?
      Bugsnag
    else
      Fake
    end
  end
end

def create_user(params)
  User.create!(params)
rescue => error
  BugtrackerFactory.build.notify(error) 
  raise error
end
