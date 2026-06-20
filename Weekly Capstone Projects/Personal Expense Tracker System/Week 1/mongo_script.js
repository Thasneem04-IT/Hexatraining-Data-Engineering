// use expense_monitoring
// switched to db expense_monitoring
db.receipts.insertMany([
{
    user_id: 1,
    receipt_id: "R1001",
    merchant: "Amazon",
    amount: 1500,
    category: "Shopping",
    purchase_date: "2026-06-10",
    notes: "Bought headphones"
},
{
    user_id: 1,
    receipt_id: "R1002",
    merchant: "Swiggy",
    amount: 450,
    category: "Food",
    purchase_date: "2026-06-12",
    notes: "Dinner order"
}
]);

db.receipts.createIndex(
    {user_id:1}
)
user_id_1
db.receipts.createIndex(
    {receipt_id:1}
)
receipt_id_1
db.receipts.createIndex(
    {
        user_id:1,
        purchase_date:-1
    }
)
user_id_1_purchase_date_-1
expense_monitoring


