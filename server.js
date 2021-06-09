// const ronin     = require( 'ronin-server' )
// const mocks     = require( 'ronin-mocks' )
// const database  = require( 'ronin-database' )
// const server = ronin.server()

// database.connect( process.env.CONNECTIONSTRING )
// server.use( '/foo', (req, res) => {
//     return res.json({ "foo": "bar" })
//   })
// server.use( '/', mocks.server( server.Router(), false, false ) )
// server.start()

// Get dependencies
var express     = require('express');
var morgan      = require('morgan');

var app = express();
var server = require('http').Server(app);
port = process.env.PORT || 8000;

// Catch all other routes and return the index file
app.get('/', (req, res) => {
  res.send("hello world!!");
});

// use morgan to log requests to the console
app.use(morgan('dev')); 

server.listen(port);
console.log('App running at http://localhost:' + port);