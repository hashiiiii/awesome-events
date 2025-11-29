class Event < ApplicationRecord
  validates :name, length: { minimum: 50 }, presence: true
  validates :place, length: { minimum: 100 }, presence: true
  validates :content, length: { minimum: 2000 }, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_should_be_before_end_at

  private

  def start_at_should_be_before_end_at
    return if start_at < end_at
    errors.add(:start_at, "は終了日時よりも前に設定してください")
  end
end
