# activate wild_magic armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/wild_magic

# Pick Effect
execute store result score $wild_magic.id gm4_ce_data run random value 1..100
# rare good
execute if score $wild_magic.id gm4_ce_data matches 100 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/instant_health
execute if score $wild_magic.id gm4_ce_data matches 98..99 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/haste
execute if score $wild_magic.id gm4_ce_data matches 96..97 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/absorption
# uncommon good
execute if score $wild_magic.id gm4_ce_data matches 93..95 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/health_boost
execute if score $wild_magic.id gm4_ce_data matches 90..92 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/regeneration
execute if score $wild_magic.id gm4_ce_data matches 87..89 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/resistance
# common good
execute if score $wild_magic.id gm4_ce_data matches 81..86 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/invisibility
execute if score $wild_magic.id gm4_ce_data matches 74..80 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/conduit_power
execute if score $wild_magic.id gm4_ce_data matches 69..74 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/dolphins_grace
execute if score $wild_magic.id gm4_ce_data matches 63..68 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/fire_resistance
execute if score $wild_magic.id gm4_ce_data matches 57..62 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/glowing
execute if score $wild_magic.id gm4_ce_data matches 51..56 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/good/night_vision
# common bad
execute if score $wild_magic.id gm4_ce_data matches 43..50 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/darkness
execute if score $wild_magic.id gm4_ce_data matches 36..42 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/hunger
execute if score $wild_magic.id gm4_ce_data matches 30..35 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/mining_fatigue
execute if score $wild_magic.id gm4_ce_data matches 24..29 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/nausea
execute if score $wild_magic.id gm4_ce_data matches 18..23 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/slowness
# uncommon bad
execute if score $wild_magic.id gm4_ce_data matches 15..17 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/blindness
execute if score $wild_magic.id gm4_ce_data matches 12..14 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/levitation
execute if score $wild_magic.id gm4_ce_data matches 9..11 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/slow_falling
execute if score $wild_magic.id gm4_ce_data matches 6..8 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/weakness
# rare bad
execute if score $wild_magic.id gm4_ce_data matches 4..5 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/wither
execute if score $wild_magic.id gm4_ce_data matches 2..3 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/poison
execute if score $wild_magic.id gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/bad/instant_damage

# Store in storage and apply
function gm4_combat_expanded:armor/modifier/type/wild_magic/eval with storage gm4_combat_expanded:temp wild_magic

# SFX
playsound minecraft:entity.allay.item_thrown player @s ~ ~ ~ 1 0.55

# Cleanup
data remove storage gm4_combat_expanded:temp wild_magic
