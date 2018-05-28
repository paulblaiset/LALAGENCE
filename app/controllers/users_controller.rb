class UsersController < ApplicationController
  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :mail, :phone_number,
      :work_situation, :job_name, :salary_by_month, :first_day_of_work, :rental_status,
      :year_legal_income, :actual_rent_price, :birthday_date, :employment_contract, :identity_card,
      :pay_slip_1, :pay_slip_2, :pay_slip_3, :actual_rent_bill, :tax_notice)
  end
end
