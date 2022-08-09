# Checks if the player meets skiing requirements (on snowy block and wearing skis)
# @s = player
# at @s
# run from main

execute unless entity @s[predicate=gm4_skis:wearing_skis] run function gm4_skis:ski_effects/remove_effects
###################################### TODO: CHANGE ON_SNOWY_BLOCK ################################################
execute at @s anchored eyes positioned ^ ^ ^ unless predicate gm4_skis:on_snowy_block run function gm4_skis:ski_effects/remove_effects