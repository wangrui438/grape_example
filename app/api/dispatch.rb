require 'grape-swagger'
require 'grape_logging'

class Dispatch < Grape::API
  prefix 'api'

  # logger
  file_path = "#{Rails.root}/log/api_#{Rails.env}.log"
  if File.exist? file_path
    log_file = File.open(file_path, "a")
  else
    log_file = File.new(file_path, "w")
  end
  log_file.sync = true
  logger Logger.new GrapeLogging::MultiIO.new(STDOUT, log_file)
  logger.formatter = GrapeLogging::Formatters::Default.new
  use GrapeLogging::Middleware::RequestLogger,
    logger: logger,
    include: [ GrapeLogging::Loggers::Response.new,
             GrapeLogging::Loggers::FilterParameters.new,
             GrapeLogging::Loggers::ClientEnv.new ]

  mount ::V1::Root
end