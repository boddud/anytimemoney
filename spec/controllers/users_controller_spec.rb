require 'spec_helper'

describe UsersController do
  describe "GET #index" do
    it "renders :index view" do
      get :index 
    response.should redirect_to(root_url)
    end
  end
  describe "GET #new" do 
    it "assigns a new User to @user" do
      @user = FactoryGirl.create(:user)
      get :new 
      assigns(:user).shuld eq @user
    end
    it "renders the :new template" do
      response.should render_template :new
    end
    end 
 end
