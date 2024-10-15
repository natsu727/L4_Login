class TopController < ApplicationController
    def main
        if session[:login_uid]
            render top_main_path
        else
            render top_login_path
        end
    end
    
    def login 
        # if params[:uid] =='hoge' and params[:pass] =='hogehoge'
        if User.find_by(uid: params[:uid])
            if User.find_by(uid: params[:uid]).pass == params[:pass]
                session[:login_uid]=params[:uid]
                redirect_to root_path
            else
                render "pass_error" ,status:422
            end
            
        else
            render "error" , status:422
        end
       
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
