class PaymentMailer < ApplicationMailer
    default from: 'payments_app@example.com'
 
    def payments_reminder_email(user)
      @user = params[:user]
      mail(to: @user.email, subject: 'Your Monthly Payments Reminder')
    end
end
