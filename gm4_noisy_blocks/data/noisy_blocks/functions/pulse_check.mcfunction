#This function runs every tick. It plays a sound for anyone with an interaction score of 1 and immediately resets their score.
execute at @a[scores={gm4_nbk_crafting=1..}] run playsound minecraft:entity.shulker.close block @a[distance=..8] ~ ~ ~ 0.5 1.4
scoreboard players reset @a[scores={gm4_nbk_crafting=1..}] gm4_nbk_crafting
execute at @a[scores={gm4_nbk_furnace=1..}] run playsound minecraft:block.stone.place block @a[distance=..8] ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_furnace=1..}] gm4_nbk_furnace
execute at @a[scores={gm4_nbk_beacon=1..}] run playsound minecraft:block.stone.place block @a[distance=..8] ~ ~ ~ 0.5 0.5
scoreboard players reset @a[scores={gm4_nbk_beacon=1..}] gm4_nbk_beacon
execute at @a[scores={gm4_nbk_loom=1..}] run playsound minecraft:entity.horse.armor block @a[distance=..8] ~ ~ ~ 0.25 1.8
scoreboard players reset @a[scores={gm4_nbk_loom=1..}] gm4_nbk_loom
execute at @a[scores={gm4_nbk_brewing=1..}] run playsound minecraft:block.end_portal_frame.fill block @a[distance=..8] ~ ~ ~ 0.5 1.1
scoreboard players reset @a[scores={gm4_nbk_brewing=1..}] gm4_nbk_brewing
execute at @a[scores={gm4_nbk_smoker=1..}] run playsound minecraft:entity.shulker.hurt_closed block @a[distance=..8] ~ ~ ~ 0.25 1.4
scoreboard players reset @a[scores={gm4_nbk_smoker=1..}] gm4_nbk_smoker
execute at @a[scores={gm4_nbk_blast=1..}] run playsound minecraft:block.stone.place block @a[distance=..8] ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_blast=1..}] gm4_nbk_blast
execute at @a[scores={gm4_nbk_cartog=1..}] run playsound minecraft:block.wood.place block @a[distance=..8] ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_cartog=1..}] gm4_nbk_cartog
execute at @a[scores={gm4_nbk_stonecut=1..}] run playsound minecraft:entity.shulker.hurt_closed block @a[distance=..8] ~ ~ ~ 0.25 1.4
scoreboard players reset @a[scores={gm4_nbk_stonecut=1..}] gm4_nbk_stonecut
execute at @a[scores={gm4_nbk_dropper=1..}] run playsound minecraft:block.stone.place block @a[distance=..8] ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_dropper=1..}] gm4_nbk_dropper
execute at @a[scores={gm4_nbk_disp=1..}] run playsound minecraft:block.stone.place block @a[distance=..8] ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_disp=1..}] gm4_nbk_disp
execute at @a[scores={gm4_nbk_lectern=1..}] run playsound minecraft:item.book.page_turn block @a[distance=..8] ~ ~ ~ 1 1.4
scoreboard players reset @a[scores={gm4_nbk_lectern=1..}] gm4_nbk_lectern
execute at @a[scores={gm4_nbk_hopper=1..}] run playsound minecraft:block.stone.place block @a[distance=..8] ~ ~ ~ 0.5 0.6
scoreboard players reset @a[scores={gm4_nbk_hopper=1..}] gm4_nbk_hopper
execute at @a[scores={gm4_nbk_campfire=1..}] run playsound minecraft:entity.item.pickup block @a[distance=..8] ~ ~ ~ 0.5 1.6
scoreboard players reset @a[scores={gm4_nbk_campfire=1..}] gm4_nbk_campfire