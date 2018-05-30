class Guarantor < ApplicationRecord
  belongs_to :user

  mount_uploader :employment_contract, PhotoUploader
  mount_uploader :identity_card, PhotoUploader
  mount_uploader :pay_slip_1, PhotoUploader
  mount_uploader :pay_slip_2, PhotoUploader
  mount_uploader :pay_slip_3, PhotoUploader
  mount_uploader :tax_notice, PhotoUploader
  mount_uploader :property_tax, PhotoUploader

end
