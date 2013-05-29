module RedmineTwitterBootstrap
  module Helper
    def nav_list_tag(caption, path)
      active = 'active' if params[:controller] == path[:controller] and params[:action] == path[:action]
      content_tag(:li, class: active) do
        link_to caption, path
      end.html_safe
    end

    def icon_tag(options)
      if options[:icon]
        style = "icon-#{options[:icon]}"
        style << " icon-#{options[:color]}" if options[:color]
        content_tag(:i, class: style) do
        end.html_safe
      end
    end

    def icon_button_tag(caption, options={})
      options[:class] ||= 'btn'
      options[:type] ||= 'button'
      button_tag(class: options[:class], type: options[:type]) do
        [icon_tag(options), caption].join(' ').html_safe
      end.html_safe
    end

    def link_button_tag(caption, path, options={}, link_options={})
      link_options[:class] ||= 'btn'
      link_options[:class] << " btn-#{options[:action]}" if options[:action]
      link_options[:class] << " btn-#{options[:size]}" if options[:size]
      caption = [icon_tag(options), caption].join(' ')
      link_to caption.html_safe, path, link_options
    end
  end
end
