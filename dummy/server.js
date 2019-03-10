const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.json([
    {name:"Albert", age: 14, weight: 175},
    {name:"Sean", age: 23, weight: 148.5},
    {name:"Craig", age: 32, weight: 320.7},
    {name:"Channelle", age: 51, weight: 233.3},
    {name:"Buorn", age: 34, weight: 183.5},
    {name:"Shawn", age: 23, weight: 194.7},
    {name:"Andrew", age: 42, weight: 210.2},
    {name:"Tyler", age: 32, weight: 142.5},
    {name:"Paul", age: 54, weight: 167.9},
    {name:"Rety", age: 2, weight: 45},
    {name:"Potter", age: 42, weight: 132.5},
    {name:"Christina", age: 5, weight: 112.3},
    {name:"Tina", age: 53, weight: 280.2},
    {name:"Reay", age: 34, weight: 142.3},
    {name:"AK", age: 25, weight: 133.7},
    {name:"Tripp", age: 99, weight: 154.3},
    {name:"Mops", age: 73, weight: 155.3},
    {name:"Jumper", age: 83, weight: 194.8},
    {name:"Crissy", age: 88, weight: 155.2},
    {name:"Chel", age: 35, weight: 148.5},
    {name:"Paul", age: 76, weight: 232.7},
    {name:"Michelle", age: 12, weight: 123}]))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
