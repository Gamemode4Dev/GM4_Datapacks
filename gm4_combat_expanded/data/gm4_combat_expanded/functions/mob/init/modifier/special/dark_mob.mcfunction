# apply dark effects to any mob
# @s = any mob being initialized
# at @s
# run from mob/init/stat/prep

attribute @s generic.max_health modifier add 57c2eda2-b31d-4220-89ba-0a38ed00ab91 "gm4_ce_modifier_dark" 0.15 add_multiplied_base
attribute @s generic.armor modifier add 93b69c69-f865-4b3a-8e2b-306da32c33de "gm4_ce_modifier_dark" 0.25 add_multiplied_base
attribute @s generic.movement_speed modifier add c5b329f2-71c5-4a02-9538-15b04fb94f5c "gm4_ce_modifier_dark" 0.05 add_multiplied_base
