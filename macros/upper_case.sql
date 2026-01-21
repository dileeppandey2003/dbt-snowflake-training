{% macro to_upper(column_name) %}
    upper({{ column_name }})
{% endmacro %}
