class Publication < ApplicationRecord
 belongs_to :user
 has_many :active_storage_attachments, as: :record, class_name: 'ActiveStorage::Attachment', dependent: :destroy
 has_many_attached :images
 has_many :comments
end
