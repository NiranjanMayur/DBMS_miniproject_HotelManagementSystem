import streamlit as st
import pandas as pd
from database import get_HotelID
from database import get_cust_id
from database import get_type_id
from database import get_room_id
from database import get_job_id
from database import get_ServiceID
from database import add_Hotel
from database import add_Customer
from database import add_Room_Type
from database import add_Room
from database import add_Reservation
from database import add_Transaction
from database import add_Job
from database import add_Employees
from database import add_Service
from database import add_HotelService
from database import viewTables


def add():
    menu = ["Hotel", "Customer", "Room_Type", "Room", "Reservation", "Transaction", "Job", "Employees", "Service", "HotelService"]
    choice = st.sidebar.selectbox("Menu", menu)
    
    
    #Hotel
    if choice==menu[0]:
        col1, col2 = st.columns(2)
        with col1:
            HotelID = st.text_input("HotelID: ")
            HotelName = st.text_input("HotelName: ")
            HotelAddress = st.text_input("HotelAddress: ")
        with col2:
            HotelRating = st.text_input("HotelRating: ")
            Hotel_Ph_No = st.text_input("Hotel_Ph_No: ")
            Hotel_Rooms = st.text_input("Hotel_Rooms: ")
        if st.button("Add Hotel"):
            add_Hotel(HotelID, HotelName, HotelAddress, HotelRating, Hotel_Ph_No, Hotel_Rooms)
            st.success("Successfully added Hotel ")
   
    
    #Customer
    if choice==menu[1]:
        col1, col2 = st.columns(2)
        with col1:
            cust_id = st.text_input("cust_id : ")
            cust_fname = st.text_input("cust_fname: ")
            cust_lname = st.text_input("cust_lname: ")
            cust_mail = st.text_input("cust_mail: ")
        with col2:
            cust_dob = st.text_input("cust_dob: ")
            cust_pwd = st.text_input("cust_pwd: ")
            cust_address = st.text_input("cust_address: ")
            cust_ph_no = st.text_input("cust_ph_no: ")
        if st.button("Add Customer"):
            add_Customer(cust_id, cust_fname, cust_lname, cust_mail, cust_dob, cust_pwd, cust_address, cust_ph_no)
            st.success("Successfully added Customer ")


    #Room_Type
    if choice==menu[2]:
        col1, col2 = st.columns(2)
        with col1:
            type_id = st.text_input("type_id: ")
            room_name = st.text_input("room_name: ")
        with col2:
            room_price = st.text_input("room_price: ")
            room_capacity = st.text_input("room_capacity: ")
        if st.button("Add Room_Type"):
            add_Room_Type(type_id, room_name, room_price, room_capacity)
            st.success("Successfully added Room_Type ")


    #Room
    if choice==menu[3]:
        col1, col2 = st.columns(2)
        with col1:
            room_id = st.text_input("room_id: ")
            type_id = st.selectbox("type_id :", [i[0] for i in get_type_id()])
            HotelID = st.selectbox("HotelID :", [i[0] for i in get_HotelID()])
        with col2:
            room_description = st.text_input("room_description: ")
            occupancy_status = st.text_input("occupancy_status: ")
        if st.button("Add Room"):
            add_Room(room_id, type_id, HotelID, room_description, occupancy_status)
            st.success("Successfully added Room ")


    #Reservation
    if choice==menu[4]:
        col1, col2 = st.columns(2)
        with col1:
            res_id = st.text_input("res_id: ")
            cust_id = st.selectbox("cust_id :", [i[0] for i in get_cust_id()])
            room_id = st.selectbox("room_id :", [i[0] for i in get_room_id()])
            HotelID = st.selectbox("HotelID :", [i[0] for i in get_HotelID()])
        with col2:
            in_date = st.text_input("in_date :")
            out_date = st.text_input("out_date ")
            Number_of_days = st.text_input("Number_of_days: ")
        if st.button("Add Reservation"):
            add_Reservation(res_id, cust_id, room_id, HotelID, in_date, out_date, Number_of_days)
            st.success("Successfully added Reservation ")


    #Transaction
    if choice==menu[5]:
        col1, col2 = st.columns(2)
        with col1:
            TransactionID = st.text_input("TransactionID: ")
            room_id = st.selectbox("room_id :", [i[0] for i in get_room_id()])
            cust_id = st.selectbox("cust_id :", [i[0] for i in get_cust_id()])
        with col2:
            TransactionDate = st.text_input("TransactionDate :")
            Amount = st.text_input("Amount: ")
            Transaction_Description = st.selectbox("Transaction_Description:", [ "Successful", "Failed", "Pending"])
        if st.button("Add Transaction"):
            add_Transaction(TransactionID, room_id, cust_id, TransactionDate, Amount, Transaction_Description)
            st.success("Successfully added Transaction")
            
            
    #Job
    if choice==menu[6]:
        col1, col2 = st.columns(2)
        with col1:
            job_id = st.text_input("job_id: ")
            job_title = st.text_input("job_title: ")
        with col2:
            salary = st.text_input("salary: ")
        if st.button("Add Job"):
            add_Job(job_id, job_title, salary)
            st.success("Successfully added Job: ")
      
            
    #Employees
    if choice==menu[7]:
        col1, col2 = st.columns(2)
        with col1:
            emp_id = st.text_input("emp_id: ")
            job_id = st.selectbox("job_id :", [i[0] for i in get_job_id()])
            HotelID = st.selectbox("HotelID :", [i[0] for i in get_HotelID()])
            emp_fname = st.text_input("emp_fname: ")
            emp_lname = st.text_input("emp_lname: ")
        with col2:
            emp_address = st.text_input("emp_address :")
            emp_ph_no = st.text_input("emp_ph_no: ")
            emp_dob = st.text_input("emp_dob: ")
            emp_mail = st.text_input("emp_mail: ")
        if st.button("Add Employees"):
            add_Employees(emp_id, job_id, HotelID, emp_fname, emp_lname, emp_address, emp_ph_no, emp_dob, emp_mail)
            st.success("Successfully added Employees")

    #Service
    if choice==menu[8]:
        col1, col2 = st.columns(2)
        with col1:
            ServiceID = st.text_input("ServiceID: ")
            ServiceName = st.text_input("ServiceName: ")
        with col2:
            Price = st.text_input("Price: ")
            Descrip = st.text_input("Descrip: ")
        if st.button("Add Service"):
            add_Service(ServiceID, ServiceName, Price, Descrip)
            st.success("Successfully added Service")
            

    #HotelService
    if choice==menu[9]:
        col1, col2 = st.columns(2)
        with col1:
            HotelID = st.selectbox("HotelID :", [i[0] for i in get_HotelID()])
        with col2:
            ServiceID = st.selectbox("ServiceID :", [i[0] for i in get_ServiceID()])
        if st.button("Add HotelService"):
            add_HotelService(HotelID, ServiceID)
            st.success("Successfully added HotelService")
    
    
    with st.expander("View Updated Table"):
        result = viewTables(choice)
        df = pd.DataFrame(result) 
        st.dataframe(df)