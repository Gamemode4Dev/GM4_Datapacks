# check if SCUBA gear is in inventory
execute as @a[gamemode=!spectator,predicate=gm4_scuba_gear:scuba_gear_equipped] run function gm4_scuba_gear:equipped

# reset scores and tags
scoreboard players reset @a gm4_sg_swim
execute as @a[tag=gm4_in_water] run function gm4_scuba_gear:check_gear

schedule function gm4_scuba_gear:main 16t
