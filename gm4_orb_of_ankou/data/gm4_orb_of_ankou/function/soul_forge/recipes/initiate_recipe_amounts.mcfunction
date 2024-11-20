# no @s
# at world spawn
# called by init

# initialise fixed values
scoreboard players set modulo_1 gm4_oa_forge 64
scoreboard players set modulo_2 gm4_oa_forge 14
scoreboard players set divider gm4_oa_forge 17

# copy seed to scoreboard
execute store result score seed gm4_oa_forge run seed

# set blaze powder and flowstone dust to a digit of the seed
scoreboard players operation required_blaze_powder gm4_oa_forge = seed gm4_oa_forge
scoreboard players operation required_blaze_powder gm4_oa_forge /= divider gm4_oa_forge
scoreboard players operation required_glowstone_dust gm4_oa_forge = required_blaze_powder gm4_oa_forge
scoreboard players operation required_glowstone_dust gm4_oa_forge /= divider gm4_oa_forge

scoreboard players operation required_ghast_tears gm4_oa_forge = required_glowstone_dust gm4_oa_forge
scoreboard players operation required_ghast_tears gm4_oa_forge /= divider gm4_oa_forge
scoreboard players operation required_wither_roses gm4_oa_forge = required_ghast_tears gm4_oa_forge
scoreboard players operation required_wither_roses gm4_oa_forge /= divider gm4_oa_forge

# scale down blaze powder and glowstone dust to 1-64 (mod64):
scoreboard players operation required_blaze_powder gm4_oa_forge %= modulo_1 gm4_oa_forge
scoreboard players operation required_glowstone_dust gm4_oa_forge %= modulo_1 gm4_oa_forge
scoreboard players add required_blaze_powder gm4_oa_forge 1
scoreboard players add required_glowstone_dust gm4_oa_forge 1

# scale down ghost tears and wither roses to 3-16 (mod14 + 2)
scoreboard players operation required_ghast_tears gm4_oa_forge %= modulo_2 gm4_oa_forge
scoreboard players operation required_wither_roses gm4_oa_forge %= modulo_2 gm4_oa_forge
scoreboard players add required_ghast_tears gm4_oa_forge 3
scoreboard players add required_wither_roses gm4_oa_forge 3

# store required values in individual scoreboards
scoreboard players operation required gm4_oa_powder = required_blaze_powder gm4_oa_forge
scoreboard players operation required gm4_oa_glowstone = required_glowstone_dust gm4_oa_forge
scoreboard players operation required gm4_oa_tears = required_ghast_tears gm4_oa_forge
scoreboard players operation required gm4_oa_roses = required_wither_roses gm4_oa_forge
