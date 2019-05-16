class PaymentsController < ApplicationController
    def index
        @payments = Payment.all
        @payments = @payments.where(payment_params)
        data = @payments.as_json(
                only: [:id,:month,:year,:salaries_payment_day, :bonus_payment_day,
                :bonus_total,:salaries_total,:payments_total],
                root: false) 
        render json: data
    end
    
    def show
    @payment = Payment.where(id: params[:id])
    data = @payment.as_json(
        only: [:month,:year,:salaries_payment_day, :bonus_payment_day,
        :bonus_total,:salaries_total,:payments_total]) 
    render json: data
    end
   
    private
    def payment_params
        params.permit(:month, :year)
    end
end
