module V1
  module Helpers
    module SharedParams
      extend Grape::API::Helpers

      # 路由中的资源编号
      params :resource_path_id do
        requires :id, type: String, allow_blank: false, desc: "资源编号"
      end
      
    end
  end
end