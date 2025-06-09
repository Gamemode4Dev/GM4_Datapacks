# add candle interact logic
# @s = player who wants to add a candle
# at @s
# run from advancement: add_candle_rcd

advancement revoke @s only gm4_lively_lily_pads:add_candle_rcd

# return if adventure
execute if entity @s[gamemode=adventure] run return fail

# store item
data modify storage gm4_llp:temp SelectedItem set from entity @s SelectedItem.id

# string manipulation step 1
execute store result storage gm4_llp:temp str_len int 1 run data get storage gm4_llp:temp SelectedItem

# raycast
scoreboard players reset $minus_one gm4_llp.data
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 10
function gm4_lively_lily_pads:mechanics/interactions/add_candle/ray_init with storage gm4_llp:temp

# minus one on player mainhand if successful
execute if entity @s[gamemode=!creative] if score $minus_one gm4_llp.data matches 1 run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
