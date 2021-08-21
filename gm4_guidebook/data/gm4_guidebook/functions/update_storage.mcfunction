# updates the storage of modules based on loaded modules
# @s = none
# located at world spawn y=0
# run from init

data modify storage gm4_guidebook:register modules append from entity @e[type=marker,tag=gm4_guide,sort=furthest,limit=1] data
kill @e[type=marker,tag=gm4_guide,sort=furthest,limit=1]
execute if entity @e[type=marker,tag=gm4_guide,limit=1] run function gm4_guidebook:update_storage
