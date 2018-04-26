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
var releasedel= function (url, username, password, releaseid ,callback) {






var xlrelease_url = url+"/api/v1/releases/Applications/"+releaseid
var options = { 
auth: {
        'user': username,
        'pass': password
    },

method: 'delete',
  url: xlrelease_url,
  headers: 
   {'Content-Type':'application/json'},
  body:''
  };
  
  request(options, function (error, response, body) {
	
	
	
		
  if (error)
  {
	  callback(error,null,null);
  }
  if (response.statusCode!=204)
  {
	  console.log(body)
	  callback(null,null,body);
	  
	  
  }
  if (response.statusCode==204){

	
	//var resultid=JSON.parse(body);
	  console.log("deleted release ")
	  callback(null,"deleted release",null);
  }
  });
  

  
};


module.exports = {
  releasedel: releasedel	// MAIN FUNCTION
  
}

//releasestart("http://10.224.86.160:5516","admin","Devops123","Release426800536")