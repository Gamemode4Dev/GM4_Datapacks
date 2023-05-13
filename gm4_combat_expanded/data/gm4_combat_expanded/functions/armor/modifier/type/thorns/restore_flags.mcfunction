# restore HideFlags on armor to original value
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/thorns/deactivate

execute store result score $hideflags gm4_ce_data run data get storage gm4_combat_expanded:temp tag.HideFlags
execute store result storage gm4_combat_expanded:temp tag.HideFlags short 1 run scoreboard players remove $hideflags gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.flags_changed set value 0
