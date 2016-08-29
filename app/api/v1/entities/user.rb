module V1
  module Entities
    class User < Grape::Entity
      include V1::Entities::Defaults

      expose :id, documentation: { type: String, desc: "用户编号" }

      expose :name, documentation: { type: String, desc: "姓名" }

      expose :mobile, documentation: { type: String, desc: "手机号码" }

      with_options(format_with: :local_zone_timestamp) do
        expose :created_at, documentation: { type: String, desc: "创建时间" }
        expose :updated_at, documentation: { type: String, desc: "更新时间" }
      end

    end
  end
end