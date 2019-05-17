#run at 20hz from metallurgy:pulse_check when any player is holding an arborenda axe

#look for players who have used an axe and have the arborenda shamir
execute as @a[tag=gm4_has_arborenda] at @s if score @s gm4_use_axe_dia matches 1.. run function arborenda_shamir:chop
execute as @a[tag=gm4_has_arborenda] at @s if score @s gm4_use_axe_gol matches 1.. run function arborenda_shamir:chop
execute as @a[tag=gm4_has_arborenda] at @s if score @s gm4_use_axe_iro matches 1.. run function arborenda_shamir:chop
execute as @a[tag=gm4_has_arborenda] at @s if score @s gm4_use_axe_sto matches 1.. run function arborenda_shamir:chop
execute as @a[tag=gm4_has_arborenda] at @s if score @s gm4_use_axe_woo matches 1.. run function arborenda_shamir:chop
scoreboard players set @a[scores={gm4_use_axe_dia=1..}] gm4_use_axe_dia 0
scoreboard players set @a[scores={gm4_use_axe_gol=1..}] gm4_use_axe_gol 0
scoreboard players set @a[scores={gm4_use_axe_iro=1..}] gm4_use_axe_iro 0
scoreboard players set @a[scores={gm4_use_axe_sto=1..}] gm4_use_axe_sto 0
scoreboard players set @a[scores={gm4_use_axe_woo=1..}] gm4_use_axe_woo 0

#process feller aecs
execute as @e[type=area_effect_cloud,tag=gm4_arborenda_trunk] at @s run function arborenda_shamir:destroy_trunk
