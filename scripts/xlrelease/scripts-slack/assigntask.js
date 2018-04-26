/*******************************************************************************
*Copyright 2018 Cognizant Technology Solutions
* 
* Licensed under the Apache License, Version 2.0 (the "License"); you may not
* use this file except in compliance with the License.  You may obtain a copy
* of the License at
* 
*   http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
* License for the specific language governing permissions and limitations under
* the License.
 ******************************************************************************/

var request=require('request');
var fs=require('fs');
var assigntask= function (url, username, password, taskid, username,callback) {






var xlrelease_url = url+"/api/v1/tasks/Applications/"+taskid+"/assign/"+username
var options = { 
auth: {
        'user': username,
        'pass': password
    },
method: 'post',
  url:xlrelease_url,
  headers: 
   {'Content-Type':'application/json'},
  body:''
  };
  
  request(options, function (error, response, body) {
	
	
	
		
  if (error)
  {
	  callback(error,null,null);
  }
  if (response.statusCode!=200)
  {
	  console.log(body)
	  callback(null,null,body);
	  
	  
  }
  if (response.statusCode==200){
	  console.log("task assigned")
	  callback(null,"task assigned",null);
  }
  });
  

  
};
module.exports = {
  assigntask: assigntask	// MAIN FUNCTION
  
}
//assigntask("http://10.224.86.160:5516","admin","Devops123","Release426800536/Phase935321008/Task704235464","admin")
