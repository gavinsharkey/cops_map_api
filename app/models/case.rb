class Case < ApplicationRecord
  belongs_to :incident
  has_one_attached :media

  validates :title, presence: true
  validates :description, presence: true

  def media_url
    Rails.application.routes.url_helpers.rails_blob_path(self.media, only_path: true)
  end
end
