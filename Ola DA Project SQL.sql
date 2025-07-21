create database Ola;
use Ola;

select * from bookings ;


#-----> 1. Retrieve all successful bookings:
create view  Success_Booking as
select * from bookings 
where Booking_Status="Success";

#-----> Retrieve all successful bookings:
select * from Success_Booking;


#-----> 2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
select Vehicle_Type,AVG(Ride_Distance) as booking
from bookings 
group by Vehicle_Type;

#-----> 2. Find the average ride distance for each vehicle type:
select * from average_ride_distance_for_each_vehicle;

#-----> 3. Get the total number of cancelled rides by customers:
create view  number_of_cancelled_rides as
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';

#-----> Retrieve all successful bookings:
select * from number_of_cancelled_rides;

#-----> 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID,count(Booking_ID) as total_rides from bookings
group by Customer_ID
order by total_rides desc limit 5;

#-----> 4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;

#-----> 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(*) from  bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#-----> 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from rides_cancelled_by_drivers;


#-----> 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT  MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

#-----> 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Driver_Rating;


#-----> 7. Retrieve all rides where payment was made using UPI:
create view UPI_payments as
select * from bookings
where Payment_Method='UPI';

#-----> 7. Retrieve all rides where payment was made using UPI:
select * from UPI_payments;

#-----> 8. Find the average customer rating per vehicle type:
create view avg_rating_for_v_type as
select Vehicle_Type,round(avg(Customer_Rating),1) as avg_rating_for_v_type 
from bookings 
group by Vehicle_Type;

#-----> 8. Find the average customer rating per vehicle type:
select * from avg_rating_for_v_type;


#-----> 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_rides_completed as
SELECT SUM(Booking_Value) as total_successful_value FROM bookings WHERE
Booking_Status = 'Success';


#-----> 9. Calculate the total booking value of rides completed successfully:
select * from total_booking_value_rides_completed;


#-----> 10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings 
WHERE Incomplete_Rides ='Yes';

#-----> 10. List all incomplete rides along with the reason:
select * from Incomplete_Rides_Reason;