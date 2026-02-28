# @s = player near a sneaking player holding flower
# at @s
# run from transferring

# tag player, for selection in death message of donor
tag @s add gm4_sh_recipient

# run donor transfer
execute as @p[tag=gm4_sh_donor,distance=..3] at @s run function gm4_sweethearts:transfer_donor

# calculate amount of max_health to remove to get to current health
execute store result score $remove_health gm4_sh_data run attribute @s minecraft:max_health get
scoreboard players operation $remove_health gm4_sh_data -= @s gm4_sh_health

# lower player's max health to their current health
execute if score $remove_health gm4_sh_data matches 512.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_512 -512 add_value
execute if score $remove_health gm4_sh_data matches 512.. run scoreboard players remove $remove_health gm4_sh_data 512
execute if score $remove_health gm4_sh_data matches 256.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_256 -256 add_value
execute if score $remove_health gm4_sh_data matches 256.. run scoreboard players remove $remove_health gm4_sh_data 256
execute if score $remove_health gm4_sh_data matches 128.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_128 -128 add_value
execute if score $remove_health gm4_sh_data matches 128.. run scoreboard players remove $remove_health gm4_sh_data 128
execute if score $remove_health gm4_sh_data matches 64.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_64 -64 add_value
execute if score $remove_health gm4_sh_data matches 64.. run scoreboard players remove $remove_health gm4_sh_data 64
execute if score $remove_health gm4_sh_data matches 32.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_32 -32 add_value
execute if score $remove_health gm4_sh_data matches 32.. run scoreboard players remove $remove_health gm4_sh_data 32
execute if score $remove_health gm4_sh_data matches 16.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_16 -16 add_value
execute if score $remove_health gm4_sh_data matches 16.. run scoreboard players remove $remove_health gm4_sh_data 16
execute if score $remove_health gm4_sh_data matches 8.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_8 -8 add_value
execute if score $remove_health gm4_sh_data matches 8.. run scoreboard players remove $remove_health gm4_sh_data 8
execute if score $remove_health gm4_sh_data matches 4.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_4 -4 add_value
execute if score $remove_health gm4_sh_data matches 4.. run scoreboard players remove $remove_health gm4_sh_data 4
execute if score $remove_health gm4_sh_data matches 2.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_2 -2 add_value
execute if score $remove_health gm4_sh_data matches 2.. run scoreboard players remove $remove_health gm4_sh_data 2
execute if score $remove_health gm4_sh_data matches 1.. run attribute @s minecraft:max_health modifier add gm4_sweethearts:health_remove_1 -1 add_value
execute if score $remove_health gm4_sh_data matches 1.. run scoreboard players remove $remove_health gm4_sh_data 1

# heal player
attribute @s minecraft:max_health modifier add gm4_sweethearts:health_add_1 1 add_value
effect give @s minecraft:instant_health 1 0 true

# revert max health
tag @s add gm4_sh_revert_health
schedule function gm4_sweethearts:delayed_revert 1t

# visuals
particle heart ~ ~2 ~ 0.2 0.2 0.2 1 2

tag @s remove gm4_sh_recipient
