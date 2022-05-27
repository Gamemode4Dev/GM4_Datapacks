# check the modifier on the armor piece
# @s = player wearing modified armor
# run from functions in armor/slot/SLOT/check

# store information
execute store result score $active gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.modifier

# check activation requirements
# when undamaged for 4 seconds
execute if score $modifier gm4_ce_data matches 10 run function gm4_combat_expanded:armor/modifier/type/safe
execute if score $modifier gm4_ce_data matches 11 unless score @s gm4_ce_t_hurt matches 1.. unless score @s gm4_ce_t_shield matches 1.. run function gm4_combat_expanded:armor/modifier/type/shielded/add_level
execute if score $modifier gm4_ce_data matches 12 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/sneak/sneak
# when damaged in the last 2.4 seconds (actives are triggered from advancements)
execute if score $modifier gm4_ce_data matches 20 run function gm4_combat_expanded:armor/modifier/type/damaged
# when having killed a mob in the last 0.8 seconds
execute if score $modifier gm4_ce_data matches 30 run function gm4_combat_expanded:armor/modifier/type/killing
execute if score $modifier gm4_ce_data matches 31 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/consume/grow
execute if score $modifier gm4_ce_data matches 32 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/vamp/vamp
execute if score $modifier gm4_ce_data matches 33 if score @s gm4_ce_kill matches 1.. at @s as @e[type=!player,type=!armor_stand,team=!gm4_ce_team_check,distance=..8,tag=!smithed.strict] at @s run function gm4_combat_expanded:armor/modifier/type/fear/fear
# when below 50% hp
execute if score $modifier gm4_ce_data matches 40 run function gm4_combat_expanded:armor/modifier/type/lowhp
execute if score $modifier gm4_ce_data matches 41 if data storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}] run function gm4_combat_expanded:armor/modifier/type/thorns/check
execute if score $modifier gm4_ce_data matches 42 run function gm4_combat_expanded:armor/modifier/type/second_wind/check
execute if score $modifier gm4_ce_data matches 43 unless score @s gm4_ce_t_soothe matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/soothe/check
# when above 50% hp
execute if score $modifier gm4_ce_data matches 50 run function gm4_combat_expanded:armor/modifier/type/highhp
execute if score $modifier gm4_ce_data matches 51 run function gm4_combat_expanded:armor/modifier/type/immune/check
execute if score $modifier gm4_ce_data matches 52 run function gm4_combat_expanded:armor/modifier/type/husk/check
# when it is night-time
execute if score $modifier gm4_ce_data matches 60 run function gm4_combat_expanded:armor/modifier/type/night
execute if score $modifier gm4_ce_data matches 61 run function gm4_combat_expanded:armor/modifier/type/lunar/check
execute if score $modifier gm4_ce_data matches 62 if predicate gm4_combat_expanded:technical/night_time at @s run function gm4_combat_expanded:armor/modifier/type/gloom/gloom
execute if score $modifier gm4_ce_data matches 63 if predicate gm4_combat_expanded:technical/night_time run function gm4_combat_expanded:armor/modifier/type/shadow/shadow
# when equipped
execute if score $modifier gm4_ce_data matches 71 run function gm4_combat_expanded:armor/modifier/type/canine/check
execute if score $modifier gm4_ce_data matches 72 at @s run function gm4_combat_expanded:armor/modifier/type/link/link
execute if score $modifier gm4_ce_data matches 73 at @s run function gm4_combat_expanded:armor/modifier/type/beacon/check
execute if score $modifier gm4_ce_data matches 74 unless predicate gm4_combat_expanded:technical/night_time run function gm4_combat_expanded:armor/modifier/type/trade/check
# epic armor
execute if score $modifier gm4_ce_data matches 81 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/overload/activate
execute if score $modifier gm4_ce_data matches 82 unless score @s gm4_ce_t_witch matches 1.. run function gm4_combat_expanded:armor/modifier/type/witch/check
execute if score $modifier gm4_ce_data matches 83 unless score @s gm4_ce_t_guard matches 1.. run function gm4_combat_expanded:armor/modifier/type/guardian/process
