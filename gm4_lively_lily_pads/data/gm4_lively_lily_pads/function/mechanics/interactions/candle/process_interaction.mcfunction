# @s = interacted gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/interactions/candle/interact_rcd

# store time to check
execute store result score $gametime gm4_llp.data run time query gametime
execute store result score $check_gametime gm4_llp.data run data get entity @s interaction.timestamp 1

# clean
data remove entity @s interaction

# fail if old interaction
execute unless score $gametime gm4_llp.data = $check_gametime gm4_llp.data run return fail

# process
execute align xyz as @e[type=block_display,tag=gm4_llp_candle,dx=0,limit=1] at @s run function gm4_lively_lily_pads:mechanics/interactions/candle/process_display
