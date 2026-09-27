-- Problem: Capital Gain/Loss
-- R.Beats: 86.76%

SELECT
    b.stock_name,
    s.sell_total - b.buy_total AS capital_gain_loss
FROM (
    SELECT
        stock_name,
        SUM(price) AS buy_total
    FROM
        Stocks
    WHERE
        operation = 'Buy'
    GROUP BY
        stock_name
) as b
JOIN (
    SELECT
        stock_name,
        SUM(price) AS sell_total
    FROM
        Stocks
    WHERE
        operation = 'Sell'
    GROUP BY
        stock_name
) as s
ON b.stock_name = s.stock_name;