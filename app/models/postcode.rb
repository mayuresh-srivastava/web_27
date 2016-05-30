class Postcode < ActiveRecord::Base
    
#    validates_presence_of :search
#    searchkick
#    def self.search(search)
#     if search  
#      where("address ILIKE ?","%#{search}%")      
#     where("pstcode LIKE ?", "%#{search}%") 
#     where("city LIKE ?", "%#{search}%")
#     else
#        all
#     end    
#    end

  def self.search(pattern)
        
        if pattern
          self.where("pstcode LIKE ?", "%#{pattern}%" ) 
        else
          self.all
        end 
        
  end    
end

