class User < ApplicationRecord
  has_many :candidatures, dependent: :destroy
  has_many :flats, through: :candidatures
  has_many :guarantors, dependent: :destroy
  belongs_to :agency, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :create_guarantor

  mount_uploader :employment_contract, PhotoUploader
  mount_uploader :identity_card, PhotoUploader
  mount_uploader :pay_slip_1, PhotoUploader
  mount_uploader :pay_slip_2, PhotoUploader
  mount_uploader :pay_slip_3, PhotoUploader
  mount_uploader :actual_rent_bill, PhotoUploader
  mount_uploader :tax_notice, PhotoUploader
  mount_uploader :photo, PhotoUploader

 def has_required_field?
    self.gender && self.first_name && self.last_name && self.email && self.phone_number &&
    self.work_situation && self.job_name && self.salary_by_month && self.first_day_of_work && self.rental_status &&
    self.year_legal_income && self.actual_rent_price && self.employment_contract? && self.identity_card? &&
    self.pay_slip_1? && self.pay_slip_2? && self.pay_slip_3? && self.actual_rent_bill? && self.tax_notice?
  end

  def create_guarantor
    Guarantor.create(user_id: self.id)
  end

  def rating
    if work_situation == "SALARIÉ(E)" && guarantors.count > 1
      i = 3
    elsif work_situation == "SALARIÉ(E)" && guarantors.count == 1
      i = 2
    else
      i = 1
    end
    return i
  end

end
