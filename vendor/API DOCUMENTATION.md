# For all booking
get http://localhost:3000/api/v1/bookings

# For all users
get http://localhost:3000/api/v1/users

# For all books
get http://localhost:3000/api/v1/books

# For all booking 
get  http://localhost:3000/api/v1/bookings

# For user booking 
get  http://localhost:3000/api/v1/bookings?user_id=1

# For creating new booking
post http://localhost:3000/api/v1/bookings?user_id=2&book_id=2&isCreate=True

# For returning book
*** Update fine
post http://localhost:3000/api/v1/bookings?booking_id=2&isReturn=True

# For renew book
*** Update fine
post http://localhost:3000/api/v1/bookings?booking_id=2&isRenew=True

