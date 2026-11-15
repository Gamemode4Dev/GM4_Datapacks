# Extend the swing's length
# @s = Item display, swing main body
# at @s
# run from gm4_swings:interactions/interact/on_interaction

# don't extend if there's a block below the seat
execute if score @s gm4_swings.length matches ..1 run return fail
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
execute at @e[tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..10,limit=1,type=minecraft:item_display] if block ~ ~-1 ~ #minecraft:blocks_motion run return fail

# don't shorten ticking swings
execute if entity @s[tag=gm4_swings.ticking_swing] run return fail

# swing arm
swing @n[type=minecraft:player,tag=gm4_swings.interacter,distance=..10] mainhand

execute store result storage gm4_swings:data length int 1 run scoreboard players add @s gm4_swings.length 1
function gm4_swings:swing/update_length with storage gm4_swings:data

# funny little sound
playsound minecraft:item.lead.tied block @a ~ ~ ~ 0.5 1.5
playsound minecraft:item.lead.break block @a ~ ~ ~ 0.5 1
