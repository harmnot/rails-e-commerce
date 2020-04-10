module AdminHelper
  def show_this_if_admin
    true if user_signed_in? && current_user.admin?
  end
end
