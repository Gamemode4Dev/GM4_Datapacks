# run from armor/active/vorpal/schedule
# schedule is needed to let teleport work, because minecraft, that's why

# regain context
execute as @a[tag=gm4_ai_vorpal_start] at @s run function gm4_armor_identification:armor/modifiers/type/vorpal/attempt
