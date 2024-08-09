# move sword to correct location
# @s = sword item_display
# at player rotated ~x ~
# run from armor/augment/type/sword_ring/find_sword

# move sword to correct position
tp @s ~ ~ ~ facing ^-1 ^ ^

# check if material still matches
execute store result score $sword_material gm4_aa_data run data get storage gm4_augmented_armor:temp sword_ring.data[0].components."minecraft:custom_data".gm4_augmented_armor.material
execute unless score @s gm4_aa_data = $sword_material gm4_aa_data run function gm4_augmented_armor:armor/augment/type/sword_ring/change_material

# reset the scales 
execute store result entity @s transformation.scale[0] float 0.003 run data get storage gm4_augmented_armor:temp sword_ring.scale 100
execute store result entity @s transformation.scale[1] float 0.003 run data get storage gm4_augmented_armor:temp sword_ring.scale 100
execute store result entity @s transformation.scale[2] float 0.003 run data get storage gm4_augmented_armor:temp sword_ring.scale 100

# remove tags so this sword is not processed anymore this tick
tag @s remove gm4_aa_sword_ring.current_sword
tag @s remove gm4_aa_sword_ring.check_sword

# keep this sword around until next tick
scoreboard players operation @s gm4_aa_keep_tick = $check.sword_ring gm4_aa_keep_tick

# damage entities the sword contacts
scoreboard players set $damage_dealt gm4_aa_data 0
execute if score $sword_material gm4_aa_data matches 1 at @s positioned ~-.15 ~-.15 ~-.15 as @e[tag=!gm4_aa_self,dx=0,dy=0,dz=0,predicate=gm4_augmented_armor:technical/pvp_able,team=!gm4_aa_team_check,tag=!smithed.strict] positioned ~-.7 ~-.7 ~-.7 if entity @s[dx=0,dy=0,dz=0] store success score $damage_dealt gm4_aa_data run damage @s 2 player_attack by @p[tag=gm4_aa_self]
execute if score $sword_material gm4_aa_data matches 2 at @s positioned ~-.15 ~-.15 ~-.15 as @e[tag=!gm4_aa_self,dx=0,dy=0,dz=0,predicate=gm4_augmented_armor:technical/pvp_able,team=!gm4_aa_team_check,tag=!smithed.strict] positioned ~-.7 ~-.7 ~-.7 if entity @s[dx=0,dy=0,dz=0] store success score $damage_dealt gm4_aa_data run damage @s 3 player_attack by @p[tag=gm4_aa_self]
execute if score $sword_material gm4_aa_data matches 3..4 at @s positioned ~-.15 ~-.15 ~-.15 as @e[tag=!gm4_aa_self,dx=0,dy=0,dz=0,predicate=gm4_augmented_armor:technical/pvp_able,team=!gm4_aa_team_check,tag=!smithed.strict] positioned ~-.7 ~-.7 ~-.7 if entity @s[dx=0,dy=0,dz=0] store success score $damage_dealt gm4_aa_data run damage @s 4 player_attack by @p[tag=gm4_aa_self]
execute if score $sword_material gm4_aa_data matches 5..6 at @s positioned ~-.15 ~-.15 ~-.15 as @e[tag=!gm4_aa_self,dx=0,dy=0,dz=0,predicate=gm4_augmented_armor:technical/pvp_able,team=!gm4_aa_team_check,tag=!smithed.strict] positioned ~-.7 ~-.7 ~-.7 if entity @s[dx=0,dy=0,dz=0] store success score $damage_dealt gm4_aa_data run damage @s 5 player_attack by @p[tag=gm4_aa_self]
execute if score $damage_dealt gm4_aa_data matches 1 at @s run function gm4_augmented_armor:armor/augment/type/sword_ring/damage_dealt/run
