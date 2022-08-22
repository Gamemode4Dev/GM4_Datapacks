# schedule is needed to let teleport work, because minecraft, that's why
# @s = unspecified
# at world spawn
# run from armor/type/vorpal/schedule

# regain context
execute as @a[tag=gm4_ce_vorpal_start] at @s run function gm4_combat_expanded:armor/modifier/type/vorpal/attempt
