# @s = mob within 6 blocks of a vibro shockwave
# run from shock/activate

# raycast to the vibro player
summon marker ~ ~ ~ {CustomName:'"gm4_vibro_ray"',Tags:["gm4_vibro_ray"]}
execute as @e[type=marker,tag=gm4_vibro_ray,limit=1] at @s facing entity @a[tag=gm4_vibro_user,limit=1] feet run tp @s ~ ~ ~ ~ ~
scoreboard players reset $ray gm4_vibro_shock
execute as @e[type=marker,tag=gm4_vibro_ray,limit=1] at @s run function gm4_vibro_shamir:shock/ray
kill @e[type=marker,tag=gm4_vibro_ray]

# damage dealt to the vibro player is multiplied by 2 and divided by the distance+dampening
scoreboard players operation $shockwave gm4_vibro_shock = $damage gm4_vibro_shock
scoreboard players operation $shockwave gm4_vibro_shock *= #shock_multiplier gm4_vibro_shock
scoreboard players operation $shockwave gm4_vibro_shock /= $ray gm4_vibro_shock

# if damage was more than .5 health (.25 hearts), damage the mob
execute if score $shockwave gm4_vibro_shock matches 50.. unless entity @s[type=player] run function gm4_vibro_shamir:shock/apply_mob
execute if score $shockwave gm4_vibro_shock matches 50.. if entity @s[type=player] run function gm4_vibro_shamir:shock/apply_player
