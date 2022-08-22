# calculate the red health of player calling this function and store in scoreboard gm4_ce_health
# $max_health and $half_health in gm4_ce_data temporaraly store max and half of max health
# @s = player to calculate health from
# at world spawn
# run from armor/identify/check_unid
# run from armor/modifier/type/highhp
# run from armor/modifier/type/lowhp
# run from armor/modifier/type/guardian/damage_calc
# run from armor/modifier/type/guardian/check
# run from armor/modifier/type/husk/check
# run from armor/modifier/type/immune/check
# run from armor/modifier/type/overload/activate
# run from armor/modifier/type/second_wind/heal_check
# run from armor/modifier/type/soothe/heal_check
# run from armor/modifier/type/thorns/check
# run from player/heal
# run from weapon/modifier/delay
# run from weapon/modifier/wither

# get max health
execute store result score $max_health gm4_ce_data run attribute @s minecraft:generic.max_health get

# calculate half of max health
scoreboard players operation $half_health gm4_ce_data = $max_health gm4_ce_data
scoreboard players operation $half_health gm4_ce_data /= #2 gm4_ce_data

# calculate current health (only red hearts)
# Health stores as float, but minecraft displays as int rounded up, this
# mimics that so the value always matches what the player sees
execute store result score @s gm4_ce_health run data get entity @s Health 10
scoreboard players add @s gm4_ce_health 9
scoreboard players operation @s gm4_ce_health /= #10 gm4_ce_data
