module Brightcontent
  class Page < ActiveRecord::Base
    include Brightcontent::PageCore
    attr_accessible [] if defined? ProtectedAttributes
  end
end
