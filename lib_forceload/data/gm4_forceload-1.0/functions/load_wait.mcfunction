execute unless entity @a[limit=1] run schedule function gm4_forceload-1.0:load_wait 2t
execute as @a at @s run function gm4_forceload-1.0:check_dimension
