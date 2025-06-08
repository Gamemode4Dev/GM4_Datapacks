# Applies the barbed damage to the hooked entity
# @s = hooked entity
# at bobber position
# with {damage}
# run from fished/select_type

# immediate damage (amount scales with enchantment level)
$damage @s $(damage) cactus by @p[tag=gm4_reeling_rods.player]
playsound minecraft:entity.player.attack.crit player @a[distance=..16] ~ ~ ~ 1 1.82

# bleeding damage (more frequent with higher levels, but constant in amount)
data modify storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid set from entity @a[limit=1,tag=gm4_reeling_rods.player] UUID
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid0 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[0]
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid1 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[1]
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid2 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[2]
execute store result score @s gm4_reeling_rods.barbed_attacker_uuid3 run data get storage gm4_reeling_rods:temp enchanted.barbed.attacker_uuid[3]
execute store result score @s gm4_reeling_rods.barbed_damage_period run data get storage gm4_reeling_rods:temp enchanted.barbed.period
scoreboard players set @s gm4_reeling_rods.barbed_damage_timer 0
schedule function gm4_reeling_rods:barbed/find_affected 1t replace
