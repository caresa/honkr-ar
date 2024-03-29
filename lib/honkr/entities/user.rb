module Honkr
  class User

  attr_reader :id, :username, :password_digest

    def initialize(id, username, password_digest=nil)
     @id = id
     @username = username
     @password_digest = password_digest
    end

    def update_password(password)
     @password_digest = Digest::SHA1.hexdigest password
     # TODO: Hash incoming password and save as password digest
    end

    def has_password?(password)
     incoming = Digest::SHA1.hexdigest password
     if incoming != @password_digest
       return false
     else
       return true
     end
     # TODO: Hash incoming password and compare against own password_digest
    end
  end
end

