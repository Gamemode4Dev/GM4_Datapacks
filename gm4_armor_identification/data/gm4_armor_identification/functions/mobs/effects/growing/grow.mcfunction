# run from mobs/effects/growing/check
# @s = slime/magma cube to grow

# cooldown
scoreboard players set @s gm4_ai_t_hurt 15

# increase size by 1 (up to 4)
execute store result score $cube_size gm4_ai_data run data get entity @s Size
execute if score $cube_size gm4_ai_data matches ..3 store result entity @s Size int 1 run scoreboard players add $cube_size gm4_ai_data 1

# if size reached 4 stop checking until mob is hit again
execute if score $cube_size gm4_ai_data matches 4 run scoreboard players set @s gm4_ai_t_hurt 16
