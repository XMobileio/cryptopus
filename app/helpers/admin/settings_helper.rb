module Admin::SettingsHelper
  def input_field_setting(setting)
    content = ''
    content << label_tag(setting.key)

    if respond_to?(input_field_formatter(setting))
      content << send(input_field_formatter(setting), setting)
    else
      content << input_field_setting_default(setting)
    end
    content.html_safe
  end

  def input_field_setting_true_false(setting)
    html_tags = hidden_field_tag(key_param(setting), 'f')
    html_tags << check_box_tag(key_param(setting), 't', setting.value)
  end

  def input_field_setting_number(setting)
    number_field_tag(key_param(setting), setting.value)
  end

  def input_field_setting_default(setting)
    text_field_tag(key_param(setting), setting.value)
  end

private
  def input_field_formatter(setting)
    str = ''
    str << 'input_field_setting_'
    str << setting.class.name.demodulize.underscore
    str.to_sym
  end

  def key_param(setting)
    "setting[#{setting.key}]"
  end
end