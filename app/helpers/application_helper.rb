module ApplicationHelper
  def current_page?(controller, action)
    params[:controller] == controller and
      params[:action] == action
  end
end
