-- Problem: Find Stores with Inventory Imbalance
-- R.Beats: 99.45%

WITH ranked_inventory AS (
    SELECT
        store_id,
        product_name,
        quantity,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY price DESC, quantity DESC
        ) AS expensive_rank,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY price ASC, quantity DESC
        ) AS cheapest_rank
    FROM inventory
),
valid_stores AS (
    SELECT
        store_id
    FROM
        inventory
    GROUP BY
        store_id
    HAVING
        COUNT(DISTINCT product_name) >= 3
),
store_price_extremes AS (
    SELECT
        expensive.store_id,
        expensive.product_name AS most_exp_product,
        cheapest.product_name AS cheapest_product,
        expensive.quantity AS most_exp_quantity,
        cheapest.quantity AS cheapest_quantity
    FROM
        ranked_inventory AS expensive
    JOIN
        ranked_inventory AS cheapest
        ON expensive.store_id = cheapest.store_id
    WHERE
        expensive.expensive_rank = 1
        AND cheapest.cheapest_rank = 1
        AND expensive.quantity < cheapest.quantity
)

SELECT
    extremes.store_id,
    stores.store_name,
    stores.location,
    extremes.most_exp_product,
    extremes.cheapest_product,
    ROUND(
        extremes.cheapest_quantity * 1.0 /
        extremes.most_exp_quantity,
        2
    ) AS imbalance_ratio
FROM
    store_price_extremes AS extremes
JOIN
    valid_stores
    ON extremes.store_id = valid_stores.store_id
JOIN
    stores
    ON extremes.store_id = stores.store_id
ORDER BY
    imbalance_ratio DESC,
    stores.store_name ASC;