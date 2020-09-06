#@s = liquid tank stand
# removes all liquid tags from the stand. Used for emptying tank and reassigning liquid type

tag @s remove gm4_lt_zauber_harming_potion
tag @s remove gm4_lt_zauber_healing_potion
tag @s remove gm4_lt_zauber_leaping_potion
tag @s remove gm4_lt_zauber_poison_potion
tag @s remove gm4_lt_zauber_regeneration_potion
tag @s remove gm4_lt_zauber_swiftness_potion
tag @s remove gm4_lt_zauber_strength_potion
tag @s remove gm4_lt_zauber_wormhole_potion
scoreboard players reset @s gm4_zl_warp_cx
scoreboard players reset @s gm4_zl_warp_cy
scoreboard players reset @s gm4_zl_warp_cz
scoreboard players reset @s gm4_zl_warp_cd
