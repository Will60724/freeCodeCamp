require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();

// Enable CORS for FCC testing
app.use(cors({ optionsSuccessStatus: 200 }));

// Serve static files
const assetPath = __dirname + '/public';
app.use('/public', express.static(assetPath));

// Serve home page
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html');
});

app.get('/api/whoami', (req, res) => {
  const ip = req.ip || req.connection.remoteAddress;
  const language = req.headers['accept-language'];
  const software = req.headers['user-agent'];

  res.json({
    ipaddress: ip,
    language: language,
    software: software
  });
});



// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});