# README
The payment application automatically calculate the annual payments for each mon of the year and also sends and email reminder.
## Get list of Things

### Request
Get all Payments
`GET /payments/` 

    curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTgwOTU0MDB9.j74tqne7G_2f9ZoKaw4FaUCQj1-nV8hAEqyno9M1EWk" http://localhost:3000/payments

## Response
[{"id":1,"month":"Jan","year":2019,"salaries_payment_day":30,"bonus_payment_day":15,"salaries_total":17000,"bonus_total":1780,"payments_total":18780},{"id":2,"month":"Feb","year":2019,"salaries_payment_day":28,"bonus_payment_day":21,"salaries_total":17000,"bonus_total":1780,"payments_total":18780},...]
Get all Payments + fiters
`GET /payments/` 

    curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTgwOTU0MDB9.j74tqne7G_2f9ZoKaw4FaUCQj1-nV8hAEqyno9M1EWk" http://localhost:3000/payments?month=Feb

## Response
[{"id":2,"month":"Feb","year":2019,"salaries_payment_day":28,"bonus_payment_day":21,"salaries_total":17000,"bonus_total":1780,"payments_total":18780}]

