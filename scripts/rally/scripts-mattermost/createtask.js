/*******************************************************************************
*Copyright 2018 Cognizant Technology Solutions
*  
*  Licensed under the Apache License, Version 2.0 (the "License"); you may not
*  use this file except in compliance with the License.  You may obtain a copy
*  of the License at
*  
*    http://www.apache.org/licenses/LICENSE-2.0
*  
*  Unless required by applicable law or agreed to in writing, software
*  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
*  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
*  License for the specific language governing permissions and limitations under
*  the License.
******************************************************************************/

/*Description:
 creates a task in CARally

Configuration:
 None

COMMANDS:
 None

Dependencies:
 "request"
*/

var request = require("request");
var createtask = function (url, username, password, name, workproduct, callback){
var taskbody={
  "Task": {
    "Name": name,
    "WorkProduct":workproduct
  }
}

var options = { 
  url: url+"task/create",
  headers: {"Authorization":"Bearer "+process.env.API_TOKEN},
  method:"POST",
  body:taskbody,
  json:true
	};
request(options, function (error, response, body) {
	
			if(error){
				callback(error,null,null)
			}
			if (response.statusCode!=200){
				
				callback(null,null,"no epics")
			}
			if (body){
			
			
			var message="TaskName \t\t\t TaskRef \t\t\t TaskId \t\t\t WorkspaceName \t\t\t WorkspaceId \n"
			if (response.statusCode==200)
			{
				if (body.CreateResult.Errors[0]!=undefined){
					
					message=body.CreateResult.Errors[0]
					callback(null,null,message)
				}
				else {
					message+=body.CreateResult.Object._refObjectName+"\t\t\t"+body.CreateResult.Object._ref +"\t\t\t"+body.CreateResult.Object.ObjectID +"\t\t\t"+body.CreateResult.Object.Workspace._refObjectName +"\t\t\t"+body.CreateResult.Object.Workspace._ref.split('/')[7]
					
					callback(null,message,null)
				}
			}
					
			
			}
			
})
}
module.exports = {
  createtask: createtask	// MAIN FUNCTION
  
}

