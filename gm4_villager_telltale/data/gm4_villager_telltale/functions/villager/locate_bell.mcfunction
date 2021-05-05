
# get nbt
data modify storage gm4_villager_telltale:temp/villager NBT set from entity @s
data modify storage gm4_villager_telltale:temp/villager Look set value [0d,0d,0d]
execute unless data storage gm4_villager_telltale:temp/villager NBT.Brain.memories."minecraft:meeting_point" run data remove storage gm4_villager_telltale:temp/villager Look
execute store result storage gm4_villager_telltale:temp/villager Look[0] double 1 run data get storage gm4_villager_telltale:temp/villager NBT.Brain.memories."minecraft:meeting_point".value.pos[0]
execute store result storage gm4_villager_telltale:temp/villager Look[1] double 1 run data get storage gm4_villager_telltale:temp/villager NBT.Brain.memories."minecraft:meeting_point".value.pos[1]
execute store result storage gm4_villager_telltale:temp/villager Look[2] double 1 run data get storage gm4_villager_telltale:temp/villager NBT.Brain.memories."minecraft:meeting_point".value.pos[2]

# check if villager has a job site
tag @s remove gm4_vt_has_job_site
execute if data storage gm4_villager_telltale:temp/villager Look[2] run tag @s add gm4_vt_has_job_site

# show target
execute if entity @s[tag=gm4_vt_has_job_site] run function gm4_villager_telltale:villager/show_target

# look at target
execute if entity @s[tag=gm4_vt_has_job_site] run function gm4_villager_telltale:villager/begin_looking
