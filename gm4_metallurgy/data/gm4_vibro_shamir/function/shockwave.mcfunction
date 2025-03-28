# @s = player wearing vibro boots that just took fall damage while sneaking
# run from advancement vibro_fall_damage

advancement revoke @s only gm4_vibro_shamir:vibro_fall_damage

# jump boost cooldown
scoreboard players set @s gm4_vibro_sneak -10

# hurt mobs
scoreboard players operation @s gm4_vibro_shock = @s gm4_vibro_hurt
scoreboard players operation @s gm4_vibro_shock += @s gm4_vibro_absorb
schedule function gm4_vibro_shamir:shock/activate 1t

# terminate if desire lines is not installed
execute unless score gm4_desire_lines load.status matches 1.. run return 1

# desire lines is installed, apply guarenteed effect (unless the player has some strong desire lines inhibiting item) in a 5x5
# | the inverse sneak penalty is not enough to cicumvent desire lines in this case
scoreboard players set $probability gm4_desire_lines 100
scoreboard players operation $probability gm4_desire_lines -= #sneak_penality gm4_desire_lines
function #gm4_desire_lines:expansion
execute if predicate {"condition":"minecraft:random_chance","chance":{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"$probability"},"score":"gm4_desire_lines","scale":0.01}} run function gm4_vibro_shamir:desire_lines
