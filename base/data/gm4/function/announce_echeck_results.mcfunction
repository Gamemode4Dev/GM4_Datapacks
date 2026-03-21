# Copies the results of environment checks into the log queue to prepare for printing to chat
# @s = none
# at unspecified
# run from await_echeck_results

# if no check failed, no need to print
execute unless data storage gm4:log echecks[{result:{passed:0}}] unless data storage gm4:log echecks[{result:{passed:-1}}] run return 0

# copy results into queue, KEEP VERSION IN echecks, SO WE CAN INSPECT IT FOR DEBUGGING
data modify storage gm4:log queue set from storage gm4:log echecks

# add extra text around warnings
data modify storage gm4:log queue prepend value {type:"text",message:{"text":"[GM4]: Some environment checks have not succeeded:","color":"#4AA0C7"}}
data modify storage gm4:log queue append value {type:"text",message:{"text":"[GM4]: This may lead to unintended behavior.","color":"#4AA0C7"}}

# start announcing
function gm4:log_start
