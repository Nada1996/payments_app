class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    users = User.all
    for user in users
      PaymentMailer.payments_reminder_email.deliver(user)
    end
  end
end
