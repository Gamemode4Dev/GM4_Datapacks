# process coral flowers (30s)
# @s = coral flower
# at @s
# run from coral_flower/clock

execute positioned ~-7.5 ~-1.5 ~-7.5 as @e[type=tropical_fish,tag=!gm4_hy_tracked_fish,limit=6,dx=14,dy=7,dz=14] run function gm4_hydromancy:coral_flower/fish/tag
execute positioned ~-7 ~7 ~-7 summon marker run function gm4_hydromancy:coral_flower/growth/pick_location
