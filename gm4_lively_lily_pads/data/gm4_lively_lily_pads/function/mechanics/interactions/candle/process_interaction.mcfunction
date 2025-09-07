# @s = interacted gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/interactions/candle/interact_rcd

# fail if different gametime or different player
execute store result score $check_gametime gm4_llp.data run data get entity @s interaction.timestamp 1
execute unless score $gametime gm4_llp.data = $check_gametime gm4_llp.data run return run data remove entity @s interaction

execute store success score $different_UUID gm4_llp.data run data modify storage gm4_llp:temp UUID set from entity @s interaction.player
execute if score $different_UUID gm4_llp.data matches 1 run return fail

# clean
data remove entity @s interaction

# fail if adventure
execute if score $adventure gm4_llp.data matches 1 run return run scoreboard players reset $adventure gm4_llp.data

# process
execute align xyz as @e[type=block_display,tag=gm4_llp_candle,dx=0,limit=1] at @s run function gm4_lively_lily_pads:mechanics/interactions/candle/process_display
