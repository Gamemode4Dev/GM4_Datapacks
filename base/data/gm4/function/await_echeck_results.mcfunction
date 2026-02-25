# Waits until all environment checks have returned their results
# run from post_load

# maintain timeout timer
scoreboard players remove $echeck_timeout gm4_data 1
execute if score $echeck_timeout gm4_data matches ..0 run return run function gm4:announce_echeck_results

# Peek if any environment checks are still pending (passed:-1), if so, continue waiting
execute if data storage gm4:log echecks[{result:{passed:-1}}] run return run schedule function gm4:await_echeck_results 1t

# all test have returned, print to chat
function gm4:announce_echeck_results
