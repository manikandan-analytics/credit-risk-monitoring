SELECT
  loan_id,
  loan_amount,
  funded_amount,
  term,
  int_rate,
  grade
FROM `bigquery-public-data.lending_club.loans_2015`
LIMIT 1000