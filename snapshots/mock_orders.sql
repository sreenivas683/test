{% snapshot mock_orders %}

    {% set new_schema = target.schema + "_snapshot" %}
    {{
        config(
            target_database="analytics",
            target_schema=new_schema,
            unique_key="order_id",
            strategy="timestamp",
            updated_at="updated_at",
        )
    }}
    select *
    from pc_dbt_db.{{ target.schema }}.mock_orders

{% endsnapshot %}
