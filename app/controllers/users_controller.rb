class UsersController < ApplicationController
  
  def index
  #   logger.info "Index User info"
  #   Rails.logger.info "sample text"
  # @user=User.find(:first, :conditions=>["account = ?", params[:account]])
  end
  
  
  def new 
    logger.info "Index the userdetails"
    @user=User.new
  end
  
  
  def create
    
    if(params.has_key?(:account) && params.has_key?(:balance) && params.has_key?(:name) && params.has_key?(:pin))
      @user=User.new(user_params)
      if @user.save
         redirect_to root_url
       else
         render "new"
       end
    elsif params.has_key?(:account)
     @user=User.find(:first, :conditions=>["account = ?", params[:account]])
     if @user.nil?
        redirect_to signup_path
        elsif @user.account==params[:account].to_i
          redirect_to pin_check_path
        else
          redirect_to signup_path
        end
    elsif params.has_key?(:pin)
      @user=User.find(:first, :conditions=>["pin = ?", params[:pin]])
      if @user.nil?
        redirect_to signup_path
        elsif @user.pin==params[:pin].to_i
          session[:user_id] = @user.id
          redirect_to home_path
         else
           redirect_to pin_check_path
        end
      end 
 end
  
  def edit
    @user=User.new
  end
  
  def show
     @user = User.find(session[:user_id])
   puts session[:user_id]
  end
  
  
  
  
  
  def home
    @user = User.find(session[:user_id])
  end
  
  
  
  
  def withdraw_money
    @user=User.find(session[:user_id])
   
    if params[:balance].to_f > @user.balance
    
      redirect_to withdrw_err_path
     else
       
      @user.balance=@user.balance - params[:balance].to_f
      @user.update_attribute(:balance, @user.balance)
    
    redirect_to withdrw_succ_path
    end
  end
  
  def withdrw_err
     @user=User.find(session[:user_id])
  end
  
  def withdrw_succ
    @user=User.find(session[:user_id])
  end
  def deposite_succ
    @user=User.find(session[:user_id])
  end
  def deposite_money
    @user=User.find(session[:user_id])
    @user.balance=@user.balance + params[:balance].to_f
      @user.update_attribute(:balance, @user.balance)
    
    redirect_to deposite_succ_path
  end
  def destroy
    session[:user_id] = nil
    puts session[:user_id]
    redirect_to root_url
  end
  
  def user_params
    allow = [:name, :account, :pin, :balance]
    params.permit(allow)
  end
end
