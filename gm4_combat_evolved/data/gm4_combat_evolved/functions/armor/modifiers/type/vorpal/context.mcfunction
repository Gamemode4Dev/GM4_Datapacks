# schedule is needed to let teleport work, because minecraft, that's why
# run from armor/active/vorpal/schedule

# regain context
execute as @a[tag=gm4_ce_vorpal_start] at @s run function gm4_combat_evolved:armor/modifiers/type/vorpal/attempt
