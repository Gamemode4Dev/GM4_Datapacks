# run from any armor/slots/SLOT/check

# store information
execute store result score $active gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.active
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.modifier

# check activation requirements
# when undamaged for 4 seconds
execute if score $modifier gm4_ce_data matches 10 run function gm4_combat_evolved:armor/modifiers/type/safe
execute if score $modifier gm4_ce_data matches 11 unless score @s gm4_ce_t_hurt matches 1.. unless score @s gm4_ce_t_shield matches 1.. run function gm4_combat_evolved:armor/modifiers/type/shielded/add_level
execute if score $modifier gm4_ce_data matches 12 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_evolved:armor/modifiers/type/sneak
# when damaged in the last 2.4 seconds (actives are triggered from advancements)
execute if score $modifier gm4_ce_data matches 20 run function gm4_combat_evolved:armor/modifiers/type/damaged
# when having killed a mob in the last 0.8 seconds
execute if score $modifier gm4_ce_data matches 30 run function gm4_combat_evolved:armor/modifiers/type/killing
execute if score $modifier gm4_ce_data matches 31 if score @s gm4_ce_kill matches 1.. run function gm4_combat_evolved:armor/modifiers/type/consume/grow
execute if score $modifier gm4_ce_data matches 32 if score @s gm4_ce_kill matches 1.. run function gm4_combat_evolved:armor/modifiers/type/vamp
execute if score $modifier gm4_ce_data matches 33 if score @s gm4_ce_kill matches 1.. at @s as @e[type=!player,type=!armor_stand,team=!gm4_ce_team_check,distance=..8,tag=!smithed.strict] at @s run function gm4_combat_evolved:armor/modifiers/type/fear
# when below 50% hp
execute if score $modifier gm4_ce_data matches 40 run function gm4_combat_evolved:armor/modifiers/type/lowhp
execute if score $modifier gm4_ce_data matches 41 if data storage gm4_combat_evolved:temp tag.Enchantments[{id:"minecraft:thorns"}] run function gm4_combat_evolved:armor/modifiers/type/thorns/check
execute if score $modifier gm4_ce_data matches 42 run function gm4_combat_evolved:armor/modifiers/type/second_wind/check
execute if score $modifier gm4_ce_data matches 43 unless score @s gm4_ce_t_soothe matches 1.. at @s run function gm4_combat_evolved:armor/modifiers/type/soothe/check
# when above 50% hp
execute if score $modifier gm4_ce_data matches 50 run function gm4_combat_evolved:armor/modifiers/type/highhp
execute if score $modifier gm4_ce_data matches 51 run function gm4_combat_evolved:armor/modifiers/type/immune/check
execute if score $modifier gm4_ce_data matches 52 run function gm4_combat_evolved:armor/modifiers/type/husk/check
# when it is night-time
execute if score $modifier gm4_ce_data matches 60 run function gm4_combat_evolved:armor/modifiers/type/night
execute if score $modifier gm4_ce_data matches 61 run function gm4_combat_evolved:armor/modifiers/type/lunar/check
execute if score $modifier gm4_ce_data matches 62 if predicate gm4_combat_evolved:technical/night_time at @s run function gm4_combat_evolved:armor/modifiers/type/gloom
execute if score $modifier gm4_ce_data matches 63 if predicate gm4_combat_evolved:technical/night_time run function gm4_combat_evolved:armor/modifiers/type/shadow
# when equipped
execute if score $modifier gm4_ce_data matches 71 run function gm4_combat_evolved:armor/modifiers/type/canine/check
execute if score $modifier gm4_ce_data matches 72 at @s run function gm4_combat_evolved:armor/modifiers/type/link
execute if score $modifier gm4_ce_data matches 73 at @s run function gm4_combat_evolved:armor/modifiers/type/beacon/check
execute if score $modifier gm4_ce_data matches 74 unless predicate gm4_combat_evolved:technical/night_time run function gm4_combat_evolved:armor/modifiers/type/trade/check
# epic armor
execute if score $modifier gm4_ce_data matches 81 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_evolved:armor/modifiers/type/overload/activate
execute if score $modifier gm4_ce_data matches 82 unless score @s gm4_ce_t_witch matches 1.. run function gm4_combat_evolved:armor/modifiers/type/witch/check
execute if score $modifier gm4_ce_data matches 83 unless score @s gm4_ce_t_guard matches 1.. run function gm4_combat_evolved:armor/modifiers/type/guardian/process
