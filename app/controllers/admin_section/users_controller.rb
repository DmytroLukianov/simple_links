class AdminSection::UsersController < AdminSection::MainController
  def index
    @users = User.all
  end
end
