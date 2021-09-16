const express=require("express");
const router=express.Router();
const adminController=require('../controllers/admin');





// router.get('/downloadfile',adminController.download); 

router.post('/organizationDetails',adminController.organizationDetails);

router.post('/addRole',adminController.addRole);

router.post('/addDepartment',adminController.addDepartment);

router.post('/addChecklist',adminController.addCheckList);

router.delete('/deleteChecklist',adminController.deleteChecklist);

router.post('/addChecklistItems',adminController.addChecklistItems);

router.post('/editChecklistItem',adminController.editChecklistItem);

router.delete('/deleteChecklistItem',adminController.deleteChecklistItem);

module.exports=router;