# updates the storage of modules based on loaded modules
# @s = none
# located at world spawn y=0
# run from init

# add the last module to the pre-analyze storage (this way we can take from the last index of this storage when moving to permanent storage)
data modify storage gm4_guidebook:pre_analyze modules append from entity @e[type=marker,tag=gm4_guide,sort=furthest,limit=1] data
kill @e[type=marker,tag=gm4_guide,sort=furthest,limit=1]

# loop for each module
execute if entity @e[type=marker,tag=gm4_guide,limit=1] run function gm4_guidebook:analyze_storage/get_modules
