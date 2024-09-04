# activate or spawn a totem
# @s = player that got the kill
# at @s
# run from armor/check_augment/killing

# if there's no totem nearby spawn a new one and start the clock
execute unless score $keep_tick.totem gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/totem 1t
execute unless entity @e[type=armor_stand,tag=gm4_aa_totem,distance=..18,limit=1] run summon armor_stand ~ ~1.2 ~ {Silent:1b,Invulnerable:1b,NoBasePlate:1b,Motion:[0.0,0.05,0.0],Tags:["gm4_aa_totem","smithed.entity","smithed.strict"],Pose:{LeftLeg:[0f,0f,11f],RightLeg:[0f,0f,348f],Head:[179f,0f,0f]},DisabledSlots:4144959,Passengers:[{id:"minecraft:block_display",Tags:["gm4_aa_totem_display","smithed.entity","smithed.strict"],block_state:{Name:"minecraft:oak_fence",Properties:{north:"false",south:"false",east:"false",west:"false"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-1.4825f,-0.5f],scale:[1f,1f,1f]}}],ArmorItems:[{},{},{},{id:"minecraft:beacon",count:1}]}

# check which effect should be applied
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.freezing
execute if score $level gm4_aa_data matches 2 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.haste
execute if score $level gm4_aa_data matches 3 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.healing
execute if score $level gm4_aa_data matches 4 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.strength
