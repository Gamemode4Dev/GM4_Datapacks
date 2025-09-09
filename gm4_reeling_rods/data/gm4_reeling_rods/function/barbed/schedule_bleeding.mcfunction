# schedules bleeding damage for the entity that was just hit by barbed
# @s = entity just hit by barbed that has not died from the immediate damage
# at bobber position
# run from barbed/apply

# store attacker uuid and period
data modify storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid set from entity @a[limit=1,tag=gm4_reeling_rods.player] UUID
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid0 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[0]
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid1 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[1]
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid2 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[2]
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid3 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[3]
execute store result score @s gm4_reeling_rods.barbed_damage_period run data get storage gm4_reeling_rods:temp enchanted.barbed.period

# initiate timer
scoreboard players set @s gm4_reeling_rods.barbed_damage_timer 0
schedule function gm4_reeling_rods:barbed/find_affected 1t replace
