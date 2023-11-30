import mysql.connector 

mydb = mysql.connector.connect(host="localhost", user="root", password="Oracle1234niru$", database="hms")
c = mydb.cursor()

def viewTables(tableName):
    command = 'SELECT * FROM ' + tableName +';'
    print(command)
    c.execute(command)
    data = c.fetchall()
    return data

def updateStatus(id, status, choice):
    if choice=="Hotel":
        command = 'UPDATE Hotel set Hotel_Ph_No = "' + str(status) + '" where HotelID = "' + str(id) + '"'
    elif choice=="Customer":
        command = 'UPDATE Customer set cust_ph_no = "' + str(status) + '" where cust_id = "' + str(id) + '"'
    elif choice=="Room_Type":
        command = 'UPDATE Room_Type set room_price = "' + str(status) + '" where type_id = "' + str(id) + '"'
    elif choice=="Job":
        command = 'UPDATE Job set salary = "' + str(status) + '" where job_id = "' + str(id) + '"'
    elif choice=="Employees":
        command = 'UPDATE Employees set emp_ph_no = "' + str(status) + '" where emp_id = "' + str(id) + '"'
    print(command)
    c.execute(command)
    mydb.commit()

def execQuery(command):
    c.execute(command)
    data = c.fetchall()
    return data

def viewQueryResult(choice):
    command=""
    command1=""
    command2=""
    if choice==1:
        command = 'SELECT Hotel.HotelName, COUNT(Reservation.res_id) AS ReservationCount FROM Hotel LEFT JOIN Reservation ON Hotel.HotelID = Reservation.HotelID GROUP BY Hotel.HotelID, Hotel.HotelName;'
    elif choice==2:
        command = 'SELECT Room_Type.room_name, SUM(Transaction.Amount) AS TotalRevenue FROM Room_Type LEFT JOIN Room ON Room_Type.type_id = Room.type_id LEFT JOIN Transaction ON Room.room_id = Transaction.room_id GROUP BY Room_Type.type_id, Room_Type.room_name;'
    elif choice==3:
        command = 'SELECT Job.job_title, COUNT(Employees.emp_id) AS EmployeeCount FROM Job LEFT JOIN Employees ON Job.job_id = Employees.job_id GROUP BY Job.job_id, Job.job_title;'
    elif choice==4:
        command = 'SELECT Hotel.HotelName, COUNT(HotelService.ServiceID) AS TotalServices FROM Hotel LEFT JOIN HotelService ON Hotel.HotelID = HotelService.HotelID GROUP BY Hotel.HotelID, Hotel.HotelName;'
    elif choice==5:
        command = 'SELECT  Employees.emp_id, Employees.emp_fname, Employees.emp_lname, Employees.emp_address, Job.job_id, Job.job_title FROM Employees RIGHT JOIN Job ON Employees.job_id = Job.job_id;'
    elif choice==6:
        command = 'SELECT Customer.cust_id, Customer.cust_fname, Customer.cust_lname, Customer.cust_mail, Reservation.res_id, Reservation.in_date, Reservation.out_date FROM Customer NATURAL JOIN Reservation;'
    elif choice==7:
        command = 'SELECT Hotel.HotelID, Hotel.HotelName, Hotel.HotelRating FROM Hotel WHERE Hotel.HotelRating = (SELECT MAX(HotelRating) FROM Hotel);'
    elif choice==8:
        command = 'SELECT Hotel.HotelID, Hotel.HotelName, Hotel.HotelRating FROM Hotel WHERE Hotel.HotelRating = (SELECT MIN(HotelRating) FROM Hotel);'
    elif choice==9:
        command='SELECT HotelID, COUNT(*) AS TotalRooms FROM Room GROUP BY HotelID UNION ALL SELECT HotelID, COUNT(*) AS TotalEmployees FROM Employees GROUP BY HotelID;'
    elif choice==10:
        command='SELECT cust_fname, cust_lname, cust_mail, cust_ph_no FROM Customer WHERE cust_id IN (SELECT cust_id FROM Reservation WHERE HotelID IN (SELECT HotelID FROM Hotel WHERE HotelRating > 4));'
    elif choice==11:
        command='SELECT CalculateTotalRevenue(1) AS totalRevenue;'
    elif choice==12:
        command='SELECT GetAvailableServicesForHotel(1) AS availableServices;'
    elif choice==13:
        command='CALL CalculateReservationDays(3, @result);'
        command1='SELECT @result AS NumberOfDays;'
    c.execute(command)
    c.execute(command1)
    data = c.fetchall()
    return data

def get_HotelID(): 
    c.execute('SELECT HotelID FROM Hotel') 
    data = c.fetchall()
    return data

def get_cust_id(): 
    c.execute('SELECT cust_id FROM Customer') 
    data = c.fetchall()
    return data

def get_type_id(): 
    c.execute('SELECT type_id FROM Room_Type') 
    data = c.fetchall()
    return data

def get_room_id(): 
    c.execute('SELECT room_id FROM Room') 
    data = c.fetchall()
    return data

def get_res_id(): 
    c.execute('SELECT res_id FROM Reservation') 
    data = c.fetchall()
    return data

def get_TransactionID(): 
    c.execute('SELECT TransactionID FROM Transaction') 
    data = c.fetchall()
    return data

def get_job_id(): 
    c.execute('SELECT job_id FROM Job') 
    data = c.fetchall()
    return data

def get_emp_id(): 
    c.execute('SELECT emp_id FROM Employees') 
    data = c.fetchall()
    return data

def get_ServiceID(): 
    c.execute('SELECT ServiceID FROM Service') 
    data = c.fetchall()
    return data

def delRec(id, choice):
    if choice=="Hotel":
        command = 'DELETE FROM Hotel where HotelID = "' + str(id) + '"'
    elif choice=="Customer":
        command = 'DELETE FROM Customer where cust_id = "' + str(id) + '"'
    elif choice=="Room_Type":
        command = 'DELETE FROM Room_Type where type_id = "' + str(id) + '"'
    elif choice=="Room":
        command = 'DELETE FROM Room where room_id = "' + str(id) + '"'
    elif choice=="Reservation":
        command = 'DELETE FROM Reservation WHERE res_id = "' + str(id) + '"'
    elif choice=="Transaction":
        command = 'DELETE FROM Transaction where TransactionID = "' + str(id) + '"'
    elif choice=="Job":
        command = 'DELETE FROM Job where job_id = "' + str(id) + '"'
    elif choice=="Employees":
        command = 'DELETE FROM Employees where emp_id = "' + str(id) + '"'
    elif choice=="Service":
        command = 'DELETE FROM Service where ServiceID = "' + str(id) + '"'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Hotel(HotelID, HotelName, HotelAddress, HotelRating, Hotel_Ph_No, Hotel_Rooms):
    command = 'INSERT INTO Hotel VALUES("'+HotelID+'","'+HotelName+'","'+HotelAddress+'","'+HotelRating+'","'+Hotel_Ph_No+'","'+Hotel_Rooms+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Customer(cust_id, cust_fname, cust_lname, cust_mail, cust_dob, cust_pwd, cust_address, cust_ph_no):
    command = 'Insert INTO Customer VALUES("'+cust_id+'","'+cust_fname+'","'+cust_lname+'","'+cust_mail+'","'+cust_pwd+'","'+cust_dob+'","'+cust_address+'","'+cust_ph_no+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Room_Type(type_id, room_name, room_price, room_capacity):
    command = 'Insert INTO Room_Type VALUES("'+type_id+'","'+room_name+'","'+room_price+'","'+room_capacity+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Room(room_id, type_id, HotelID, room_description, occupancy_status):
    command = 'INSERT INTO Room VALUES("'+str(room_id)+'","'+str(type_id)+'","'+str(HotelID)+'","'+room_description+'","'+str(occupancy_status)+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Reservation(res_id, cust_id, room_id, HotelID, in_date, out_date, Number_of_days):
    command = 'INSERT INTO Reservation VALUES("'+str(res_id)+'","'+str(cust_id)+'","'+str(room_id)+'","'+str(HotelID)+'","'+str(in_date)+'","'+str(out_date)+'","'+str(Number_of_days)+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Transaction(TransactionID, room_id, cust_id, TransactionDate, Amount, Transaction_Description):
    command = 'INSERT INTO Transaction VALUES("'+str(TransactionID)+'","'+str(room_id)+'","'+str(cust_id)+'","'+str(TransactionDate)+'","'+str(Amount)+'","'+Transaction_Description+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Job(job_id, job_title, salary):
    command = 'INSERT INTO Job VALUES("'+job_id+'","'+job_title+'","'+salary+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Employees(emp_id, job_id, HotelID, emp_fname, emp_lname, emp_address, emp_ph_no, emp_dob, emp_mail):
    command = 'INSERT INTO Employees VALUES("'+str(emp_id)+'","'+str(job_id)+'","'+str(HotelID)+'","'+emp_fname+'","'+emp_lname+'","'+emp_address+'", "'+emp_ph_no+'", "'+emp_dob+'", "'+emp_mail+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_Service(ServiceID, ServiceName, Price, Descrip):
    command = 'INSERT INTO Service VALUES("'+str(ServiceID)+'","'+ServiceName+'","'+str(Price)+'","'+Descrip+'");'
    print(command)
    c.execute(command)
    mydb.commit()

def add_HotelService(HotelID, ServiceID):
    command = 'INSERT INTO HotelService VALUES("'+str(HotelID)+'","'+str(ServiceID)+'");'
    print(command)
    c.execute(command)
    mydb.commit()


