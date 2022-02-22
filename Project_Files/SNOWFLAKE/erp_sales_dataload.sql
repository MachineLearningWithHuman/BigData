create  or replace table orders (
  Row_ID number,Order_ID varchar,Order_Date string,
  Ship_Date string,Ship_Mode varchar,Customer_ID varchar,
  Customer_Name varchar, Segment varchar, Country varchar, City varchar,
  State varchar,Postal_Code number, Region varchar, Product_ID varchar,
  Category varchar, Sub_Category varchar, Product_Name varchar,
  Sales float,Quantity number,Discount float,Profit float);
  
  --alter table "PC_FIVETRAN_DB"."ERP_SCHEMA"."ORDERS" drop column Row_ID;
  select distinct country from "DEVELOPMENT"."FINANCE"."ORDERS";
  
  create table people (
  Regional_Manager varchar,Region varchar);
  
  create table returns (
  Returned varchar,Order_ID varchar);
  
  CREATE TABLE "DEVELOPMENT"."FINANCE".orders CLONE "PC_FIVETRAN_DB"."ERP_SCHEMA"."ORDERS";
  
    
  CREATE TABLE "DEVELOPMENT"."FINANCE".people CLONE "PC_FIVETRAN_DB"."ERP_SCHEMA"."PEOPLE";
  
    
  CREATE TABLE "DEVELOPMENT"."FINANCE".returns CLONE "PC_FIVETRAN_DB"."ERP_SCHEMA"."RETURNS";