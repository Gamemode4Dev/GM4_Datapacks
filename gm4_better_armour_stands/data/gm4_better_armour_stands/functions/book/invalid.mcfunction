# @s = armor_stand to be modified
# at @s
# run from book/process

particle minecraft:block_marker minecraft:barrier ~ ~1 ~ 0 0 0 0 1
playsound minecraft:entity.villager.no block @p[tag=gm4_bas_active] ~ ~ ~ .5 2

title @p[tag=gm4_bas_active] actionbar {"translate": "%1$s%3427655$s","with": ["Unknown code",{"translate": "tooltip.gm4.better_armour_stands.invalid_code"}]}
