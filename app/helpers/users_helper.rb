module UsersHelper
    def return_user_id
        session[:user_id]
    end
    def profile_pic
        user = User.find return_user_id
        if not user.profile_image.nil?
            user.profile_image
        end
    end
end
