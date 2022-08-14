# demonstrates use of command block tick from lib_forceload
# NOTE: this will only run if #gm4_forceload:command_block_tick is changed to have this function in the "values" instead of in "_example_values"


# this code will catch when a splash or lingering potion is dispensed directly into a block
# with a normal function call, this is not possible
execute as @e[type=potion] run say DETECTED!
