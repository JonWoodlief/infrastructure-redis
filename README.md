# infrastructure-cloudant

This repo, represent the template/module that create a standard cloudan plan for a database, on top of a cloudant single tenant cluster (in production) to support the presistence of the [content-mgmt](https://github.ibm.com/catalog-management/content-mgmt) service.  

At this time the cloudant instance is a classic implementation... but the intent (as cloudant replatform) is for the cloudant cluster to run inside a VPC.

**Note**:  _at this time, the public endpoint for the database is available_

![architecture](images/Cloudant.png)



