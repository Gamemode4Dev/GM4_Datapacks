# prime delayed damage on this entity
# @s = entity being hit with delay
# at @s
# run from weapon/modifier/delay/activate

# prime bomb timer
tag @s add gm4_cd_delay_active

# prime bomb level
execute if score $level gm4_ce_data matches 1 run tag @s add gm4_cd_delay_lvl_1
execute if score $level gm4_ce_data matches 2 run tag @s add gm4_cd_delay_lvl_2
execute if score $level gm4_ce_data matches 3 run tag @s add gm4_cd_delay_lvl_3

# particles and sound
execute anchored eyes run particle minecraft:cloud ^ ^ ^ 0.1 0.1 0.1 0 3
playsound minecraft:block.bell.use player @a ~ ~ ~ 0.4 2
