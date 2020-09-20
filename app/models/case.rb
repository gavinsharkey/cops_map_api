class Case < ApplicationRecord
  belongs_to :incident
  has_one_attached :media

  validates :title, presence: true
  validates :description, presence: true

  def self.by_incident(incident_id)
    where(incident_id: incident_id).order(created_at: :desc)
  end

  def media_url
    Rails.application.routes.url_helpers.rails_blob_path(self.media, only_path: true)
  end
end
