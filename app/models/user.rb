class User < ApplicationRecord
  has_secure_password
  enum access_level: %i[member admin operations]
end
