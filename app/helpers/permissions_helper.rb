module PermissionsHelper
  def admin_only
    redirect_to(root_path, alert: 'Not authorized') unless current_user.admin?
  end
end
