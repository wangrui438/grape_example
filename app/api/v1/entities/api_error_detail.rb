module V1
  module Entities
    class ApiErrorDetail < Grape::Entity
      
      expose :code, documentation: { type: Integer, desc: "错误代码" }
      
      expose :msg, documentation: { type: String, desc: "错误信息" }

    end
  end
end