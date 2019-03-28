class Stay < ApplicationRecord
  validates :tenant, :studio, :starts_at, :ends_at, presence: true
  validate :ensure_studio_are_available
  belongs_to :tenant
  belongs_to :studio

  private
   def ensure_studio_are_available
     if Stay.where(studio: studio).where("(starts_at <= ? AND ends_at >= ?) OR (starts_at <= ? AND ends_at >= ?) OR (starts_at >= ? AND ends_at <= ?)", starts_at, starts_at, ends_at, ends_at, starts_at, ends_at).first
       errors[:attribute] << "Studio not available"
       return false
     end
   end
end
