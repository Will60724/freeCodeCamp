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

// Timestamp API
app.get('/api/:date?', (req, res) => {
  const dateParam = req.params.date;
  let date;

  // If no date param, use current date
  if (!dateParam) {
    date = new Date();
  } 
  // If the dateParam is all digits (i.e., Unix timestamp)
  else if (/^\d+$/.test(dateParam)) {
    date = new Date(parseInt(dateParam));
  } 
  // Else, treat as date string
  else {
    date = new Date(dateParam);
  }

  // Handle invalid date
  if (isNaN(date.getTime())) {
    return res.json({ error: "Invalid Date" });
  }

  // Return timestamp
  res.json({
    unix: date.getTime(),
    utc: date.toUTCString()
  });
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
