module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Ticket Sponge').join(' - ')
      end
    end
  end

  def admin_only(&block)
    block.call if current_user.try(:admin?)
  end
end
