require('dotenv').config()
let bodyParser=require('body-parser');

let express = require('express');
let app = express();

const absolutePath = __dirname + '/views/index.html';
const assetPath = __dirname + '/public';

app.listen(3000, () => {
  console.log("Server is listening on port 3000");
});

console.log("Hello World!")

/*
app.get("/", (req, res) => {
    res.send("Hello Express");
});
*/


app.use('/public', express.static(assetPath));

app.get("/", (req, res) => {
    res.sendFile(absolutePath);
});

/*
app.get("/json", (req, res) => {
    res.json(process.env.MESSAGE_STYLE === 'uppercase' ?
        { "message": "HELLO JSON" } :
        { "message": "Hello json" });
});
*/


/*
//Middleware logger
app.use((req, res, next) => {
  console.log(`${req.method} ${req.path} - ${req.ip}`);
  next(); // move to the next middleware or route
});

// Example route
app.get("/", (req, res) => {
  res.json({ message: "Hello Express" });
});
*/
/*
app.get("/now", function (req, res, next) {
  req.time = new Date().toString();
  next();
}, function (req, res) {
  res.json({ time: req.time });
});
*/
/*
app.get('/:word/echo', (req, res) => {
  const word = req.params.word;
  res.json({ echo: word });
});
*/
/*
app.get('/name', (req, res) => {
  const firstName = req.query.first;
  const lastName = req.query.last;
  res.json({ name: `${firstName} ${lastName}` });
});
*/

app.use(bodyParser.urlencoded({ extended: false }));

app.route('/name')
  .get((req, res) => {
    const first = req.query.first;
    const last = req.query.last;
    res.json({ name: `${first} ${last}` });
  })
  .post((req, res) => {
    const first = req.body.first;
    const last = req.body.last;
    res.json({ name: `${first} ${last}` });
  });


module.exports = app;

































module.exports = app;
