# Give skiing effects when ski requirements are met
# @s = player meeting ski requirements
# at @s
# run from main

effect give @s[predicate=gm4_skis:ski_requirements] speed 5 1 true
execute at @s unless predicate gm4_skis:on_snowy_block run effect give @s[predicate=gm4_skis:wearing_skis] slowness 1 0 true
