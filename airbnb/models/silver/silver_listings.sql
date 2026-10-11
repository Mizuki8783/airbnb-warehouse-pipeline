{{
  config(
    materialized='incremental',
    unique_key='LISTING_ID'
  )
}}

select 
  LISTING_ID,
  HOST_ID,
  PROPERTY_TYPE,
  ROOM_TYPE,
  CITY,
  COUNTRY,
  ACCOMMODATES,
  BEDROOMS,
  BATHROOMS,
  PRICE_PER_NIGHT,
  {{ tag('PRICE_PER_NIGHT') }} as PRICE_PER_NIGHT_TAG,
  CREATED_AT
from {{ ref('bronze_listings') }}
{# {% if is_incremental() %}
  where CREATED_AT > (select coalesce(max(CREATED_AT), '1900-01-01') from {{ this }})
{% endif %} #}