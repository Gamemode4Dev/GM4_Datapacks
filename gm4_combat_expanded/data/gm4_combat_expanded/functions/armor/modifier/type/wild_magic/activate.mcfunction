# activate wild_magic armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/wild_magic

# Pick Effect
execute store result score $wild_magic.id gm4_ce_data run random value 1..100
execute if score $wild_magic.id gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "poison"
execute if score $wild_magic.id gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "wither"
execute if score $wild_magic.id gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "instant_health"
execute if score $wild_magic.id gm4_ce_data matches 4 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "instant_damage"
execute if score $wild_magic.id gm4_ce_data matches 5 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "levitation"
execute if score $wild_magic.id gm4_ce_data matches 6 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "slowness"
execute if score $wild_magic.id gm4_ce_data matches 7 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "haste"
execute if score $wild_magic.id gm4_ce_data matches 8 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "mining_fatigue"
execute if score $wild_magic.id gm4_ce_data matches 9 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "strength"
execute if score $wild_magic.id gm4_ce_data matches 10 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "jump_boost"
execute if score $wild_magic.id gm4_ce_data matches 11 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "nausea"
execute if score $wild_magic.id gm4_ce_data matches 12 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "regeneration"
execute if score $wild_magic.id gm4_ce_data matches 13 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "resistance"
execute if score $wild_magic.id gm4_ce_data matches 14 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "blindness"
execute if score $wild_magic.id gm4_ce_data matches 15 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "hunger"
execute if score $wild_magic.id gm4_ce_data matches 16 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "weakness"
execute if score $wild_magic.id gm4_ce_data matches 17 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "health_boost"
execute if score $wild_magic.id gm4_ce_data matches 18 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "absorption"
execute if score $wild_magic.id gm4_ce_data matches 19 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "saturation"
execute if score $wild_magic.id gm4_ce_data matches 20 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "darkness"

execute if score $wild_magic.id gm4_ce_data matches 21..25 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "speed"
execute if score $wild_magic.id gm4_ce_data matches 26..30 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "fire_resistance"

execute if score $wild_magic.id gm4_ce_data matches 31..40 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "water_breathing"
execute if score $wild_magic.id gm4_ce_data matches 41..50 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "night_vision"
execute if score $wild_magic.id gm4_ce_data matches 51..60 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "invisibility"
execute if score $wild_magic.id gm4_ce_data matches 61..70 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "glowing"
execute if score $wild_magic.id gm4_ce_data matches 71..80 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "slow_falling"
execute if score $wild_magic.id gm4_ce_data matches 81..90 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "conduit_power"
execute if score $wild_magic.id gm4_ce_data matches 91..100 run data modify storage gm4_combat_expanded:temp wild_magic.id set value "dolphins_grace"


# luck
# unluck
# bad_omen
# hero_of_the_village

# Pick effect duration
execute store result score $wild_magic.duration gm4_ce_data run random value 30..90
# poison / wither
execute if score $wild_magic.id gm4_ce_data matches 1..2 store result score $wild_magic.duration gm4_ce_data run random value 2..8
# instant_health / instant_damage
execute if score $wild_magic.id gm4_ce_data matches 3..4 run scoreboard players set $wild_magic.duration gm4_ce_data 1
# levitation
execute if score $wild_magic.id gm4_ce_data matches 5 store result score $wild_magic.duration gm4_ce_data run random value 1..5

# Pick effect levels
execute store result score $wild_magic.level gm4_ce_data run random value 0..9
# poison / wither
execute if score $wild_magic.id gm4_ce_data matches 1..2 store result score $wild_magic.level gm4_ce_data run random value 0..2
# instant_damage
execute if score $wild_magic.id gm4_ce_data matches 4 run scoreboard players set $wild_magic.level gm4_ce_data 0
# resistance
execute if score $wild_magic.id gm4_ce_data matches 13 store result score $wild_magic.level gm4_ce_data run random value 0..4

# Store in storage and apply
execute store result storage gm4_combat_expanded:temp wild_magic.duration int 1 run scoreboard players get $wild_magic.duration gm4_ce_data
execute store result storage gm4_combat_expanded:temp wild_magic.level int 1 run scoreboard players get $wild_magic.level gm4_ce_data
function gm4_combat_expanded:armor/modifier/type/wild_magic/eval with storage gm4_combat_expanded:temp wild_magic

# SFX
playsound minecraft:entity.allay.item_thrown player @s ~ ~ ~ 1 0.55

# Cleanup
data remove storage gm4_combat_expanded:temp wild_magic
