class User < ActiveRecord::Base
  validates :uuid, :presence => true
  validates :endpoint, :presence => true

  # XXX/drs: Wrap it in a lambda to bust the cache.
  scope :recents, lambda { where("updated_at > ?", Time.now - 7.days) }
end
