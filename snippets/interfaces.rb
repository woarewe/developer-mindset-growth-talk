# Bad

class Asset < ApplicationRecord
  belongs_to :storagable, polymorphic: true
end

class Remote < ApplicationRecord
  has_many :assets, as: :storagable

  def upload_to_s3(file)
    Amazon::S3.new(token: amazon_s3_token).upload(file)
  end
end

class Local < ApplicationRecord
  has_many :assets, as: :storagable

  def save_to_disk(asset)
    File.open(Rails.root.join(asset.name), 'w') { |f| f.write(asset.content) }
  end
end

def refresh_blob(asset)
  storagable = asset.storagable
  case storagable
  when Remote
    storagable.upload_to_s3(asset.blob)
  when Local
    storage.save_to_disk(asset)
  end
end

# Good
class Asset < ApplicationRecord
  belongs_to :storagable, polymorphic: true
end

module Storagable
  def save_asset(_asset)
    raise NotImplementedError
  end
end

class Remote < ApplicationRecord
  include Storagable

  has_many :assets, as: :storagable

  def upload_to_s3(file)
    Amazon::S3.new(token: amazon_s3_token).upload(file)
  end

  def save_asset(asset)
    upload_to_s3(asset.blob)
  end
end

class Local < ApplicationRecord
  include Storagable

  has_many :assets, as: :storagable

  def save_to_disk(asset)
    File.open(Rails.root.join(asset.name), 'w') { |f| f.write(asset.content) }
  end
  alias save_asset save_to_disk
end

def refresh_blob(asset)
  asset.storagable.save_asset(asset)
end