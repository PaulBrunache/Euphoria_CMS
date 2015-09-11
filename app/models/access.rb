class Access
    def initialize(user)
        @user ||= user
        skip :sessions, [:new, :create, :destroy]
        skip :post, [:index,:show]
    end
    def role(user)
        @role ||= user.role.name.downcase 
    end
    #allowed controllers and actions
    def skip(controllers,actions)
        @authorize_actions ||= {}
        Array(controllers).each  do |controller|
            Array(actions).each  do |action|  
                @authorize_actions [[controller.to_s,action.to_s]] = true
            end
        end
    end
    #check actions against the data base
    def authorized? (controller, action, resource = nil)
        #only check if user has controller name present in database access array
        if resource.nil && @authorized_actions[[controller.to_s,action.to_s]]
            true
        elsif has_rights_to?(controller) 
           evaluate?(controller, action, resource)
        else
        #return false if controller not present in array
            false
        end
    end

    def has_rights_to?(name)
        return true if @user.session[:access].has_key?(name)
    end
    def evaluate?(controller, action, resource = nil)
        if resource.nil?
            @user.
        else
            false
        end
    end
end
