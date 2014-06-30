module Brightcontent
  class AdminUser < ActiveRecord::Base
    has_secure_password
    validates_uniqueness_of :email
    attr_accessible [] if defined? ProtectedAttributes
  end
end
