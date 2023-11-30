import streamlit as st
from database import delRec
from database import viewTables
import pandas as pd
from database import get_HotelID
from database import get_cust_id
from database import get_type_id
from database import get_room_id
from database import get_res_id
from database import get_TransactionID
from database import get_job_id
from database import get_emp_id
from database import get_ServiceID

def delete():
    menu = ["Hotel", "Customer", "Room_Type", "Room", "Reservation", "Transaction", "Job", "Employees", "Service"]
    choice = st.sidebar.selectbox("Menu", menu)
    result = viewTables(choice)
    if choice==menu[0]:
        df = pd.DataFrame(result, columns=("HotelID", "HotelName", "HotelAddress","HotelRating", "Hotel_Ph_No", "Hotel_Rooms")) 
    elif choice==menu[1]:
        df = pd.DataFrame(result, columns=("cust_id", "cust_fname", "cust_lname", "cust_mail", "cust_dob", "cust_pwd", "cust_address", "cust_ph_no", "stat"))
    elif choice==menu[2]:
        df = pd.DataFrame(result, columns=("type_id", "room_name", "room_price", "room_capacity"))
    elif choice==menu[3]:
        df = pd.DataFrame(result, columns=("room_id", "type_id", "HotelID", "room_description", "occupancy_status"))
    elif choice==menu[4]:
        df = pd.DataFrame(result, columns=("res_id", "cust_id", "room_id", "HotelID", "in_date", "out_date", "Number_of_days"))
    elif choice==menu[5]:
        df = pd.DataFrame(result, columns=("TransactionID", "room_id", "cust_id", "TransactionDate", "Amount", "Transaction_Description"))
    elif choice==menu[6]:
        df = pd.DataFrame(result, columns=("job_id", "job_title", "salary"))
    elif choice==menu[7]:
        df = pd.DataFrame(result, columns=("emp_id", "job_id", "HotelID", "emp_fname", "emp_lname", "emp_address", "emp_ph_no", "emp_dob", "emp_mail"))
    elif choice==menu[8]:
        df = pd.DataFrame(result, columns=("ServiceID", "ServiceName", "Price", "Descrip"))
    st.dataframe(df)
    list_of_id=[]
    if choice=="Hotel":
        list_of_id = [i[0] for i in get_HotelID()]
    elif choice=="Customer":
        list_of_id = [i[0] for i in get_cust_id()]
    elif choice=="Room_Type":
        list_of_id = [i[0] for i in get_type_id()]
    elif choice=="Room":
        list_of_id = [i[0] for i in get_room_id()] 
    elif choice=="Reservation":
          list_of_id = [i[0] for i in get_res_id()]
    elif choice=="Transaction":
          list_of_id = [i[0] for i in get_TransactionID()]
    elif choice=="Job":
        list_of_id = [i[0] for i in get_job_id()] 
    elif choice=="Employees":
          list_of_id = [i[0] for i in get_emp_id()]
    elif choice=="Service":
          list_of_id = [i[0] for i in get_ServiceID()]
    id=st.selectbox("Enter ID", list_of_id)
    if st.button("Delete Record"):
        delRec(id, choice)
        st.success("Successfully deleted record")
    