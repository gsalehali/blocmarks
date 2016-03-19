module ApplicationHelper
  def add_css(controller)
    if  controller.class.to_s.downcase.include?('devise')
      return "in-form"
    end
  end
end
