class Payment < ApplicationRecord
    belongs_to :departement

    validates_presence_of :month, :year
    before_create :check_salary_date
    before_create :check_bonus_date

    private
      def check_salary_date
        # byebug
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
        # byebug
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
end
