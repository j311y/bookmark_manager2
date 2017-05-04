require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'tag'

class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

  has n, :tags, :child_key => [ :source_id ]
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
