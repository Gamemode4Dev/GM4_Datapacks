# summons sg_furnace marker
# @s = player who placed the block
# located at the center of the block to be placed
# run from gm4_soul_glass:relocate/check_furnace

summon marker ~ ~ ~ {CustomName:'"gm4_sg_furnace"',Tags:["gm4_sg_furnace","smithed.entity","smithed.strict","gm4_new_machine"]}
scoreboard players set @e[type=marker,tag=gm4_new_machine,distance=..0.1] gm4_entity_version 1
tag @e[type=marker,distance=..0.1] remove gm4_new_machine
