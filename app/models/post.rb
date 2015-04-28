class Post < ActiveRecord::Base
  belongs_to :story

  validates :body, presence: true


  def plain_time
    self.updated_at.strftime("%b %d, %Y %l:%M %p")
  end
end
