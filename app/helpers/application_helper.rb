module ApplicationHelper

  def m_to_st(h)
    if h > 12
      (h-12).to_s + ":00 PM"
    elsif h == 12
      h.to_s + ":00 PM"
    else
      h.to_s + ":00 AM"
    end
  end
  
end
