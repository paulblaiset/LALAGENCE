class User < ApplicationRecord
  has_many :applications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :employment_contract, PhotoUploader
  mount_uploader :identity_card, PhotoUploader
  mount_uploader :pay_slip_1, PhotoUploader
  mount_uploader :pay_slip_2, PhotoUploader
  mount_uploader :pay_slip_3, PhotoUploader
  mount_uploader :actual_rent_bill, PhotoUploader
  mount_uploader :tax_notice, PhotoUploader

end
