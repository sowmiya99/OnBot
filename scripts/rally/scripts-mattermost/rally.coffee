#-------------------------------------------------------------------------------
# Copyright 2018 Cognizant Technology Solutions
#   
#   Licensed under the Apache License, Version 2.0 (the "License"); you may not
#   use this file except in compliance with the License.  You may obtain a copy
#   of the License at
#   
#     http://www.apache.org/licenses/LICENSE-2.0
#   
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#   WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
#   License for the specific language governing permissions and limitations under
#   the License.
#-------------------------------------------------------------------------------

#Description:
# This script listens to commands handled by CARally bot,
# passes them to the appropriate js files for execution,
# Returns the result of execution back to user
#
#Configuration:
# HUBOT_NAME
# API
# USERNAME
# PASSWORD
#
#Dependencies:
# "request": "2.81.0"

request = require('request')
eindex = require('./index')
readjson = require './readjson.js'
generate_id = require('./mongoConnt')
listfeatures = require('./listfeatures.js')
listepics = require('./listepics.js')
listuserstory = require('./listuserstory.js')
listbugs = require('./listbugs.js')
listtasks = require('./listtasks.js')
listtestcases = require('./listtestcases')
listreleases = require('./listreleases.js')
listiteration = require('./listiteration.js')
listproject = require('./listproject.js')
deletefeatures = require('./deletefeatures.js')
deleteepic = require('./deleteepic.js')
deleteuserstory = require('./deleteuserstory.js')
deletebug = require('./deletebug.js')
deletetask = require('./deletetask.js')
deletetestcase = require('./deletetestcase.js')
deleterelease = require('./deleterelease.js')
deleteiteration = require('./deleteiteration.js')

module.exports = (robot) ->

	#help
	cmdhelp = new RegExp('@' + process.env.HUBOT_NAME + ' help')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdhelp
		(res) ->
			dt = "Following are the commands of RALLY :smiley:\n1)list features -->lists the features\n2)list Epics -->lists the Epics\n3)list UserStory -->lists the UserStories\n4)list Bugs -->lists the Bugs\n5)list Tasks -->lists the Tasks\n6)list TestCases -->lists the TestCases\n7)list Releases -->lists the Releases -->lists the Releases\n8)list Iterations -->lists the Iterations\n9)list Project from <worksapce>\n10)delete feature<objectId> -->Deletes the feature of the objectid\n11)delete Epic<objectId> -->Deletes the Epic of the objectid\n12)delete UserStory<objectId> -->Deletes the Userstory of the objectid\n13)delete Bug<objectId> -->Deletes the Bug of the objectid\n14)delete Task<objectId> -->Deletes the Task of the objectid\n15)delete TestCase<objectId> -->Deletes the TestCase of the objectid\n16)delete Release<objectId> -->Deletes the Release of the objectid\n17)delete Iteration<objectId> -->Deletes the Iteration of the objectid\n18)create Bug <bugname> Desc <desc> Priority <priority> Severity <severity> and Status <state>\n19)create Feature <featurename> Desc <desc> and Status <state>\n20)create Epic <epicname> Desc <desc> and Status <state> \n21)create iteration <iterationname> startdate <startdate> Enddate <enddate> and Status <state> \n22)create release <releasename> startdate <startdate> Enddate <enddate> and Status <state> \n23)create task <taskname> workproduct <defectid> \n24)create testcase <testacasename> workproduct <defectid> \n25)create userstory <userstoryname> \n26)create project <projname> in <workspacename> state <state>"
			res.send dt
	)
		
	#list features
	cmdlistfeatures = new RegExp('@' + process.env.HUBOT_NAME + ' list features')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistfeatures
		(res) ->
			listfeatures.listfeatures process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
	
	#list Epics
	cmdlistepics = new RegExp('@' + process.env.HUBOT_NAME + ' list Epics')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistepics
		(res) ->
			listepics.listepics process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
	
	#list Userstory
	cmdlistuserstory = new RegExp('@' + process.env.HUBOT_NAME + ' list Userstory')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistuserstory
		(res) ->
			listuserstory.listuserstory process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
	
	#list Bugs
	cmdlistbugs = new RegExp('@' + process.env.HUBOT_NAME + ' list Bugs')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistbugs
		(res) ->
			listbugs.listbugs process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
	
	#list Tasks
	cmdlisttasks = new RegExp('@' + process.env.HUBOT_NAME + ' list Tasks')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlisttasks
		(res) ->
			listtasks.listtasks process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
					
	#list TestCases
	cmdlisttestcases = new RegExp('@' + process.env.HUBOT_NAME + ' list TestCases')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlisttestcases
		(res) ->
			listtestcases.listtestcases process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
	
	#list Releases
	cmdlistrealeases = new RegExp('@' + process.env.HUBOT_NAME + ' list Releases')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistrealeases
		(res) ->
			listreleases.listreleases process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
	
	#list Iterations
	cmdlistiterations = new RegExp('@' + process.env.HUBOT_NAME + ' list Iterations')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistiterations
		(res) ->
			listiteration.listiteration process.env.API, process.env.USERNAME, process.env.PASSWORD, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)
				
	#list projects			
	cmdlistproject = new RegExp('@' + process.env.HUBOT_NAME + ' list Project from (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmdlistproject
		(res) ->
			workspace=res.match[1]
			listproject.listproject process.env.API, process.env.USERNAME, process.env.PASSWORD, workspace, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					res.send stdout 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					res.send stderr
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					res.send error
					setTimeout (->eindex.passData error),1000
	)

				


	
	#delete Feature
	cmddeletefeature = new RegExp('@' + process.env.HUBOT_NAME + ' delete feature (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeletefeature
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deletefeature.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deletefeature",objectid:objectid}
						data = {"channel": stdout.deletefeature.admin,"text":"Request from "+payload.username+" to delete feature "+objectid,"message":"Request from "+payload.username+" to delete feature "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deletefeature',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deletefeature.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deletefeatures.deletefeatures process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
						
	robot.router.post '/deletefeature', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting feature';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deletefeatures.deletefeatures process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete feature request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete feature.';
				
	#delete Epic
	cmddeleteepic = new RegExp('@' + process.env.HUBOT_NAME + ' delete Epic (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeleteepic
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deleteepic.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deleteepic",objectid:objectid}
						data = {"channel": stdout.deleteepic.admin,"text":"Request from "+payload.username+" to delete epic "+objectid,"message":"Request from "+payload.username+" to delete epic "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deleteepic',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deleteepic.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deleteepic.deleteepic process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
						
	robot.router.post '/deleteepic', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting epic';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deleteepic.deleteepic process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete epic request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete epic.';
	
	#delete Userstory	
	cmddeleteuserstory = new RegExp('@' + process.env.HUBOT_NAME + ' delete UserStory (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeleteuserstory
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deleteuserstory.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deleteuserstory",objectid:objectid}
						data = {"channel": stdout.deleteuserstory.admin,"text":"Request from "+payload.username+" to delete userstory "+objectid,"message":"Request from "+payload.username+" to delete userstory "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deleteuserstory',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deleteuserstory.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deleteuserstory.deleteuserstory process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
						
	robot.router.post '/deleteuserstory', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting userstory';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deleteuserstory.deleteuserstory process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete userstory request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete userstory.';
	
	#delete Bug	
	cmddeletebug = new RegExp('@' + process.env.HUBOT_NAME + ' delete Bug (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeletebug
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deletebug.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deletebug",objectid:objectid}
						data = {"channel": stdout.deletebug.admin,"text":"Request from "+payload.username+" to delete bug "+objectid,"message":"Request from "+payload.username+" to delete bug "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deletebug',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deletebug.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deletebug.deletebug process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
	
	robot.router.post '/deletebug', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting bug';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deletebug.deletebug process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete bug request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete bug.';

	#delete Task
	cmddeletetask = new RegExp('@' + process.env.HUBOT_NAME + ' delete Task (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeletetask
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deletetask.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deletetask",objectid:objectid}
						data = {"channel": stdout.deletetask.admin,"text":"Request from "+payload.username+" to delete task "+objectid,"message":"Request from "+payload.username+" to delete task "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deletetask',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deletetask.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deletetask.deletetask process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
						
	robot.router.post '/deletetask', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting task';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deletetask.deletetask process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete task request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete task.';
				
	#delete Testcase
	cmddeletetestcase = new RegExp('@' + process.env.HUBOT_NAME + ' delete TestCase (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeletetestcase
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deletetestcase.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deletetestcase",objectid:objectid}
						data = {"channel": stdout.deletetestcase.admin,"text":"Request from "+payload.username+" to delete testcase "+objectid,"message":"Request from "+payload.username+" to delete testcase "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deletetestcase',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deletetestcase.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deletetestcase.deletetestcase process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
						
	robot.router.post '/deletetestcase', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting testcase';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deletetestcase.deletetestcase process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete testcase request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete testcase.';

	#delete Release
	cmddeleterelease = new RegExp('@' + process.env.HUBOT_NAME + ' delete Release (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeleterelease
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deleterelease.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deleterelease",objectid:objectid}
						data = {"channel": stdout.deleterelease.admin,"text":"Request from "+payload.username+" to delete release "+objectid,"message":"Request from "+payload.username+" to delete release "+objectid,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deleterelease',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deleterelease.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deleterelease.deleterelease process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)
						
	robot.router.post '/deleterelease', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting release';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deleterelease.deleterelease process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
					if(stdout)
						console.log(stdout)
						robot.messageRoom data_http.userid, stdout; 
						setTimeout (->eindex.passData stdout),1000
						
					if(stderr)
						console.log(stderr)
						robot.messageRoom data_http.userid, stderr;
						setTimeout (->eindex.passData stderr),1000
					
					if(error)
						console.log(error)
						robot.messageRoom data_http.userid, error;
						setTimeout (->eindex.passData error),1000
		else
			dt="Delete release request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete release.';
	
	#delete Iteration
	cmddeleteiteration = new RegExp('@' + process.env.HUBOT_NAME + ' delete Iteration (.*)')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmddeleteiteration
		(res) ->
			objectid=res.match[1]
			readjson.readworkflow_coffee (error,stdout,stderr) ->
				#Action Flow with workflow flag
				if stdout.deleteiteration.workflowflag == true
					#Generate Random Ticket Number
					generate_id.getNextSequence (err,id) ->
						tckid=id
						payload={botname:process.env.HUBOT_NAME,username:res.message.user.name,userid:res.message.user.id,podIp:process.env.MY_POD_IP,"callback_id":"deleteiteration",objectid:objectid}
						data = {"channel": stdout.deleteiteration.admin,"text":"Request from "+payload.username+" to create bitbucket user "+user,"message":"Request from "+payload.username+" to create bitbucket user "+user,attachments: [{text: 'click approve or reject',fallback: 'Yes or No?',callback_id: 'deleteiteration',color: '#3AA3E3',attachment_type: 'default',actions: [{ name: 'Approve', text: 'Approve', type: 'button',"integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Approve",value: tckid}}},{ name: 'Reject', text: 'Reject', type: 'button', "integration": {"url": process.env.APPROVAL_APP_URL,"context": {"action": "Reject",value: tckid}}}]}]}
						options = {
							url: process.env.MATTERMOST_INCOME_URL,
							method: "POST",
							header: {"Content-type":"application/json"},
							json: data
						}
						request.post options, (err,response,body) ->
							console.log response.body
							res.send 'Your request is waiting for approval from '+stdout.deleteiteration.admin
						dataToInsert = {ticketid: tckid, payload: payload, "status":"","approvedby":""}
						#Insert into Mongo with Payload
						generate_id.add_in_mongo dataToInsert
				#Casual workflow
				else
					deleteiteration.deleteiteration process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
						if(stdout)
							console.log(stdout)
							res.send stdout 
							setTimeout (->eindex.passData stdout),1000
							message = res.match[0]
							actionmsg = "jenkins build started"
							statusmsg = "Success"
							eindex.wallData process.env.HUBOT_NAME, message, actionmsg, statusmsg;
							
						if(stderr)
							console.log(stderr)
							res.send stderr
							setTimeout (->eindex.passData stderr),1000
						
						if(error)
							console.log(error)
							res.send error
							setTimeout (->eindex.passData error),1000
	)

	robot.router.post '/deleteiteration', (request, response) ->
		data_http = if request.body.payload? then JSON.parse request.body.payload else request.body
		if data_http.action == "Approve"
			dt='Your request is approved by '+data_http.approver+' for the deleting iteration';
			# Approved Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			objectid = request.body.objectid;
			# Call from create_project file for project creation 
			deleteiteration.deleteiteration process.env.API, process.env.USERNAME, process.env.PASSWORD, objectid, (error,stdout,stderr) ->
				if(stdout)
					console.log(stdout)
					robot.messageRoom data_http.userid, stdout; 
					setTimeout (->eindex.passData stdout),1000
					message = res.match[0]
					actionmsg = "jenkins build started"
					statusmsg = "Success"
					eindex.wallData process.env.HUBOT_NAME, message, actionmsg, statusmsg;
					
				if(stderr)
					console.log(stderr)
					robot.messageRoom data_http.userid, stderr;
					setTimeout (->eindex.passData stderr),1000
				
				if(error)
					console.log(error)
					robot.messageRoom data_http.userid, error;
					setTimeout (->eindex.passData error),1000
		else
			dt="Delete iteration request was rejected by "+data_http.approver
			setTimeout (->eindex.passData dt),1000
			# Rejected Message send to the user chat room
			robot.messageRoom data_http.userid, dt;
			robot.messageRoom data_http.userid, 'Sorry, You are not authorized to delete iteration.';

			
