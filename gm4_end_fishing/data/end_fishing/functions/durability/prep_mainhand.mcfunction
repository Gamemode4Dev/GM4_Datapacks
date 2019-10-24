#@s = player who reeled in the armor stand w/ fishing rod in mainhand
#run from reel_in/reel_rod and reel_in/reel_loot

scoreboard players set durability gm4_ef_data 1
tag @s add gm4_ef_durability
execute store result score @s gm4_ef_data run data get entity @s SelectedItem.tag.Damage
tag @s add gm4_ef_durability_main
