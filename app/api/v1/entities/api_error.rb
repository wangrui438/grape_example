module V1
  module Entities
    class ApiError < Grape::Entity

      expose :error, using: Entities::ApiErrorDetail, documentation: {
        type: V1::Entities::ApiErrorDetail, desc: "错误详情"
      }
      
    end
  end
end