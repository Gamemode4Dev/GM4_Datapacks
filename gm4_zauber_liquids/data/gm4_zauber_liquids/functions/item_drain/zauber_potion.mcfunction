# run from gm4_zauber_liquids:item_drain
# @s = tank being processed

execute store result score $item_value gm4_lt_value run data get storage gm4_liquid_tanks:temp/tank input_slot.tag.gm4_zauber_cauldrons.bottle.sips 1
# if not a soulution, sips path won't exist, so set value to 1 from 0
execute if score $item_value gm4_lt_value matches 0 run scoreboard players set $item_value gm4_lt_value 1
data merge storage gm4_liquid_tanks:temp/tank {output:{id:"glass_bottle"}}
function gm4_liquid_tanks:smart_item_drain
tag @s add gm4_lt_drain
