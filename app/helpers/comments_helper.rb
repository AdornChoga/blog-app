module CommentsHelper
  def can_show_delete_btn?(subject, show_delete)
    return true if (can? :destroy, subject) && show_delete
  end
end
