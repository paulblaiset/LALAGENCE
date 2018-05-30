class Guarantor < ApplicationRecord
  belongs_to :user

  mount_uploader :employment_contract, PhotoUploader
  mount_uploader :identity_card, PhotoUploader
  mount_uploader :pay_slip_1, PhotoUploader
  mount_uploader :pay_slip_2, PhotoUploader
  mount_uploader :pay_slip_3, PhotoUploader
  mount_uploader :tax_notice, PhotoUploader
  mount_uploader :property_tax, PhotoUploader

  def has_required_field?
    self.gender && self.first_name && self.last_name && self.birthday_date && self.address && self.nationality && self.couple_status && self.mail && self.child_number && self.job_name && self.employer && self.employer_address && self.employer_phone_number && self.seniority && self.year_legal_income && self.actual_rent_price && self.employment_contract? && self.identity_card? && self.property_tax? && self.pay_slip_1? && self.pay_slip_2? && self.pay_slip_3? && self.rental_status && self.tax_notice?
  end
end
