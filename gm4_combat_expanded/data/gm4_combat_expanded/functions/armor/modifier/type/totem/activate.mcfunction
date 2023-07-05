# activate or spawn a totem
# @s = player that got the kill
# at @s
# run from armor/check_modifier/killing

# if there's no totem nearby spawn a new one and start the clock
execute unless entity @e[type=armor_stand,tag=gm4_ce_totem,distance=..12,limit=1] run schedule function gm4_combat_expanded:armor/modifier/type/totem/clock 1t
execute unless entity @e[type=armor_stand,tag=gm4_ce_totem,distance=..12,limit=1] run summon armor_stand ~ ~1.2 ~ {Silent:1b,Invulnerable:1b,NoBasePlate:1b,Motion:[0.0,0.05,0.0],Tags:["gm4_ce_totem","smithed.entity"],Pose:{LeftLeg:[0f,0f,11f],RightLeg:[0f,0f,348f],Head:[180f,0f,0f]},DisabledSlots:4144959,Passengers:[{id:"minecraft:item_display",Tags:["gm4_ce_totem_display","smithed.entity"],item:{id:"minecraft:black_terracotta",Count:1b}}],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:851968}}},{id:"minecraft:black_concrete",Count:1b}]}

# check which effect should be applied
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 as @e[type=armor_stand,tag=gm4_ce_totem,distance=..12,limit=1,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/totem/regeneration
execute if score $level gm4_ce_data matches 2 as @e[type=armor_stand,tag=gm4_ce_totem,distance=..12,limit=1,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/totem/resistance
execute if score $level gm4_ce_data matches 3 as @e[type=armor_stand,tag=gm4_ce_totem,distance=..12,limit=1,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/totem/speed
execute if score $level gm4_ce_data matches 4 as @e[type=armor_stand,tag=gm4_ce_totem,distance=..12,limit=1,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/totem/strength
