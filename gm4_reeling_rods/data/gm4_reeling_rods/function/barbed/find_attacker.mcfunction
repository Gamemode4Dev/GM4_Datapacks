# locates the attacker, as commands do not accept int-array formatted strings in macros
# @s = temporary snowball
# at location of snowball
# run from barbed/bleed

# build uuid array
data modify storage gm4_reeling_rods:temp barbed_attacker_uuid set value [I;0,0,0,0]
execute store result storage gm4_reeling_rods:temp barbed_attacker_uuid[0] int 1 run scoreboard players get @s gm4_reeling_rods.barbed_attacker_uuid0
execute store result storage gm4_reeling_rods:temp barbed_attacker_uuid[1] int 1 run scoreboard players get @s gm4_reeling_rods.barbed_attacker_uuid1
execute store result storage gm4_reeling_rods:temp barbed_attacker_uuid[2] int 1 run scoreboard players get @s gm4_reeling_rods.barbed_attacker_uuid2
execute store result storage gm4_reeling_rods:temp barbed_attacker_uuid[3] int 1 run scoreboard players get @s gm4_reeling_rods.barbed_attacker_uuid3

# move uuid to snowball
data modify entity @s Owner set from storage gm4_reeling_rods:temp barbed_attacker_uuid

# tag owner
scoreboard players set $found_attacker gm4_reeling_rods.barbed_attacker_uuid0 0
execute on origin store success score $found_attacker gm4_reeling_rods.barbed_attacker_uuid0 run tag @s add gm4_reeling_rods.barbed_attacker

# remove snowball
kill @s
