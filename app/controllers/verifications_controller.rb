class VerificationsController < ApplicationController
    include SessionsHelper
    before_action :admin_user, only: [ :show ]
    before_action :logged_in?, only: [ :create ]

    def create
        @verification = Verification.new(verification_params)
        @verification.user = current_user

        if @verification.valid?
            if @verification.save
                flash[:success] = "Verification saved."
                redirect_to "/setting"
            else
                flash[:danger] = "Failed to save verification, please try again."
                redirect_to "/setting"
            end
        else
            flash[:danger] = @verification.errors.full_messages.join("\n\n")
            redirect_to "/setting"
        end
    end

    def update
        current_user.verification.destroy unless current_user.verification.nil?
        create
    end

    private

    def verification_params
        params.require(:verification).permit(:card_type, :card_num, :image)
    end

end
