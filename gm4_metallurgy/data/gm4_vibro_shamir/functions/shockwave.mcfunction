# @s = player wearing vibro boots that just took fall damage while sneaking
# run from advancement vibro_fall_damage

advancement revoke @s only gm4_vibro_shamir:vibro_fall_damage

# jump boost cooldown
scoreboard players set @s gm4_vibro_sneak -10

# hurt mobs
scoreboard players operation @s gm4_vibro_shock = @s gm4_vibro_hurt
scoreboard players operation @s gm4_vibro_shock += @s gm4_vibro_absorb
schedule function gm4_vibro_shamir:shock/activate 1t

# desire lines effect in a 5x5
scoreboard players remove @s gm4_desire_lines 3
function #gm4_desire_lines:expansion
execute if score gm4_desire_lines load.status matches 1.. unless score @s gm4_desire_lines matches 0 run function gm4_vibro_shamir:desire_lines
