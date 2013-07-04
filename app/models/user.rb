class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :soname
end
