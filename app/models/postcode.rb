class Postcode < ActiveRecord::Base
    
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

  def self.search(search)
        
        if search
           self.where("pstcode LIKE ?", "%#{search}%")
        else
          self.all
        end 
        
  end    
end

