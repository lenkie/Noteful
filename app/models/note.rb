class Note < ActiveRecord::Base
  
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, lambda { order('created_at DESC') }
  
  def preview
    self.content.slice(0..100) << '... read more'
  end 

end
