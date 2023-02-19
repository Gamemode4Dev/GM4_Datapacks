# marks the box with a hotswapper machine marker
# @s = player that placed a hotswapper
# at the box they placed
# run from gm4_hotswap_hotbars:place_hotswapper/verify_contents

# update box
scoreboard players set $found gm4_hh_data 1
data modify block ~ ~ ~ CustomName set value '{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'

# summon marker
summon marker ~ ~ ~ {CustomName:'"gm4_hotswapper"',Tags:["gm4_hotswapper","gm4_machine_marker","gm4_new_machine"]}
data remove storage gm4_hotswap_hotbars:temp item_data.BlockEntityTag
data modify entity @e[type=marker,tag=gm4_new_machine,distance=..0.1,limit=1] data.gm4_hotswap_hotbars.item_data set from storage gm4_hotswap_hotbars:temp item_data
scoreboard players set @e[type=marker,tag=gm4_new_machine,distance=..0.1,limit=1] gm4_entity_version 1
tag @e[type=marker,distance=..0.1] remove gm4_new_machine
