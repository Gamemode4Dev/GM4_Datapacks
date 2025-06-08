# updates the bleeding timer
# @s = entity recently hit by a barbed fishing rod
# at @s
# run from barbed/find_affected

# advance timer
scoreboard players add @s gm4_reeling_rods.barbed_damage_timer 1

# clear if timer exceeds 3s
execute if score @s gm4_reeling_rods.barbed_damage_timer matches 61.. run return run function gm4_reeling_rods:barbed/clear

# return unless phase of timer is 0
scoreboard players operation $phase gm4_reeling_rods.barbed_damage_timer = @s gm4_reeling_rods.barbed_damage_timer
scoreboard players operation $phase gm4_reeling_rods.barbed_damage_timer %= @s gm4_reeling_rods.barbed_damage_period
execute unless score $phase gm4_reeling_rods.barbed_damage_timer matches 0 run return fail

# find attacker 
# | tags attacker with gm4_reeling_rods.barbed_attacker
# | sets $found_attacker gm4_reeling_rods.barbed_attacker_uuid0
execute summon snowball run function gm4_reeling_rods:barbed/find_attacker

# apply damage
# | if the attacker was found, attribute it to the attacker, if not do not attribute it to anyone
execute if score $found_attacker gm4_reeling_rods.barbed_attacker_uuid0 matches 1.. run damage @s 2 cactus by @p[tag=gm4_reeling_rods.barbed_attacker]
execute unless score $found_attacker gm4_reeling_rods.barbed_attacker_uuid0 matches 1.. run damage @s 2 cactus
playsound minecraft:block.pointed_dripstone.drip_lava neutral @a[distance=..6] ~ ~ ~ 1 1.8
execute anchored eyes run particle damage_indicator ^ ^ ^ .2 .2 .2 0 3
execute anchored eyes run particle damage_indicator ^ ^ ^1 .5 .5 .5 0 8 normal @s
