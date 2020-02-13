class PagesController < ApplicationController
  def contact
  end

  def team
  end

  def create
    user = User.find_by(email: params[:emails])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(password: params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas

  else
   flash.now[:danger] = 'Invalid email/password combination'
   render 'new'
    end
  end

  def new

  end
end
