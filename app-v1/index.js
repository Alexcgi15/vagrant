const express = require("express")
const dotenv = require("dotenv")
dotenv.config()
const app = express()

const PORT = process.env.PORT || 3000

app.use(express.json())

app.get("/", (req, res) => {
    console.log("GET on /...")
    res.send("Hello world!")
})

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}...`)
})