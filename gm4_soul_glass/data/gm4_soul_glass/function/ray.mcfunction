# @s = player who placed soul glass
# at @s anchored eyes, then marched forward 0.01 over and over
# run from place_soul_glass and self

execute if block ~ ~ ~ brown_stained_glass \
  align xyz positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,distance=..0.1,tag=gm4_soul_glass,limit=1] \
  summon marker run return run function gm4_soul_glass:init_soul_glass_marker

# loop
scoreboard players remove gm4_ray_counter gm4_count 1
execute if score gm4_ray_counter gm4_count matches 0.. positioned ^ ^ ^0.01 run function gm4_soul_glass:ray
