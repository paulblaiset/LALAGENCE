class GuarantorsController < ApplicationController
  def create
    @guarantor = Guarantor.new(guarantor_params)
    @guarantor.user = current_user
    authorize @guarantor
    if @guarantor.save
      redirect_to edit_candidature_path
    else
      render "new"
    end
  end

  def edit
    @guarantor = current_user.guarantor
    authorize @user
  end

  def update
    @guarantor = current_user.guarantors.first
    authorize @guarantor
    @guarantor.update(guarantor_params)
    @guarantor = @guarantor.reload
    if @guarantor
      @candidature = current_user.candidatures.last
      redirect_to edit_user_candidature_path(current_user, @candidature)
    end
  end

    private

  def guarantor_params
    params.require(:guarantor).permit(:gender, :first_name, :last_name, :birthday_date, :address, :nationality, :couple_status,
     :mail, :child_number, :job_name, :employer, :employer_address, :employer_phone_number, :seniority,
      :year_legal_income, :actual_rent_price, :employment_contract, :identity_card, :property_tax,
      :pay_slip_1, :pay_slip_2, :pay_slip_3, :rental_status, :actual_rent_price, :tax_notice, :user_id)
  end
end
