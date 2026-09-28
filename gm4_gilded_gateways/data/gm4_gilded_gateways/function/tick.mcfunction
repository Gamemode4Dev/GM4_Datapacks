schedule function gm4_gilded_gateways:tick 1t

execute in minecraft:the_end positioned 0 128 0 \
  as @e[type=marker,tag=gm4_gilded_gateways.gateway,distance=..200] at @s \
  if data block ~ ~ ~ exit_portal run function gm4_gilded_gateways:link
