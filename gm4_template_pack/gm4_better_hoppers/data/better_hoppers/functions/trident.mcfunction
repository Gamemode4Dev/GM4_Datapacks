#run from projectile
#@s = trident on a hopper with an empty slot, at @s

scoreboard players set @s gm4_bh_data 0
execute unless score @s gm4_bh_data > #0 gm4_bh_data unless block ~ ~-.1 ~ hopper{Items:[{Slot: 0b}]} run function better_hoppers:trident/slot0
execute unless score @s gm4_bh_data > #0 gm4_bh_data unless block ~ ~-.1 ~ hopper{Items:[{Slot: 1b}]} run function better_hoppers:trident/slot1
execute unless score @s gm4_bh_data > #0 gm4_bh_data unless block ~ ~-.1 ~ hopper{Items:[{Slot: 2b}]} run function better_hoppers:trident/slot2
execute unless score @s gm4_bh_data > #0 gm4_bh_data unless block ~ ~-.1 ~ hopper{Items:[{Slot: 3b}]} run function better_hoppers:trident/slot3
execute unless score @s gm4_bh_data > #0 gm4_bh_data unless block ~ ~-.1 ~ hopper{Items:[{Slot: 4b}]} run function better_hoppers:trident/slot4

