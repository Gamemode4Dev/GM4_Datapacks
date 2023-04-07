# make item ride the spell trident
# @s = item near spell trident
# at @s
# run from spell_trident/hopper/process

# vfx
particle sculk_charge_pop ~ ~0.2 ~ 0.025 0.025 0.025 0.015 6
playsound minecraft:block.sculk_sensor.clicking_stop neutral @a[distance=..8] ~ ~ ~ 0.7 2

# stop item from being picked up or despawning while riding the spell trident
data modify entity @s Age set value -32768
data modify entity @s PickupDelay set value 32767
data modify entity @s Owner set from entity @e[type=trident,tag=gm4_hy_target,limit=1] Owner

ride @s mount @e[type=trident,tag=gm4_hy_target,limit=1]
tag @s add gm4_hy_passenger_item

# mana cost is equal to stack size
execute store result score $hopper.item_count gm4_hy_data run data get entity @s Item.Count
scoreboard players operation $hopper.items_sucked gm4_hy_data += $hopper.item_count gm4_hy_data
