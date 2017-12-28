class SessionController < ApplicationController

  def signin
  end

  def user_signin
    user = User.find_by(email: params[:email])
    if user.nil?
      flash[:notice] = "없는 회원임ㅋㅋ"
      redirect_to '/signin'
    else
      if user.password_digest == params[:password]
        flash[:notice] = "로그인 성공!"
        session[:user_id] = user.id
        redirect_to '/'
      else
        flash[:notice] = "비밀번호 틀림ㅋㅋ"
        redirect_to '/signin'
      end
    end
  end

  def signup

  end

  def user_signup
    User.create(
      email: params[:email],
      password_digest: params[:password]
    )
    redirect_to '/signin', notice: "회원가입 완료!!"
  end

  def logout
    session.delete(:user_id)
    redirect_to '/', notice: "로그아웃 하셨습니다."
  end

end
