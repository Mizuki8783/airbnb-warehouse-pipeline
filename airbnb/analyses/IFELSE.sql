{% set flg = 1 %}

select * from {{ ref('bronze_bookings')}}
{% if flg == 1 %}
    where NIGHTS_BOOKED > 1
{% else %}
    where NIGHTS_BOOKED <= 1
{% endif %}
