if Rails.application.secrets.dig(:sentry, :enabled)
  require 'sentry-raven-without-integrations'

  Raven.inject_without(:sidekiq)

  Rails.application.config.rails_activesupport_breadcrumbs = true

  # With this enabled 'exceptions_app' isnt executed, so instead we
  # set ``config.consider_all_requests_local = false`` in development.
  # config.action_dispatch.show_exceptions = false

  # Inject Sentry logger breadcrumbs
  require 'raven/breadcrumbs/logger'

  Raven.configure do |config|
    config.dsn = Rails.application.secrets.dig(:sentry, :dsn)
    config.timeout = 10
    config.open_timeout = 10
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  end
end
