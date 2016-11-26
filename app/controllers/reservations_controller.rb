class ReservationsController < ApplicationController
  def index
    if params[:book_id]
      @book = Book.find(params[:book_id])
      @reservations = @book.reservations
    else
      @reservations = Reservation.all
    end
  end

  def new
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.build
    @reservation.loan_date = Date.today
    @reservation.due_date = Date.today.next_month
    render :new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to "/reservations"
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params["id"])
  end

  def show
    @reservation = Reservation.find(params["id"])
  end

  def update
    @reservation = Reservation.find(params["id"])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  private

  def reservation_params
    if params[:reservation]
      params.require(:reservation).permit(:book_id, :loan_date, :due_date, :return_date)
    elsif params[:due_date]
      params.permit(:due_date)
    elsif params[:return_date]
      params.permit(:return_date)
    end
  end
end
