class Users::SessionsController < Devise::SessionsController
  def destroy
    super
    redirect_to 'https://google.com'
  end

end
