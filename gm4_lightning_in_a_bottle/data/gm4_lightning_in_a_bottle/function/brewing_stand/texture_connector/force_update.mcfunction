# forces nearby texture_connectors to update
# @s = player who has placed a lightning rod on a brewing stand
# at @s
# run from advancement place_lightning_rod

# revoke advancement
advancement revoke @s only gm4_lightning_in_a_bottle:place_lightning_rod

# add texture connectors to nearby brewing stands
execute as @e[type=marker,tag=gm4_brewing_stand,distance=..8] at @s if block ~ ~1 ~ #gm4_lightning_in_a_bottle:lightning_rod[facing=up] \
  align xyz unless entity @e[tag=gm4_lightning_rod_texture_connector,dy=0.01,limit=1] run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/summon
