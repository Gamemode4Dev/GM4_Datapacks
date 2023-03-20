# update the color of this fish
# @s = tropical fish
# at @s
# run from fish/tag
# run from fish/discharge

# vfx
particle minecraft:bubble_pop ~ ~ ~ 0.1 0.1 0.1 0.05 3
particle minecraft:bubble ~ ~ ~ 0.1 0.1 0.1 0.05 2
playsound minecraft:block.bubble_column.bubble_pop block @a ~ ~ ~ 1 0.5

# mark next charge milestone to not repeat this function unnecessarily
scoreboard players set @s[scores={gm4_hy_charge=0}] gm4_hy_next_charge_change 1
scoreboard players set @s[scores={gm4_hy_charge=1..32}] gm4_hy_next_charge_change 32
scoreboard players set @s[scores={gm4_hy_charge=33..64}] gm4_hy_next_charge_change 64
scoreboard players set @s[scores={gm4_hy_charge=65..96}] gm4_hy_next_charge_change 96
scoreboard players set @s[scores={gm4_hy_charge=97..128}] gm4_hy_next_charge_change 128
scoreboard players set @s[scores={gm4_hy_charge=129..160}] gm4_hy_next_charge_change 160

# | Update fish color to match its charge
execute store result score $fish_var gm4_hy_data run data get entity @s Variant
# strip color data from var
scoreboard players operation $fish_var gm4_hy_data %= #65536 gm4_hy_data
# get new score based on charge
execute if score @s gm4_hy_charge matches 0 run scoreboard players set $new_color gm4_hy_data 15
execute if score @s gm4_hy_charge matches 1..32 run scoreboard players set $new_color gm4_hy_data 6
execute if score @s gm4_hy_charge matches 33..64 run scoreboard players set $new_color gm4_hy_data 3
execute if score @s gm4_hy_charge matches 65..96 run scoreboard players set $new_color gm4_hy_data 5
execute if score @s gm4_hy_charge matches 97..128 run scoreboard players set $new_color gm4_hy_data 4
execute if score @s gm4_hy_charge matches 129..160 run scoreboard players set $new_color gm4_hy_data 1
execute if score @s gm4_hy_charge matches 161.. run scoreboard players set $new_color gm4_hy_data 14
scoreboard players operation $new_color gm4_hy_data *= #16842752 gm4_hy_data
# apply new color to fish
execute store result entity @s Variant int 1 run scoreboard players operation $fish_var gm4_hy_data += $new_color gm4_hy_data

# mark fish if fully charged
execute if score @s gm4_hy_charge matches 161.. run tag @s add gm4_hy_charged_fish
