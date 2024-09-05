#run from main
#@s = sneaking players holding a fulcio compass

summon marker ~ ~ ~ {Tags:["gm4_fulcio_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_fulcio_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[type=marker,tag=gm4_fulcio_ray] at @s run function gm4_fulcio_shamir:ray
execute as @e[type=marker,tag=gm4_fulcio_ray] at @s positioned ^ ^ ^-0.1 align xyz if block ~ ~ ~ #minecraft:air run function gm4_fulcio_shamir:create_block
kill @e[type=marker,tag=gm4_fulcio_ray]
