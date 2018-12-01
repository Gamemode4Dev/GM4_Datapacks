#@s = @e[tag=alchemical_crafter] with recharge altar multi-block structure
#Run from recipe_validity_check

#slow timer
scoreboard players add @s gm4_ee_time 1
execute if score @s gm4_ee_time matches 8.. run function equivalent_exchange:recharge/slow_timer

execute as @a[distance=..5] at @s run function equivalent_exchange:block_handling/charge_report_ray

tag @s add gm4_ee_charge_stone

#charge with xp levels
execute store result score @s gm4_ee_charge run data get block ~ ~ ~ Items[0].tag.gm4_transmutation_charge

execute unless score @s gm4_ee_charge matches 100.. as @a[distance=..4,scores={gm4_ee_sneak=1..},level=30..] at @s run function equivalent_exchange:recharge/consume_xp

tag @s remove gm4_ee_charge_stone