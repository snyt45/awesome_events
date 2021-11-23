class Event < ApplicationRecord
  attr_accessor :remove_image

  before_save :remove_image_if_user_accept

  has_one_attached :image, dependent: false
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: "User"

  validates :image,
    content_type: [:png, :jpg, :jpeg],
    size: { less_than_or_equal_to: 10.megabytes }
  validates :name, length: { maximum: 50 }, presence: true
  validates :place, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 200 }, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_should_be_before_end_at

  def creaeted_by?(user)
    return false unless user
    owner_id == user.id
  end

  private

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください")
    end
  end

  # 保存時に画像を削除する
  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
