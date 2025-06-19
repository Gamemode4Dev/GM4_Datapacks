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

# prepare to handle player death
execute store result score $show_death_messages gm4_reeling_rods.barbed_damage_timer run gamerule showDeathMessages
gamerule showDeathMessages false

# apply damage
# | if the attacker was found, attribute it to the attacker, if not do not attribute it to anyone
# | use cactus damage type as it has no knockback and respects armor
# | print custom death message to obscure cactus death message
execute if score $found_attacker gm4_reeling_rods.barbed_attacker_uuid0 matches 1.. run damage @s 2 cactus by @p[tag=gm4_reeling_rods.barbed_attacker]
execute unless score $found_attacker gm4_reeling_rods.barbed_attacker_uuid0 matches 1.. run damage @s 2 cactus
playsound minecraft:block.pointed_dripstone.drip_lava neutral @a[distance=..6] ~ ~ ~ 1 1.8
execute anchored eyes run particle damage_indicator ^ ^ ^ .2 .2 .2 0 3
execute anchored eyes run particle damage_indicator ^ ^ ^1 .5 .5 .5 0 8 normal @s

# handle death (@e only selects entities which are alive)
# | this is of importance for entities which display death messages or re-spawn
tag @s add gm4_reeling_rods.victim
execute if entity @s[type=#gm4_reeling_rods:support_death_message] at @s unless entity @e[type=#gm4_reeling_rods:support_death_message,tag=gm4_reeling_rods.victim,distance=0,limit=1] run function gm4_reeling_rods:barbed/on_bleeding_death
tag @s remove gm4_reeling_rods.victim
execute if score $show_death_messages gm4_reeling_rods.barbed_damage_timer matches 1 run gamerule showDeathMessages true
scoreboard players reset $show_death_messages gm4_reeling_rods.barbed_damage_timer
