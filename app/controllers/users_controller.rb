class UsersController < ApplicationController
  def edit #On check si l'user a un ou deux garants et on prend le bon guarant (Probleme de Seed)
    @user = current_user
    (@user.guarantors.count > 1) ? @guarantor = @user.guarantors.where.not(mail: nil).first : @guarantor = @user.guarantors.first
    authorize @user
    if @user.has_required_field?
      @step = 2  #si le formulaire est rempli, on passe à l'onglet de la tabs "Guarantor"
    else
      @step = 1
    end
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
    @user = @user.reload
    if @user.agency_id
      @agency = Agency.find(current_user.agency_id)
      redirect_to agency_path(@agency)
    elsif @user
      @candidature = current_user.candidatures.create
      redirect_to edit_user_path(@user)
    else
      @step = 1
      @guarantor = @user.guarantors.first
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :mail, :phone_number,
      :work_situation, :job_name, :salary_by_month, :first_day_of_work, :rental_status,
      :year_legal_income, :actual_rent_price, :birthday_date, :employment_contract, :identity_card,
      :pay_slip_1, :pay_slip_2, :pay_slip_3, :actual_rent_bill, :tax_notice, :agency_id, :photo)
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
