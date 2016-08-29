module V1
  module Helpers
    module Base
      extend Grape::API::Helpers

      # 成功处理请求
      def process_succeed
        { status: "succeed" }
      end

      # 错误消息处理
      def error_msg(code, message)
        { error: { code: code, msg: message }, with: V1::Entities::ApiError }
      end

      # error type definition
      def error_401!
        error!(error_msg("10001", "资源需要授权才能访问"), 401)
      end

      def error_403!
        error!(error_msg("10003", "你没有权限访问该资源"), 403)
      end

      def error_404!
        error!(error_msg("10004", "该资源不存在"), 404)
      end

      def error_422!
        error!(error_msg("10022", "请求格式正确，但是由于含有语义错误，无法响应。"), 422)
      end

      def error_500!
        error!(error_msg("20000", "服务器发生错误，处理该资源失败"), 500)
      end

    end
  end
end