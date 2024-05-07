class Attendance < ApplicationRecord
  after_create :send_attendance_notification
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true

  private

  def send_attendance_notification
    UserMailer.attendance_notification(event.user, user).deliver_now
  end
end
