require 'active_support/concern'

module Brightcontent
  module BaseControllerExt
    module Pagination
      extend ActiveSupport::Concern

      module ClassMethods
        def per_page_count
          @per_page_count ||= 30
        end

        def per_page(number)
          @per_page_count = number
        end
      end

      private

      def collection
        if action_name == "index" && self.class.per_page_count > 0
          super.paginate(page: params[:page], per_page: self.class.per_page_count)
        else
          super
        end
      end
    end
  end
end
