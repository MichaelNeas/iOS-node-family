const express = require('express')
const app = express()
const port = 3000
let superAdvancedDB = [
    {id: 1, name:"Albert", age: 14, weight: 175},
    {id: 2, name:"Sean", age: 23, weight: 148.5},
    {id: 3, name:"Craig", age: 32, weight: 320.7},
    {id: 4, name:"Channelle", age: 51, weight: 233.3},
    {id: 5, name:"Buorn", age: 34, weight: 183.5},
    {id: 6, name:"Shawn", age: 23, weight: 194.7},
    {id: 7, name:"Andrew", age: 42, weight: 210.2},
    {id: 8, name:"Tyler", age: 32, weight: 142.5},
    {id: 9, name:"Paul", age: 54, weight: 167.9},
    {id: 10, name:"Rety", age: 2, weight: 45},
    {id: 11, name:"Potter", age: 42, weight: 132.5},
    {id: 12, name:"Christina", age: 5, weight: 112.3},
    {id: 13, name:"Tina", age: 53, weight: 280.2},
    {id: 14, name:"Reay", age: 34, weight: 142.3},
    {id: 15, name:"AK", age: 25, weight: 133.7},
    {id: 16, name:"Tripp", age: 99, weight: 154.3},
    {id: 17, name:"Mops", age: 73, weight: 155.3},
    {id: 18, name:"Jumper", age: 83, weight: 194.8},
    {id: 19, name:"Crissy", age: 88, weight: 155.2},
    {id: 20, name:"Chel", age: 35, weight: 148.5},
    {id: 21, name:"Paul", age: 76, weight: 232.7},
    {id: 22, name:"Michelle", age: 12, weight: 123}]

let filterNames = name => superAdvancedDB.filter(val => val.name.toLocaleLowerCase().includes(name.toLocaleLowerCase()))

app.get('/v1/people', (req, res) => res.json(superAdvancedDB))

app.get('/v1/people/:name', function(req, res) {
    let name = req.params.name
    return res.json(filterNames(name))
})

app.delete('/v1/people/:id', function(req, res) {
    let id = req.params.id
    console.log(`Attempting to remove ${id}`)
    let removedArray = superAdvancedDB.splice(superAdvancedDB.findIndex(val => val.id == id), 1)
    if (removedArray.length > 0)
        return res.json(removedArray)
    else 
        return res.json({status:400, message: `No entry to be deleted`})
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
