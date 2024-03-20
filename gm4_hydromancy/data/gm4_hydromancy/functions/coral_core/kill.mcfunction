# kill coral core if it is destroyed, release heart of the sea
# @s = coral core
# at @s positioned ~ ~-.4 ~
# run from coral_core/submain

# store mana in item, then calculate percentage
execute store result storage gm4_hydromancy:temp stored_mana int 1 run scoreboard players get @s gm4_hy_charge
scoreboard players operation @s gm4_hy_charge *= #5 gm4_hy_data

# spawn item
loot spawn ~ ~ ~ loot gm4_hydromancy:mana_stone
data remove storage gm4_hydromancy:temp stored_mana

# vfx
particle bubble_pop ~ ~0.15 ~ 0.2 0.35 0.2 0.05 24
playsound minecraft:block.beehive.exit block @a ~ ~ ~ 1 0.7

# check vine connection to kill it if there is no other core nearby
execute positioned ~-7.5 ~-1.1 ~-7.5 run function gm4_hydromancy:coral_vine/check_connection

# remove entities
execute align xyz run kill @e[type=block_display,tag=gm4_hy_coral_core.charge_display,dx=0,dy=0,dz=0]
kill @s
