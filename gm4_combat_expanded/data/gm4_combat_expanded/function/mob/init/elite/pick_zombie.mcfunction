
# zombie villagers are not replaced
execute if entity @s[type=zombie_villager] run return run data remove entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]

# remove unwanted stats from zombie elites
data remove entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]
data modify entity @s IsBaby set value 0b

# pick a random elite
#execute store result score $elite_pick gm4_ce_data run random value 1..100

# 0% zombie, 25% skeleton ??? () - 
execute if score $elite_pick gm4_ce_data matches 1..35 run return run function gm4_combat_expanded:mob/init/elite/frost

# 35% GLACIAL (frost) - explode in a ball of frost on death, attacks slow
execute if score $elite_pick gm4_ce_data matches 1..35 run return run function gm4_combat_expanded:mob/init/elite/frost

# 15% SLATE (heal) - heals undead in LoS, granting them resistance II for a short time
execute if score $elite_pick gm4_ce_data matches 36..50 run return run function gm4_combat_expanded:mob/init/elite/heal

# 20% BLAZING (fire) - occasionally shoot homing fireballs at the closest player, exploding when they hit terrain / a player. Attacks deal fire damage On death explode in a burst of flames
execute if score $elite_pick gm4_ce_data matches 51..70 run return run function gm4_combat_expanded:mob/init/elite/fire

# 5% ZEPHYR (speed) - charges when player is spotted, then gets a burst of movement speed or shot arrows
execute if score $elite_pick gm4_ce_data matches 71..75 run return run function gm4_combat_expanded:mob/init/elite/speed

# (giant) - much larger mob with high health and attack knockback. Occasionally charges up a stomp attack that stuns and damages players nearby, breaking shields
execute if score $elite_pick gm4_ce_data matches 76..100 run return run function gm4_combat_expanded:mob/init/elite/giant

# 5%  (fear) - teleports a short distance randomly occasionally, more often after being hit. On Death shoot a tracking black cloud
# that fears the player it hits, causing them to not be able to attack for 5 seconds

# (wither) - attacks wither the player, not allowing them to restore health

# (giant) - much larger mob with high health and attack knockback. Occasionally charges up a stomp attack that stuns and damages players nearby, breaking shields
