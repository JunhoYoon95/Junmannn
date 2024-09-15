class ApplicationController < ActionController::Base
  before_action :init_theme_mode, :init_theme_direction, :init_layout

  private

  def init_theme_mode
    helpers.setModeSwitch(Rails.configuration.settings.KT_THEME_MODE_SWITCH_ENABLED)
    helpers.setModeDefault(Rails.configuration.settings.KT_THEME_MODE_DEFAULT)
  end

  def init_theme_direction
    helpers.setDirection(Rails.configuration.settings.KT_THEME_DIRECTION)
    if helpers.isRtlDirection
      helpers.addHtmlAttribute('html', 'direction', 'rtl')
      helpers.addHtmlAttribute('html', 'dir', 'rtl')
      helpers.addHtmlAttribute('html', 'style', 'direction: rtl')
    end
  end

  def init_layout
    helpers.addHtmlAttribute('body', 'id', 'kt_app_body')
    helpers.addHtmlAttribute('body', 'data-kt-name', helpers.getName())
  end
end
