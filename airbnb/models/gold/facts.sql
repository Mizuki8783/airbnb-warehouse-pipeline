{% set configs = [
    {
        "table" : "airbnb.gold.obt",
        "columns" : "obt.booking_id, obt.listing_id, obt.host_id, obt.total_amount, obt.service_fee, obt.cleaning_fee, obt.accommodates, obt.bedrooms, obt.bathrooms, obt.price_per_night, obt.response_rate",
        "alias" : "obt"
    }

]%}

select 
    {{ configs[0].columns }}
from 
  {{ ref(configs[0].alias) }}