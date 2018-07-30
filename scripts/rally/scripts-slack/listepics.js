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
 lists all the epics from CARally

Configuration:
 None

COMMANDS:
 None

Dependencies:
 "request"
*/

var request = require("request");
var listepics = function (url, username, password, callback){
var options = { 
  url: url+"portfolioitem/initiative",
  auth: {
			'user': username,
			'pass': password
		}
	};
request(options, function (error, response, body) {
	
			if(error){
				callback(error,null,null)
			}
			if (response.statusCode!=200){
				callback(null,null,"no epics")
			}
			if (body){
			console.log(body);
			body = JSON.parse(body);
			var feature=body.QueryResult.Results;
			console.log(feature)
			var message="Name\t\t\t\tType\t\t\tObjectId\n"
			
			for (var i=0;i<feature.length;i++){
				message += feature[i]._refObjectName + '\t\t\t' + feature[i]._type + '\t\t\t' + feature[i]._ref.split('/')[8] + '\n'
				console.log (message)
			}
			callback(null,message,null)
			}
			
})
}
module.exports = {
  listepics: listepics	// MAIN FUNCTION
  
}
