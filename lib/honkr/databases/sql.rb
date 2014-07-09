require 'active_record'

module Honkr
  module Databases
    class SQL
      #tables

      class User < ActiveRecord::Base
      end

      class Honk < ActiveRecord::Base
      end


      def persist_honk(honk)
        attrs = {
          :user_id => honk.user_id,
          :content => honk.content
        }
        # Save the new honk data in the database (in this case, a hash)
        ar_honk = Honk.create(attrs)
        #key must be same in db
        # Add the new id to the honk object
        honk.instance_variable_set("@id", ar_honk.id)
      end

      def get_honk(id)
        attrs = Honk.find(id)
        Honkr::Honk.new(attrs[:id], attrs[:user_id], attrs[:content])
      end

      def persist_user(user)
        attrs = {
          :name => user.username,
          :password_digest => user.password_digest
        }
        # Save the new user data in the database (in this case, a hash)
        ar_user = User.create(attrs)
        # Add the new id to the user object
        user.instance_variable_set("@id", ar_user.id)
      end

      def get_user(id)
        attrs = User.find(id)
        Honkr::User.new(attrs[:id], attrs[:name], attrs[:password_digest])
      end


    end
  end
end
