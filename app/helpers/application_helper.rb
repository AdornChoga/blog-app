module ApplicationHelper
  def current_user?(user)
    user.id == current_user.id
  end

  def current_page?(controller, action)
    params[:controller] == controller and
    params[:action] == action
  end
end
