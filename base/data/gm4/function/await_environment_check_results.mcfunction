# Waits until all environment checks have returned their results
# run from post_load

# Peek if any environment checks are still pending (passed:-1), if so, continue waiting
execute if data storage gm4:log environment_checks[{result:{passed:-1}}] run return run schedule function gm4:await_environment_check_results 1t

# TODO print out probable_cause from each echeck (in result.probable cause)
say all checks complete!
