class ApplicationController < ActionController::Base
  protect_from_forgery
  
  


      # def after_sign_in_path_for(resource)                                                                                                                      
#         sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')                                            
#         if (request.referer == sign_in_url)                                                                                                                     
#           super                                                                                                                                                 
#         else                                                                                                                                                    
#           request.referer || stored_location_for(resource) || user_home_path()                                                                                         
#         end                                                                                                                                                     
#       end  
# 
#       def after_sign_in_path_for(resource)
#           return request.env['omniauth.origin'] || stored_location_for(resource) || user_home_path()
#       end     


# def current_user
#    return session[current_user]

# end  
      
  
end
