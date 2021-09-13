const express=require("express");
const router=express.Router();
const adminController=require('../controllers/admin');
const upload=require("../middleware/file");
const validation=require("../validation/excelvalidation");



// router.get('/downloadfile',adminController.download); 

router.post('/organizationDetails',adminController.organizationDetails);
router.post('/role',adminController.role);

module.exports=router;