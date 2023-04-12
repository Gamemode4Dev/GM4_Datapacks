# store blocks on trident
# @s = spell trident
# at @s
# run from spell_trident/builder/initialize

summon item ~ ~ ~ {Tags:["gm4_hy_builder.stored_blocks","gm4_hy_builder.new_blocks"],Age:-32768,PickupDelay:32767,Item:{id:"minecraft:stone",Count:1b}}
ride @e[type=item,tag=gm4_hy_builder.new_blocks,limit=1] mount @s
execute on passengers run function gm4_hydromancy:spell_trident/builder/on_throw/init_blocks
