# @s = player who used vibro
# run from shockwave

# center block is guaranteed
function gm4_desire_lines:path

# 3x3 area has a 50% chance to convert
execute positioned ~-1 ~ ~-1 if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~ ~ ~-1 if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~1 ~ ~-1 if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~-1 ~ ~ if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~1 ~ ~ if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~-1 ~ ~1 if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~ ~ ~1 if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path
execute positioned ~1 ~ ~1 if predicate gm4_vibro_shamir:desire_lines_chance_high run function gm4_desire_lines:path

# 5x5 border has 25% chance to convert
execute positioned ~-2 ~ ~-2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~-1 ~ ~-2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~ ~ ~-2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~1 ~ ~-2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~2 ~ ~-2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~-2 ~ ~-1 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~2 ~ ~-1 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~-2 ~ ~ if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~2 ~ ~ if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~-2 ~ ~1 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~2 ~ ~1 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~-2 ~ ~2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~-1 ~ ~2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~ ~ ~2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~1 ~ ~2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
execute positioned ~2 ~ ~2 if predicate gm4_vibro_shamir:desire_lines_chance_low run function gm4_desire_lines:path
