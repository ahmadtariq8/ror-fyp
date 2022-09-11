class Property < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :account

  scope :latest, -> { order created_at: :desc }
  # Ex:- scope :active, -> {where(:active => true)}
end
