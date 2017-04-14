module Admin::ApplicationHelper
  def roles
    hash = {}

    Role.available_roles.each do |role|
      hash[role.titleize] = role
    end
  end
end
