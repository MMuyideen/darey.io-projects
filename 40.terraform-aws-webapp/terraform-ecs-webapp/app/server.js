const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('<h1>Hello! Your Web App is running on AWS ECS.</h1>');
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});