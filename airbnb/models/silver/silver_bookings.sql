{{
  config(
    materialized='incremental',
    unique_key='BOOKING_ID',
    on_schema_change='append_new_columns'
  )
}}

select 
  BOOKING_ID,
  LISTING_ID,
  BOOKING_DATE,
  {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} + CLEANING_FEE + SERVICE_FEE as TOTAL_AMOUNT,
  SERVICE_FEE,
  CLEANING_FEE,
  BOOKING_STATUS,
  CREATED_AT
from {{ ref('bronze_bookings') }}
{# {% if is_incremental() %}
  where CREATED_AT > (select coalesce(max(CREATED_AT), '1900-01-01') from {{ this }})
{% endif %} #}