-- Problem: Capital Gain/Loss
-- R.Beats: 39.35%

SELECT
    stock_name,
    SUM(price * IF(operation = 'Buy', -1, 1)) AS capital_gain_loss
FROM
    Stocks
GROUP BY
    stock_name;