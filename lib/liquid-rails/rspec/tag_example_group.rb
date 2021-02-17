module Liquid
  module Rails
    module Rspec
      module TagExampleGroup
        extend ActiveSupport::Concern
        include Liquid::Rails::Rspec::ViewControllerContext

        included do
          metadata[:type] = :tag

          before(:each) { setup_view_and_controller }
        end
      end
    end
  end
end
