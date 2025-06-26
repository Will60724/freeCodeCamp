require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();

const bodyParser = require('body-parser');
const urlParser = require('url');
const dns = require('dns');

// Enable CORS for FCC testing
app.use(cors({ optionsSuccessStatus: 200 }));

// Serve static files
const assetPath = __dirname + '/public';
app.use('/public', express.static(assetPath));

// Serve home page
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html');
});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());

const urlDatabase = {};
let counter = 1;

app.post('/api/shorturl', (req, res) => {
  const originalUrl = req.body.url;
  const parsedUrl = urlParser.parse(originalUrl);

  // Validate: must include hostname & protocol
  if (!parsedUrl.hostname || !/^https?:/.test(parsedUrl.protocol)) {
    return res.json({ error: 'invalid url' });
  }

  // DNS lookup to verify the domain exists
  dns.lookup(parsedUrl.hostname, (err) => {
    if (err) {
      return res.json({ error: 'invalid url' });
    } else {
      const shortUrl = counter++;
      urlDatabase[shortUrl] = originalUrl;
      res.json({
        original_url: originalUrl,
        short_url: shortUrl
      });
    }
  });
});

app.get('/api/shorturl/:short_url', (req, res) => {
  const shortUrl = req.params.short_url;
  const originalUrl = urlDatabase[shortUrl];

  if (originalUrl) {
    res.redirect(originalUrl);
  } else {
    res.json({ error: 'No short URL found for given input' });
  }
});


// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
