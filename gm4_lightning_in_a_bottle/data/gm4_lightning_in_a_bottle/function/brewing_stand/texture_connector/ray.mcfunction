# @s = player who placed a brewing stand
# at @s anchored eyes, then marched forward 0.01 over and over
# run from brewing_stand/texture_connector/place_brewing_stand and self

execute if block ~ ~ ~ minecraft:brewing_stand \
  align xyz positioned ~0.5 ~1 ~0.5 \
  unless entity @e[type=item_display,distance=..0.1,tag=gm4_lightning_rod_texture_connector,limit=1] \
  summon minecraft:item_display \
  run return run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/initialize

# loop
scoreboard players remove $ray gm4_liab_data 1
execute if score $ray gm4_liab_data matches 0.. positioned ^ ^ ^0.01 run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/ray
