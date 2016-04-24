class Todo < ActiveRecord::Base
    belongs_to :user
    
    validates_presence_of :body, :user
    
    scope :sorted, lambda { order('created_at DESC') }
  
    
    def preview
    self.body.slice(0..100) << '... read more'
    end 
  
end
