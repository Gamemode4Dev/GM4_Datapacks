execute unless entity @a[limit=1] run schedule function gm4_forceload:load_wait 2t
execute as @a at @s run function gm4_forceload:check_dimension
