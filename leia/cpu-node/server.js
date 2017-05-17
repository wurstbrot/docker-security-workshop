var express = require('express')
var bodyParser = require('body-parser')
var cluster = require('cluster');

if (cluster.isMaster) {

    // Count the machine's CPUs
    var cpuCount = require('os').cpus().length;

    // Create a worker for each CPU multiplied with 30
    for (var i = 0; i < cpuCount*30; i += 1) {
        cluster.fork();
    }

// Code to run if we're in a worker process
} else {
// Create a new instance of express
var app = express()

// Tell express to use the body-parser middleware and to not parse extended bodies
app.use(bodyParser.urlencoded({ extended: false }))

// Route that receives a POST request to /sms
app.post('/sms', function (req, res) {
  const sms = req.body.sms
  var regex = /([a-z]+)+$/
  regex.test(sms)
  res.set('Content-Type', 'text/plain')
  res.send("You sent: " + sms + " to Express")
})
 
// Tell our app to listen on port 3000
app.listen(3000, function (err) {
  if (err) {
    throw err
  }
 
  console.log('Server started on port 3000')
})
}
