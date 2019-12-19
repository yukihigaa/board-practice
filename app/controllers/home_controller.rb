class HomeController < ApplicationController
  def top
  end

  def signup
  end

  def signin
  end

  def signupCreate
    user_name = params[:name]
    email = params[:email]
    password = params[:password]

    user = User.new(username: user_name, email: email, password: password)
    
    if user.save
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to('/posts/index')
    else
      flash[:notice] = user.errors.full_messages
      redirect_to('/signup')
    end
  end
end
