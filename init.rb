Redmine::Plugin.register :redmine_currency do
  Rails.configuration.after_initialize do
    locale = if Setting.table_exists?
               Setting.default_language
             else
               'en'
             end
    I18n.with_locale(locale) do
      name I18n.t :'currency.plugin_name'
      description I18n.t :'currency.plugin_description'
      author 'Emergya Consultoría'
      version '0.0.2'
    end
  end

  menu :admin_menu, :currencymenu, { :controller => 'currencies', :action => 'index' }, :html => { :class => 'currency' }, :caption => :"currency.label_currency"
end

if Rails.version > '6.0'
  ActiveSupport::Reloader.to_prepare do
    require 'currency_module/hooks'
  end
end
