SELECT CART_ID
FROM CART_PRODUCTS
WHERE NAME LIKE '%Milk%' OR NAME LIKE '%Yogurt%'
GROUP BY CART_ID
HAVING COUNT(DISTINCT(NAME)) >= 2
ORDER BY CART_ID
