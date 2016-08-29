module V1
  class Root < Grape::API
    version "v1"

    format :json
    content_type :json, "application/json"

    helpers V1::Helpers::Base

    # global exception handler
    rescue_from ActiveRecord::RecordNotFound do |e|
      Dispatch.logger.error e
      error!(error_msg("11004", e.message), 404)
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      Dispatch.logger.error e
      error!(error_msg("11000", e.message), 400)
    end

    rescue_from :all do |e|
      Dispatch.logger.error e
      error!(error_msg("21000", "Internal server error: #{e}"), 500)
    end


    mount V1::Users


    add_swagger_documentation \
      markdown: GrapeSwagger::Markdown::RedcarpetAdapter.new(render_options: { highlighter: :rouge }),
      base_path: "/api",
      doc_version: "v1",
      format: :json,
      hide_documentation_path: true,
      hide_format: true,
      info: {
        title: "Grape API Example"
      }
  end
end