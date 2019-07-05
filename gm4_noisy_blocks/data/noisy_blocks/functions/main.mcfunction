#This function currently runs every tick. It plays a sound for anyone with an interaction score of 1 and immediately resets their score.
execute as @a[scores={gm4_nbk_crafting=1..}] at @s run playsound minecraft:entity.shulker.close block @s ~ ~ ~ 0.5 1.4
scoreboard players reset @a[scores={gm4_nbk_crafting=1..}] gm4_nbk_crafting
execute as @a[scores={gm4_nbk_furnace=1..}] at @s run playsound minecraft:block.stone.place block @s ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_furnace=1..}] gm4_nbk_furnace
execute as @a[scores={gm4_nbk_beacon=1..}] at @s run playsound minecraft:block.stone.place block @s ~ ~ ~ 0.5 0.5
scoreboard players reset @a[scores={gm4_nbk_beacon=1..}] gm4_nbk_beacon
execute as @a[scores={gm4_nbk_loom=1..}] at @s run playsound minecraft:entity.horse.armor block @s ~ ~ ~ 0.25 1.8
scoreboard players reset @a[scores={gm4_nbk_loom=1..}] gm4_nbk_loom
execute as @a[scores={gm4_nbk_brewing=1..}] at @s run playsound minecraft:block.end_portal_frame.fill block @s ~ ~ ~ 0.5 1.1
scoreboard players reset @a[scores={gm4_nbk_brewing=1..}] gm4_nbk_brewing
execute as @a[scores={gm4_nbk_smoker=1..}] at @s run playsound minecraft:entity.shulker.hurt_closed block @s ~ ~ ~ 0.25 1.4
scoreboard players reset @a[scores={gm4_nbk_smoker=1..}] gm4_nbk_smoker
execute as @a[scores={gm4_nbk_blast=1..}] at @s run playsound minecraft:block.stone.place block @s ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_blast=1..}] gm4_nbk_blast
execute as @a[scores={gm4_nbk_cartog=1..}] at @s run playsound minecraft:block.wood.place block @s ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_cartog=1..}] gm4_nbk_cartog
execute as @a[scores={gm4_nbk_stonecut=1..}] at @s run playsound minecraft:entity.shulker.hurt_closed block @s ~ ~ ~ 0.25 1.4
scoreboard players reset @a[scores={gm4_nbk_stonecut=1..}] gm4_nbk_stonecut
execute as @a[scores={gm4_nbk_dropper=1..}] at @s run playsound minecraft:block.stone.place block @s ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_dropper=1..}] gm4_nbk_dropper
execute as @a[scores={gm4_nbk_disp=1..}] at @s run playsound minecraft:block.stone.place block @s ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_disp=1..}] gm4_nbk_disp
execute as @a[scores={gm4_nbk_lectern=1..}] at @s run playsound minecraft:ui.toast.in block @s ~ ~ ~ 2 1.3
scoreboard players reset @a[scores={gm4_nbk_lectern=1..}] gm4_nbk_lectern
execute as @a[scores={gm4_nbk_hopper=1..}] at @s run playsound minecraft:block.stone.place block @s ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_hopper=1..}] gm4_nbk_hopper
execute as @a[scores={gm4_nbk_campfire=1..}] at @s run playsound minecraft:entity.item.pickup block @s ~ ~ ~ 0.5 1.6
scoreboard players reset @a[scores={gm4_nbk_campfire=1..}] gm4_nbk_campfire