class User < ActiveRecord::Base
    has_many :outfits
    has_secure_password
  end