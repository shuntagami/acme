Dir.glob("config/locales/*.yml").each { |t| I18n.backend.load_translations(t) }
I18n.locale = :ja
