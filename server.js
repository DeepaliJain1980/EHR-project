
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const cors = require('cors')
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
app.use(cors());
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(express.static('public'));

const adminRoutes=require('./routes/admin');



app.use('/admin',adminRoutes);


/*-------------------------------------------------------------------------------*/
//entry point
const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
});




