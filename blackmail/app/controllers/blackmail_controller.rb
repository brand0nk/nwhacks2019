require 'digest'

class BlackmailController < ApplicationController
  def index
  end
  def login
  end
  def create_account
    render plain: params[:account]
    # puts params[:account]
    account = params[:account]
    passhash = Digest::SHA256.base64digest(account.require(:password))
    uid = Digest::SHA256.hexdigest(account.require(:username))

    # TODO Assuming no malformed input here, and not checking any input fields
    # This will also allow duplicate entries for username, but it at least fucntional
    @account = User.create(uid: uid, username: account.require(:username),
      passhash: passhash)
  end
end
