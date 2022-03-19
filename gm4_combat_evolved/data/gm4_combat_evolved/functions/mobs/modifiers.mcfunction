# run from mobs/MOB
# @s = mobs that can be buffed
# at @s

# biome specific modifiers for any mob
execute if predicate gm4_combat_evolved:mobs/modifiers/dark run scoreboard players add $mob_stats gm4_ce_data 3
execute if predicate gm4_combat_evolved:mobs/modifiers/snowy run scoreboard players add $mob_health gm4_ce_data 4
execute if predicate gm4_combat_evolved:mobs/modifiers/snowy run attribute @s generic.movement_speed modifier add 8b68cb8f-b3ac-489b-bb24-ed6cca2fcacf "gm4_ce_modifier_snowy" -0.15 multiply_base
execute if predicate gm4_combat_evolved:mobs/modifiers/mountainous run scoreboard players add $mob_damage gm4_ce_data 2
execute if predicate gm4_combat_evolved:mobs/modifiers/burned run scoreboard players add $mob_speed gm4_ce_data 3
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run attribute @s generic.attack_damage modifier add 6cc324d6-32af-49cb-a3d0-c7c9982cdb65 "gm4_ce_modifier_toxic" -0.25 multiply
execute if predicate gm4_combat_evolved:mobs/modifiers/deep run scoreboard players add $mob_toughness gm4_ce_data 1

# translate general stat+ to their stats
scoreboard players operation $mob_health gm4_ce_data += $mob_stats gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data += $mob_stats gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data += $mob_stats gm4_ce_data

# add modifiers that add 0
# this adds the 'Base' of these modifiers to the mob allowing other Modifiers to be appened to it
attribute @s generic.max_health modifier add e1d4262d-fa9d-47e7-a98e-e83ad748796e "gm4_ce_initiate_health" 0 add
attribute @s generic.attack_damage modifier add b3955f09-a124-449f-8bc3-d0383b8154be "gm4_ce_initiate_damage" 0 add
attribute @s generic.movement_speed modifier add 8360aa54-b31b-4112-b3b7-bf6b485e25ba "gm4_ce_initiate_speed" 0 add
attribute @s generic.armor modifier add a13ee777-03cd-4466-8bdb-22072c6a66c0 "gm4_ce_initiate_armor" 0 add
attribute @s generic.armor_toughness modifier add 46de6267-7c9f-4044-b302-adbccfca1fca "gm4_ce_initiate_toughness" 0 add

# randomise stats - prepare modifiers in storage
data modify storage gm4_combat_evolved:temp stored_health set value {Amount:0.0d,Operation:0,UUID:[I;2140704786,-732215310,-1294174607,-876353277],Name:"gm4_ce_modifier_health"}
data modify storage gm4_combat_evolved:temp stored_damage set value {Amount:0.0d,Operation:0,UUID:[I;-728731388,2080982423,-1449965038,108239641],Name:"gm4_ce_modifier_damage"}
data modify storage gm4_combat_evolved:temp stored_speed set value {Amount:0.0d,Operation:1,UUID:[I;1381223555,400769955,-1217903358,-1007593403],Name:"gm4_ce_modifier_speed"}
data modify storage gm4_combat_evolved:temp stored_armor set value {Amount:0.0d,Operation:0,UUID:[I;822037284,1237598718,-1760107346,-1515235530],Name:"gm4_ce_modifier_armor"}
data modify storage gm4_combat_evolved:temp stored_toughness set value {Amount:0.0d,Operation:0,UUID:[I;1378760737,475090404,-1372150263,-1670600677],Name:"gm4_ce_modifier_toughness"}
# randomise stats - get values
loot replace block 29999998 1 7134 container.0 loot gm4_combat_evolved:mobs/randomize_stats
data modify storage gm4_combat_evolved:temp random_stats set from block 29999998 1 7134 Items[{Slot:0b}].tag.AttributeModifiers
# randomise stats - apply values
execute store result storage gm4_combat_evolved:temp stored_health.Amount double 2 run data get storage gm4_combat_evolved:temp random_stats[{AttributeName:"minecraft:generic.max_health"}].Amount
data modify storage gm4_combat_evolved:temp stored_damage.Amount set from storage gm4_combat_evolved:temp random_stats[{AttributeName:"minecraft:generic.attack_damage"}].Amount
execute store result storage gm4_combat_evolved:temp stored_speed.Amount double 0.02 run data get storage gm4_combat_evolved:temp random_stats[{AttributeName:"minecraft:generic.movement_speed"}].Amount
data modify storage gm4_combat_evolved:temp stored_armor.Amount set from storage gm4_combat_evolved:temp random_stats[{AttributeName:"minecraft:generic.armor"}].Amount
execute store result storage gm4_combat_evolved:temp stored_toughness.Amount double 5 run data get storage gm4_combat_evolved:temp random_stats[{AttributeName:"minecraft:generic.armor_toughness"}].Amount

# alter modifiers from storage
data modify entity @s Attributes[{Name:"minecraft:generic.max_health"}].Modifiers append from storage gm4_combat_evolved:temp stored_health
data modify entity @s Attributes[{Name:"minecraft:generic.attack_damage"}].Modifiers append from storage gm4_combat_evolved:temp stored_damage
data modify entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Modifiers append from storage gm4_combat_evolved:temp stored_speed
data modify entity @s Attributes[{Name:"minecraft:generic.armor"}].Modifiers append from storage gm4_combat_evolved:temp stored_armor
data modify entity @s Attributes[{Name:"minecraft:generic.armor_toughness"}].Modifiers append from storage gm4_combat_evolved:temp stored_toughness
