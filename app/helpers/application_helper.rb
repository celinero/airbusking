module ApplicationHelper
  def select_alert_subclass(input)
    case input
    when 'notice'
      return 'info'
    when 'succes'
      return 'success'
    when 'error'
      return 'danger'
    when 'alert'
      return 'warning'
    else
      return 'info'
    end
  end
end
