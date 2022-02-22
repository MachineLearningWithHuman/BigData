

      create or replace transient table PC_FIVETRAN_DB.TRANSFORMATION.ACCOUNT_V2  as
      (

with source_data as (

    SELECT ACCOUNT_ID
,ACCOUNT_NAME
,ACCOUNT_NUMBER
,ACCOUNT_RATING
,ACCOUNT_SITE
,ACCOUNT_TYPE
,ANNUAL_REVENUE
,APPLICATION
,BILLING_CITY
,BILLING_COUNTRY
,BILLING_GEOCODE_ACCURACY
,BILLING_LATITUDE
,BILLING_LONGITUDE
,BILLING_STATE_PROVINCE
,BILLING_STREET
,BILLING_ZIP_POSTAL_CODE
,CREATE_IN_ZENDESK
,CREATED_BY_ID
,CREATED_DATE
,CREATED_UPDATED_FLAG
,DELETED
,DOMAIN_MAPPING
,EMPLOYEES
,INDUSTRY
,INDUSTRY_SUBSEGMENT
,IS_DEMO_CENTER
,JIGSAW_COMPANY_ID
,LAST_ACTIVITY
,LAST_MODIFIED_BY_ID
,LAST_MODIFIED_DATE
,LAST_REFERENCED_DATE
,LAST_SYNC_DATE
,LAST_SYNC_STATUS
,LAST_VIEWED_DATE
,LEAD_TYPE
,LIFE_SCIENCE_KEY_ACCOUNT
,MASTER_RECORD_ID
,NET_SUITE_BILLING_COUNTRY
,NET_SUITE_CUSTOMER_ID
,NOTES
,OWNER_ID
,PARENT_ACCOUNT_ID
,PRIMARY_APPLICATION
,REFERENCE_CUSTOMER
,REGION
,SHIPPING_CITY
,SHIPPING_COUNTRY
,SHIPPING_GEOCODE_ACCURACY
,SHIPPING_LATITUDE
,SHIPPING_LONGITUDE
,SHIPPING_STATE_PROVINCE
,SHIPPING_STREET
,SHIPPING_ZIP_POSTAL_CODE
,SIC_CODE
,SYSTEM_MODSTAMP
,TICKER_SYMBOL
,WEBSITE
,ZENDESK_ORGANIZATION
,ZENDESK_OUTOF_SYNC
,ZENDESK_RESULT 
,(3956*2*asin(sqrt(power(sin((SHIPPING_LATITUDE-BILLING_LATITUDE)/2),2) + COS(BILLING_LATITUDE) * COS(SHIPPING_LATITUDE) 
	*POWER(SIN((SHIPPING_LONGITUDE-BILLING_LONGITUDE)/2),2)))) as distance_in_miles 
  from PC_FIVETRAN_DB.TRANSFORMATION.ACCOUNT_V1
),

final as (
    select * from source_data
)

select * from final
      );
    