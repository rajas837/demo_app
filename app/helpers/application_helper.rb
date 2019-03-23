module ApplicationHelper
    def hello(return_user_id)
        user = ( User.find_by_id return_user_id).name rescue "Undefined"
        "My name is #{user}"
    end
end
