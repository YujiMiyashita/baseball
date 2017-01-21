require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Baseball
  class Application < Rails::Application

    #日本語化
    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.assets.paths << "#{Rails}/vendor/assets/fonts"

    #runnerでバッチ処理
    config.autoload_paths += Dir["#{config.root}/lib"]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
