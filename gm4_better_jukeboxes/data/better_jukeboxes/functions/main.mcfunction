execute as @e[type=item,nbt={Item:{id:"minecraft:redstone_block",Count:1b},OnGround:1b}] at @s if block ~ ~-1 ~ jukebox align xyz positioned ~0.5 ~-0.5 ~0.5 unless entity @e[tag=gm4_better_jukebox,distance=..0.5] run function better_jukeboxes:create
execute as @e[type=armor_stand,tag=gm4_better_jukebox] at @s positioned ~ ~0.45 ~ run function better_jukeboxes:update
