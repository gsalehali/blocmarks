module ApplicationHelper
  def add_css(controller)
    if  controller.class.to_s.downcase.exclude?('welcome')
      return "in-form"
    end
  end

  def add_btn_sm(controller)
    if controller.class.to_s.downcase.exclude?('bookmark')
      return 'btn-sm'
    end
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group row has-danger'
    else
      content_tag :div, capture(&block), class: 'form-group row'
    end
  end
  def add_error_tag
    return "form-control-danger"
  end
end
