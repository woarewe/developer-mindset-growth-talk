# Bad

def perform(params)
  # does some business logic
rescue => error
  Bugtracker.notify(error) if Rails.env.production?
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

def perform(params)
  # does some business logic
rescue => error
  BugtrackerFactory.build.notify(error)
end




