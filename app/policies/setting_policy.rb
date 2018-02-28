class SettingPolicy < ApplicationPolicy
  def index?
    admin_or_conf_admin?
  end

  def update_all?
    admin_or_conf_admin?
  end

  def ldap_connection_test?
    admin_or_conf_admin?
  end

  private

  def current_user
    @user
  end

  def setting
    @record
  end

  class Scope < Scope
    def resolve
      if admin_or_conf_admin?
        @scope
      end
    end
  end
end
