class SessionsController < ApplicationController

  def new
  end

  def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      log_in(user)
    remember(user)
    redirect_to gossips_path# redirige où tu veux, avec un flash ou pas
    else
      render :new
    end
  end

  def destroy
    user = current_user
    if log_out(user)
      redirect_to gossips_path
    end
  end

end
