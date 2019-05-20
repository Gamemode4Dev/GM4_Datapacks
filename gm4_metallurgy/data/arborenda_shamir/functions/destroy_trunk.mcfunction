#@s = gm4_arborenda_trunk aec
#run from pulse_check

#handle branches
scoreboard players add @s gm4_ml_data 1
execute store result score @s[tag=gm4_acacia_feller] gm4_arb_stat run fill ~3 ~1 ~3 ~-3 ~1 ~-3 air replace acacia_log
execute if score @s[tag=gm4_acacia_feller] gm4_arb_stat matches 1.. run function arborenda_shamir:fell_acacia

execute store result score @s[tag=gm4_birch_feller] gm4_arb_stat run fill ~ ~1 ~ ~ ~1 ~ air replace birch_log
execute if score @s[tag=gm4_birch_feller] gm4_arb_stat matches 1.. run function arborenda_shamir:fell_birch

execute store result score @s[tag=gm4_dark_oak_feller] gm4_arb_stat run fill ~3 ~1 ~3 ~-3 ~1 ~-3 air replace dark_oak_log
execute if score @s[tag=gm4_dark_oak_feller] gm4_arb_stat matches 1.. run function arborenda_shamir:fell_dark_oak

execute store result score @s[tag=gm4_jungle_feller,scores={gm4_ml_data=..4}] gm4_arb_stat run fill ~1 ~1 ~1 ~-1 ~1 ~-1 air replace jungle_log
execute store result score @s[tag=gm4_jungle_feller,scores={gm4_ml_data=5..}] gm4_arb_stat run fill ~5 ~1 ~5 ~-5 ~1 ~-5 air replace jungle_log
execute if score @s[tag=gm4_jungle_feller] gm4_arb_stat matches 1.. run function arborenda_shamir:fell_jungle

execute store result score @s[tag=gm4_oak_feller] gm4_arb_stat run fill ~5 ~1 ~5 ~-5 ~1 ~-5 air replace oak_log
execute if score @s[tag=gm4_oak_feller] gm4_arb_stat matches 1.. run function arborenda_shamir:fell_oak

execute store result score @s[tag=gm4_spruce_feller] gm4_arb_stat run fill ~1 ~1 ~1 ~-1 ~1 ~-1 air replace spruce_log
execute if score @s[tag=gm4_spruce_feller] gm4_arb_stat matches 1.. run function arborenda_shamir:fell_spruce

tp @s ~ ~1 ~
