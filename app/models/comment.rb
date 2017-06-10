class Comment < ApplicationRecord
  belongs_to :guest

  def format_time
   return self.created_at.strftime("%I:%M %p")
  end

  def format_date
   return self.created_at.strftime("%B %C, %G")
  end
end
