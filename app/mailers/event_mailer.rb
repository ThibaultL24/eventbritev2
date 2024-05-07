
class EventMailer < ApplicationMailer
  def participant_notification(creator_email)
    @creator_email = creator_email
    mail(to: @creator_email, subject: 'New participant joined your event')
  end
end
