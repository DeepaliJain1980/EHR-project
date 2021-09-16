const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

global.__basedir = __dirname;


//to add organization details in database
exports.organizationDetails=(req,res)=>{
    prisma.organizationdetail.create({
    data:{
        name:req.body.name,
        websiteLink:req.body.websiteLink,
        linkedInPage:req.body.linkedInPage,
        email:req.body.email,
        mobile:req.body.mobile,
        addressLine1:req.body.addressLine1,
        state:req.body.state,
        city:req.body.city,
        zipCode:req.body.zipcode
    }
    })
    .then(result=>{
        console.log(result);
        res.send(result);
        }
    )
    .catch(err=>{console.log(err);});
  }


//to add type of roles in database
//localhost://3000/admin/addRoles
//roles is array of roles from UI to create many roles at once
//postman test
//body-> raw/JSON
//header->content-type->application/json
//eg. {"roles":["doctor","admin"]}

exports.addRole=(req,res)=>{
    //var roles=[];
    const roles=[...req.body.roles];

    var role=[];
    for(let i=0;i<roles.length;i++)
     {
        role.push({"role":roles[i]});
     }
    console.log("roles   : ");
    console.log(roles);
    console.log(role);
    prisma.role.createMany({
        data:role,
        skipDuplicates: true,
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}




//to add type of Department in database
//localhost://3000/admin/addDepartment
//department is array of departments from UI to create many department under one role at once
//postman test
//body-> raw/JSON
//header->content-type->application/json
//eg. {"department":["OPD","Main stream"],"role":"doctor"}

exports.addDepartment=(req,res)=>{
    var departmentData=[];
    const department=[...req.body.department];
    const role=req.body.role;
    for(let i=0;i<department.length;i++)
     {
        departmentData.push({"roleName":role,"department":department[i]});
     }

     console.log("role  :" + role);
     console.log("departments   : ");
     console.log(department);

     console.log("department data   : ");
     console.log(departmentData);

    prisma.department.createMany({
        data:departmentData,
        skipDuplicates: true,
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}



//to add checklist in database
//localhost://3000/admin/addCheckList
//checklist is array of checklist from UI to create checklist at once
//postman test
//body-> raw/JSON
//header->content-type->application/json
//eg. {"checklist":["Onboarding","pre-onboarding"]}

exports.addCheckList=(req,res)=>{
    //var roles=[];
    const checklist=[...req.body.checklist];

    var checklistData=[];
    for(let i=0;i<checklist.length;i++)
     {
        checklistData.push({"name":checklist[i]});
     }
    console.log("checklist   : ");
    console.log(checklist);
    console.log("checklistData   : ");
    console.log(checklistData);
    prisma.checklist.createMany({
        data:checklistData,
        skipDuplicates: true,
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}




//to add checklist in database
//localhost://3000/admin/addCheckList
//checklist is array of checklist from UI to create checklist at once
//postman test
//body-> raw/JSON
//header->content-type->application/json
//eg. {"checklistName":"Onboarding"}

exports.deleteCheckList=(req,res)=>{
    //var roles=[];
    const checklistName=req.body.checklistName;

    prisma.checklist.delete({
        where:{
            name : checklistName
        },
        data: {
            items: {
              delete: true,
            },
          },
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}







//to add checklist-Items in database
//localhost://3000/admin/addChecklistItems
//checklistItems is array of checklistItems from UI to create checklistItems at once
//postman test
//body-> raw/JSON
//header->content-type->application/json
//eg. {"checklistItems":["Upload completed health and safety agreement","Registration on company portal"],"checklistName":"Onboarding"}

exports.addChecklistItems=(req,res)=>{
    //var roles=[];
    const checklistItems=[...req.body.checklistItems];

    var checklistItemData=[];
    for(let i=0;i<checklistItems.length;i++)
     {
        checklistItemData.push({"checklistName":req.body.checklistName,
                                "itemName":checklistItems[i],
                               });
     }
    console.log("checklistItems   : ");
    console.log(checklistItems);
    console.log("checklistItemData   : ");
    console.log(checklistItemData);
    prisma.checklistItems.createMany({
        data:checklistItemData,
        skipDuplicates: true,
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}






//to edit checklist-Items in database
//localhost://3000/admin/editChecklistItem
//checklistItems is array of checklistItems from UI to create checklistItems at once
//postman test
//body-> raw/JSON
//header->content-type->application/json

// {"checklistItem":"Upload completed health and safety agreement",
//      "checklistName":"Onboarding",
//     "description":"my description",
//     "mandatory":true,
//     "requireUploadingFile":true
// }

exports.editChecklistItem=(req,res)=>{
    //var roles=[];
    const checklistName=req.body.checklistName;
    const checklistItem=req.body.checklistItem;
    const description=req.body.description;
    const mandatory=req.body.mandatory;
    const requireUploadingFile=req.body.requireUploadingFile;

    console.log(checklistItem);
    console.log(description);
    console.log(mandatory);
    console.log(requireUploadingFile);

    prisma.checklistItems.update({
        where : {
                checklistName_itemName:{ 
                checklistName : checklistName,
                itemName:checklistItem
                }
                },
        // where : {
        //     itemName:checklistItem
        //     },
          data: {
            description: description,
            mandatory:mandatory,
            requireUploadingFile:requireUploadingFile
          },
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}





//to delete checklist-Item in database
//localhost://3000/admin/deleteChecklistItem
//postman test
//body->x-www-form-urlencoded

//    "checklistItem":"Upload completed health and safety agreement",
//     "checklistName":"Onboarding",
// }

exports.deleteChecklistItem=(req,res)=>{
    //var roles=[];
    const checklistName=req.body.checklistName;
    const checklistItem=req.body.checklistItem;
    

    console.log(checklistItem);


    prisma.checklistItems.delete({
        where : {
                checklistName_itemName:{ 
                checklistName : checklistName,
                itemName:checklistItem
                }
                },
         })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}



