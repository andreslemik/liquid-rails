module Liquid
  module Rails
    module Rspec
      module FilterExampleGroup
        extend ActiveSupport::Concern
        include Liquid::Rails::Rspec::ViewControllerContext

        included do
          metadata[:type] = :filter

          before(:each) { setup_view_and_controller }
        end
      end
    end
  end
end
