module Honkr
  class SignIn

    def self.run(params)
       user = Honkr.db.get_user_by_username(params[:username])
       if user.nil?
         return {
           :success? => false,
           :error => :no_user
         }
       end

       correct_password = user.has_password?(params[:password])

       if !correct_password
         return {
           :success? => false,
           :error => :invalid_password
         }
       end

       session_id = Honkr.db.create_session(:user_id => user.id)

       {
         :success? => true,
         :session_id => session_id
       }
     end
  end
end
