const express = require('express')
const app = express()
const bodyParser = require('body-parser')
var cors = require('cors')
const port = process.env.PORT || 3000

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(express.static('public'));
app.use(cors())
 app.listen(3000, function () {
  console.log('CORS-enabled web server listening on port 3000')
})

let routes = require('./api/router')
routes(app)