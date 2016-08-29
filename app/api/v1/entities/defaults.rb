module V1
  module Entities
    # 公共属性
    module Defaults
      extend ActiveSupport::Concern

      included do
        format_with(:local_zone_timestamp) { |dt| dt.getlocal.iso8601 if dt.present? }
        format_with(:iso_timestamp) { |dt| dt.iso8601 if dt.present? }
      end

    end
  end
end