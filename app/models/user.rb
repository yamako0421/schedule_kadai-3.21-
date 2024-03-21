class User < ApplicationRecord

scope :today, -> { where("id <= ? AND end_date >= ?", Date.today, Date.today) }

def self.total_count
    count
  end

  validates :title, length: { maximum: 30}, presence: true
  validates :start_date, uniqueness: true, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return unless start_date && end_date

    if end_date < start_date
      errors.add(:end_date, "は、開始日以降の日付としてください")
    end
  end
end



