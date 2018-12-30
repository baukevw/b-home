module Admin
  class AdminController < AppController
    before_action :authenticate_admin

      def authenticate_admin
        redirect_to '/', alert: 'Not authorized.' unless user_signed_in? && current_user.admin?
      end
  end
end
