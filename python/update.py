import streamlit as st
from database import updateStatus
from database import viewTables
import pandas as pd
from database import get_HotelID
from database import get_cust_id
from database import get_type_id
from database import get_job_id
from database import get_emp_id

def update():
    menu = ["Hotel", "Customer", "Room_Type", "Job", "Employees"]
    choice = st.sidebar.selectbox("Menu", menu)
    result = viewTables(choice)
    if choice==menu[0]:
        df = pd.DataFrame(result, columns=("HotelID", "HotelName", "HotelAddress","HotelRating", "Hotel_Ph_No", "Hotel_Rooms")) 
    elif choice==menu[1]:
        df = pd.DataFrame(result, columns=("cust_id", "cust_fname", "cust_lname", "cust_mail", "cust_dob", "cust_pwd", "cust_address", "cust_ph_no", "stat"))
    elif choice==menu[2]:
        df = pd.DataFrame(result, columns=("type_id", "room_name", "room_price", "room_capacity"))
    elif choice==menu[3]:
        df = pd.DataFrame(result, columns=("job_id", "job_title", "salary"))
    elif choice==menu[4]:
        df = pd.DataFrame(result, columns=("emp_id", "job_id", "HotelID", "emp_fname", "emp_lname", "emp_address", "emp_ph_no", "emp_dob", "emp_mail"))
    st.dataframe(df)
    c1, c2 = st.columns(2)
    with c1:
        if (choice=="Hotel"):
            id=st.selectbox("Enter HotelID", [i[0] for i in get_HotelID()])
        elif(choice=="Customer"):
            id=st.selectbox("Enter cust_id", [i[0] for i in get_cust_id()])
        elif(choice=="Room_Type"):
            id=st.selectbox("Enter type_id", [i[0] for i in get_type_id()])
        elif(choice=="Job"):
            id=st.selectbox("Enter job_id", [i[0] for i in get_job_id()])
        elif(choice=="Employees"):
            id=st.selectbox("Enter emp_id", [i[0] for i in get_emp_id()])
    with c2:
        if (choice=="Hotel"):
            status = st.text_input("Hotel_Ph_No: ")
        elif(choice=="Customer"):
            status = st.text_input("cust_ph_no: ")
        elif(choice=="Room_Type"):
            status = st.text_input("room_price: ")
        elif(choice=="Job"):
            status = st.text_input("salary: ")
        elif(choice=="Employees"):
            status = st.text_input("emp_ph_no: ")
    if st.button("Update Record"):
        updateStatus(id, status, choice)
        st.success("Successfully updated record")
    result = viewTables(choice)
    df = pd.DataFrame(result)