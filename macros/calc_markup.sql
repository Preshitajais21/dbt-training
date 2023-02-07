{% macro markup(ordersellingprice,ordercostprice) %}
    {% if ordercostprice != 0 %}
    ({{ordersellingprice}}-{{ordercostprice}})/{{ordercostprice}}
    {% endif %}
{% endmacro %}