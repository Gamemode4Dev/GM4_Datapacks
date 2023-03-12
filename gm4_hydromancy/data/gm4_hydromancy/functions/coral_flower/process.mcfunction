# process coral flowers (30s)
# @s = coral flower
# at @s
# run from slow_clock

#execute positioned ~-5.5 ~-6.5 ~-5.5 as @e[type=tropical_fish,tag=!gm4_hy_tracked_fish,limit=6,dx=10,dy=10,dz=10] run function gm4_hydromancy:coral_flower/fish/tag
execute positioned ~-5 ~5 ~-5 summon marker run function gm4_hydromancy:coral_flower/growth/pick_location
