# activate wild_magic armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/wild_magic

# Pick Effect
execute store result score $wild_magic.id gm4_ce_data run random value 1..100
scoreboard players set $add gm4_ce_data 0
# rare good
execute if score $wild_magic.id gm4_ce_data matches 100 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/instant_health
execute if score $wild_magic.id gm4_ce_data matches 99 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/haste
execute if score $wild_magic.id gm4_ce_data matches 98 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/absorption
execute if score $wild_magic.id gm4_ce_data matches 97 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/strength
# uncommon good
execute if score $wild_magic.id gm4_ce_data matches 95..96 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/health_boost
execute if score $wild_magic.id gm4_ce_data matches 93..94 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/regeneration
execute if score $wild_magic.id gm4_ce_data matches 91..92 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/resistance
execute if score $wild_magic.id gm4_ce_data matches 89..90 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/saturation
execute if score $wild_magic.id gm4_ce_data matches 87..88 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/speed
# common good
execute if score $wild_magic.id gm4_ce_data matches 83..86 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/conduit_power
execute if score $wild_magic.id gm4_ce_data matches 79..82 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/jump_boost
execute if score $wild_magic.id gm4_ce_data matches 75..78 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/invisibility
execute if score $wild_magic.id gm4_ce_data matches 71..74 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/dolphins_grace
execute if score $wild_magic.id gm4_ce_data matches 66..70 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/glowing
execute if score $wild_magic.id gm4_ce_data matches 58..65 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/fire_resistance
execute if score $wild_magic.id gm4_ce_data matches 48..57 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/night_vision
execute if score $wild_magic.id gm4_ce_data matches 38..47 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/water_breathing
# common bad
execute if score $wild_magic.id gm4_ce_data matches 33..37 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/hunger
execute if score $wild_magic.id gm4_ce_data matches 28..32 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/mining_fatigue
execute if score $wild_magic.id gm4_ce_data matches 23..27 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/nausea
execute if score $wild_magic.id gm4_ce_data matches 17..22 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/slowness
# uncommon bad
execute if score $wild_magic.id gm4_ce_data matches 11..12 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/levitation
execute if score $wild_magic.id gm4_ce_data matches 9..10 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/slow_falling
execute if score $wild_magic.id gm4_ce_data matches 7..8 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/weakness
execute if score $wild_magic.id gm4_ce_data matches 5..6 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/darkness
# rare bad
execute if score $wild_magic.id gm4_ce_data matches 4 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/wither
execute if score $wild_magic.id gm4_ce_data matches 3 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/poison
execute if score $wild_magic.id gm4_ce_data matches 2 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/blindness
execute if score $wild_magic.id gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/instant_damage

# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]

# Store in storage and apply
function gm4_combat_expanded:armor/modifier/type/wild_magic/eval with storage gm4_combat_expanded:temp wild_magic

# SFX
playsound minecraft:entity.allay.item_thrown player @s ~ ~ ~ 1 0.55

# Cleanup
data remove storage gm4_combat_expanded:temp wild_magic
