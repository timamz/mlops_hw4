{% macro amount_bucket(amount_column) -%}
case
  when {{ amount_column }} < 20 then 'small'
  when {{ amount_column }} < 100 then 'medium'
  when {{ amount_column }} < 500 then 'large'
  else 'very_large'
end
{%- endmacro %}
