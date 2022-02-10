# @s = vibro ray marker
# run from shock/calculate

execute facing entity @a[tag=gm4_vibro_user,limit=1] feet run tp @s ~ ~ ~ ~ ~
scoreboard players reset $ray gm4_vibro_shock
execute at @s run function gm4_vibro_shamir:shock/ray
kill @s
