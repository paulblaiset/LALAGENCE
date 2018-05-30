class UsersController < ApplicationController
  def edit
    @user = current_user
    @guarantor = Guarantor.create
    authorize @user
  end

  def update
    @user = current_user
    @guarantor = Guarantor.create
    authorize @user
    authorize @guarantor
    @user.update(user_params)
    @user = @user.reload
    if @user.has_required_field?
      @candidature = current_user.candidatures.create
      redirect_to edit_candidature_path(@candidature)
    end
  end


  private

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :mail, :phone_number,
      :work_situation, :job_name, :salary_by_month, :first_day_of_work, :rental_status,
      :year_legal_income, :actual_rent_price, :birthday_date, :employment_contract, :identity_card,
      :pay_slip_1, :pay_slip_2, :pay_slip_3, :actual_rent_bill, :tax_notice)
  end
end
