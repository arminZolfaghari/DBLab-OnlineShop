
SELECT Cu.name, Cu.phone_number, Co.score
FROM Customer as Cu JOIN Comment as Co
ON Cu.ID = Co.customer_ID
WHERE Co.created_at >= '2020-1-1'
GROUP BY Cu.name, Cu.phone_number, Co.score
HAVING Co.score <= 4;
