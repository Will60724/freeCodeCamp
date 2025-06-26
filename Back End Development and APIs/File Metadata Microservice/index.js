const express = require('express');
const multer = require('multer');
const cors = require('cors');
const app = express();

// Middleware
app.use(cors());
app.use(express.static('public'));

// Serve HTML form
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html');
});

const upload = multer({ dest: 'uploads/' });

app.post('/api/fileanalyse', upload.single('upfile'), (req, res) => {
  const { originalname, mimetype, size } = req.file;

  res.json({
    name: originalname,
    type: mimetype,
    size: size
  });
});



// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
