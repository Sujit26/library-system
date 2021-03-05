
require 'time'
module BookStore
  module V1
    class Bookings < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api      
      resource :bookings do
        desc 'Return list of booking_cards'
        
        post do
            time_period = 5
            cost = 1
            puts params[:isCreate]
            if(params[:isCreate]=="True") then
              new_booking = BookingCard.create!(
                user_id: params[:user_id],
                book_id: params[:book_id],
                renew_date: Time.now,
                return_date: "",
                )
              
              bookings = {
                response: {
                  message: "Succefully created",
                  body: new_booking,
                  error_code: 200
                }
              }
            elsif params[:isRenew] == "True" ||  params[:isReturn] == "True" then
              
              id =  params[:booking_id].to_i
              booking = BookingCard.find(id)
              user = User.find(booking.user_id)

              if(params[:isReturn] == "True")
                puts "params[:isReturn] = True"
              end
              if(params[:isReturn] == "True" and params[:user_id].to_i == booking.user_id.to_i)
                puts "params[:isReturn] == True and params[:user_id].to_i == booking.user_id.to_i"
                booking.update(
                  return_date: Time.now
                  )

                renew_date = Time.zone.parse(booking.renew_date)
                number_of_days = Time.zone.parse(booking.renew_date).day - Time.zone.parse(Time.now.to_s).day

                if(number_of_days-time_period>0)
                  user.update(
                    fine: user.fine.to_i + (number_of_days-time_period)*cost 
                  )
                end

              end
              if(params[:isRenew] == "True")
                puts "params[:isRenew] == True"
              end
              if(params[:isRenew] == "True" and params[:user_id].to_i == booking.user_id.to_i)
                puts "params[:isRenew] == True and params[:user_id].to_i == booking.user_id.to_i"
                t1 = booking.renew_date
                booking.update(
                  renew_date: Time.now
                  )
                t2 = booking.renew_date
                number_of_days =  Time.zone.parse(t1).day - Time.zone.parse(t2).day
                if(number_of_days-time_period>0)
                  user.update(
                    fine: user.fine.to_i + (number_of_days-time_period)*cost 
                  )
                end
              end

              bookings = {
                response: {
                  message: "Succefully updated",
                  body: {
                    booking:booking,
                    fine: user.fine
                  },
                  error_code: 200
                }
              }
            end
              present bookings
          end


          
          # user booking
          get do
            bookings = BookingCard.where(user_id:params[:user_id])
            present bookings
          end



        end
      end
    end
  end



  # renew -> fine update
  #       if((current_date - renew_date - time_period)>0)
  #         fine = fine + (current_date - renew_date - time_period)*cost

  # return -> fine update
  #       if((return_date - renew_date - time_period)>0)
  #         fine = fine + (return_date - renew_date - time_period)*cost
