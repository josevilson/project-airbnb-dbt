{% macro string_to_boolean(column_name) %}
    CASE
        WHEN {{ column_name }} = 't' THEN true
        WHEN {{ column_name }} = 'f' THEN false
        ELSE NULL
    END
{% endmacro %}