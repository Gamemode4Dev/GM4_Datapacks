# creates a trapped sign marker
# @s = raycast marker
# located at the center of the placed sign
# run from place_trapped_sign

summon marker ~ ~ ~ {Tags:["gm4_trapped_sign","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_trapped_sign"'}
scoreboard players set @e[type=marker,tag=gm4_trapped_sign,tag=gm4_new_machine,distance=..0.1,limit=1] gm4_entity_version 1

function gm4_trapped_signs:machine/assign_tag

tag @e[type=marker,distance=..0.1] remove gm4_new_machine
kill @s
