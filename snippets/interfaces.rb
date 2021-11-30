# Bad

class Asset < ApplicationRecord
  belongs_to :storagable, polymorphic: true
end

class Remote < ApplicationRecord
  # associations and scopes

  def upload_to_s3(file)
    # uploads a file to AWS S3
  end
end

class Local < ApplicationRecord
  # associations and scopes

  def save_to_disk(asset)
    # saves an asset to disk
  end
end

def refresh_blob(asset)
  storagable = asset.storagable
  case storagable
  when Remote
    storagable.upload_to_s3(asset.file)
  when Local
    storagable.save_to_disk(asset)
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

  # associations and scopes

  def upload_to_s3(file)
    # uploads a file to AWS S3
  end

  def save_asset(asset)
    upload_to_s3(asset.file)
  end
end

class Local < ApplicationRecord
  include Storagable

  # associations and scopes

  def save_to_disk(asset)
    # saves an asset to disk
  end
  alias save_asset save_to_disk
end

def refresh_blob(asset)
  asset.storagable.save_asset(asset)
end
