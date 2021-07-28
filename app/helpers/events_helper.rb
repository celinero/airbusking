module EventsHelper
  def image_select(event)
    if event.picture.attached?
      return event.picture 
    else
      return "default.jpg"
    end
  end
end
