#-------------------------------------------------------------------------------
# Copyright 2018 Cognizant Technology Solutions
# 
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License.  You may obtain a copy
# of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.
#-------------------------------------------------------------------------------

get_bot_name = require('./getbots.js');
module.exports = (robot) ->
	cmd=new RegExp('@'+process.env.HUBOT_NAME+' getBots')
	robot.listen(
		(message) ->
			return unless message.text
			message.text.match cmd
		(msg) ->
			get_bot_name.get_bots (error, stdout, stderr) ->
				if error == "null"
					msg.send stdout;
					setTimeout (->index.passData stdout),1000
				else
					msg.send error;
					setTimeout (->index.passData error),1000
	)
