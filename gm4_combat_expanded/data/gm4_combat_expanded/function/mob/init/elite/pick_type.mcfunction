
# zombie villagers are not replaced
execute if entity @s[type=zombie_villager] run return run data remove entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]

# remove unwanted stats from zombie elites
data remove entity @s[type=!#gm4_combat_expanded:skeleton_types] attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]
data modify entity @s[type=!#gm4_combat_expanded:skeleton_types] IsBaby set value 0b

# don't allow entities from splits to be elites
execute if entity @s[tag=gm4_ce_split_entity] run return 0

# pick a random elite
#execute store result score $elite_pick gm4_ce_data run random value 1..100

# GLACIAL 35% 
# 3.5x health, 45% KB resist
# attacks apply chill (15 sec stacking slowness, applies freeze at 7 stacks)
# explode in a ball of frost on death, exploding after a delay to freeze entities inside for 3 seconds
# frozen entities cannot act
execute if score $elite_pick gm4_ce_data matches 1..35 run return run function gm4_combat_expanded:mob/init/elite/glacial

# MENDING 15%
# 2.5x health, -25% speed
# heals undead in LoS, restoring 24 health and granting them resistance II for 1 second
execute if score $elite_pick gm4_ce_data matches 36..50 run return run function gm4_combat_expanded:mob/init/elite/mending

# BLAZING 20%
# 3.5x health, -45% speed, -99% damage, can't burn
# attacks deal 7 in_fire damage
# occasionally shoot homing fireballs at the closest player, exploding when they hit terrain / a player to deal 5 explosion damage
execute if score $elite_pick gm4_ce_data matches 51..70 run return run function gm4_combat_expanded:mob/init/elite/blazing

# ZEPHYR 5%
# 3x health, +15% speed, +0.5 attack knockback, immune to fall damage
# after spotting a player stand still to charge for ~4 seconds, then activate:
# zombie: charge at the player, dealing 25% increased damage and disabling shields
# skeleton: fire up to 16 arrows in rapid succession that deal half damage, each disables shields, then gain a speed boost
execute if score $elite_pick gm4_ce_data matches 71..75 run return run function gm4_combat_expanded:mob/init/elite/zephyr

# GARGANTUAN 5%
# 6.5x health (4.5x for skeleton), +50% size, +35% attack damage, 1.75 attack knockback, 85% movement efficiency, -35% speed
# projectile protection 4, skeletons have punch II and power I on bow
# attacks break shields
# based on missing health gain up to 150% speed, 50% attack damage and from 85-100% knockback resistance
# Occasionally charges up a stomp attack that slows and deals 75% damage to players within 7 blocks
execute if score $elite_pick gm4_ce_data matches 76..80 run return run function gm4_combat_expanded:mob/init/elite/gargantuan

# VORPAL 5%
# 3.5x health
# can teleports up to 8 blocks away when hit, 65% chance
# On Death shoot a black cloud tracking the closest player, causing them to go blind, obscuring their vision and removing sounds
execute if score $elite_pick gm4_ce_data matches 81..85 run return run function gm4_combat_expanded:mob/init/elite/vorpal

# SPLITTING 5%
# 3.5x health
# on death splits into 5 miniature versions of the entity, with -50% in scale and most stats
execute if score $elite_pick gm4_ce_data matches 86..90 run return run function gm4_combat_expanded:mob/init/elite/splitting
