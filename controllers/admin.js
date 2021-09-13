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
exports.role=(req,res)=>{
    prisma.organizationdetail.createMany({
        data:[{
            
        }],
        skipDuplicates: true
        })
        .then(result=>{
            console.log(result);
            res.send(result);
            }
        )
        .catch(err=>{console.log(err);});
}







