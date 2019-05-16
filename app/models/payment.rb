class Payment < ApplicationRecord
    belongs_to :departement

    validates_presence_of :month, :year
    before_create :check_salary_date
    before_create :check_bonus_date
    before_create :calculate_total_payment
    after_save :schedule_email

    private
      def check_salary_date
        salary_day =  self.departement.salary_day
        if month == 'Feb'
            salary_day = 28
        end
        date = "#{salary_day.to_s}/#{self.month}/#{self.year.to_s}".to_datetime
        if date.friday? 
            self.salaries_payment_day = salary_day - 1
        elsif date.saturday?
            self.salaries_payment_day = salary_day - 2
        else
            self.salaries_payment_day = salary_day
        end

      end

      def check_bonus_date
        bonus_day =  self.departement.bonus_day
        date = "#{bonus_day.to_s}/#{self.month}/#{self.year.to_s}".to_datetime
        if date.friday? 
            self.bonus_payment_day = bonus_day + 6
        elsif date.saturday?
            self.bonus_payment_day = bonus_day + 5
        else
            self.bonus_payment_day = bonus_day 
        end
      end

      def check_bonus_date
        bonus_total = Staff.where(departement_id:self.departement.id).sum("bonus_percentage * salary/100")
        salaries_total = Staff.where(departement_id:self.departement.id).sum("salary")
        payments_total = salaries_total + bonus_total

        self.bonus_total = bonus_total
        self.salaries_total = salaries_total
        self.payments_total = payments_total
      end


      def schedule_email
        salary_email = self.salaries_payment_day -2
        bonus_email = self.bonus_payment_day -2

        salary_date = "#{salary_email.to_s}/#{self.month}/#{self.year.to_s}".to_datetime
        SendEmailJob.set(wait_until: salary_date ).perform_later()

        bonus_date = "#{bonus_email.to_s}/#{self.month}/#{self.year.to_s}".to_datetime
        SendEmailJob.set(wait_until: bonus_date).perform_later()
      end
end
