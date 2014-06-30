module ActionDispatch::Routing
  class Mapper
    def pages_resources(&block)
      resource_name = Brightcontent.page_model.to_s.underscore.pluralize.gsub(/^brightcontent\//, "")
      resources resource_name do
        collection do
          get :index
          post :rebuild
        end
        instance_eval &block if block_given?
      end
    end
  end
end
