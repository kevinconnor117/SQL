

### 15题 奇数排序：MySQL 中判断奇数的 6 种方法：

mod(x, 2) = 1 ，如果余数是 1 就是奇数。
power(-1, x) = -1 ， 如果结果是 -1 就是奇数
x % 2 = 1 ，如果余数是 1 就是奇数。
x & 1 = 1 ，如果是 1 就是奇数
x regexp '[1, 3, 5, 7, 9]$' = 1 如果为 1 就是奇数
x>>1<<1 != x 如果右移一位在左移一位不等于原值，就是奇数

### 16题 平均售价：使用between作为join条件
LEFT JOIN UnitsSold u ON p.product_id = u.product_id 
    AND **(u.purchase_date BETWEEN p.start_date AND p.end_date)**

### 17题 注册率：不是连接而是嵌套子查询
SELECT 
    contest_id,
    ROUND(100 * COUNT(user_id) / (SELECT COUNT(*) FROM users), 2) AS percentage

### 19题 每月交易：日期格式、SUM-IF连用
```
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month, # 用日期格式化方法改变日期格式
    country,
    COUNT(state) AS trans_count,
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM transactions
GROUP BY month, country
# groupby是可以用新创建的列的
```

### 21题 订单识别与配送：子查询实现分步聚类
```
# Write your MySQL query statement below

SELECT 
    ROUND((SUM(IF(order_date = customer_pref_delivery_date, 1, 0)) / COUNT(*)) * 100, 2) AS immediate_percentage
FROM (
    SELECT
        customer_id,
        MIN(order_date) order_date,
        MIN(customer_pref_delivery_date) customer_pref_delivery_date
    FROM delivery
    GROUP BY customer_id
    ORDER BY order_date
) AS T # 必须为子查询表设立别名

-- SELECT 
--     customer_id, 
--     ROUND((SUM(IF(MIN(order_date) = MIN(customer_pref_delivery_date), 1, 0)) / COUNT(*)) * 100, 2)
# 不允许将MIN聚合函数放入另一个聚合函数SUM之中。
# 当写 MIN(order_date) 时，数据库已经对每个 GROUP BY 分组（即每个 customer_id）计算了一个最小值。然后你试图将这个计算结果作为参数放入另一个聚合函数 SUM() 中，这是不允许的。
-- FROM delivery
-- GROUP BY customer_id

# 官方解将子查询写在where中
-- SELECT 
--     ROUND (SUM(order_date = customer_pref_delivery_date) * 100 / count(*), 2) as immediate_percentage
-- FROM Delivery
-- WHERE (customer_id, order_date) in (
--     select customer_id, min(order_date)
--     from delivery
--     group by customer_id
-- )
```
