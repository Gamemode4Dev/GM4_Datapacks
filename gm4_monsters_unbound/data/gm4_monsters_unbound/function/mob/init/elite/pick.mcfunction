# pick elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/mob_type/skeleton/base
# run from mob/init/mob_type/zombie/base

tag @s remove gm4_sr_was_leader_or_baby
tag @s add gm4_mu_elite

# zombie villagers are not replaced
execute if entity @s[type=zombie_villager] run return 0

# don't allow elites to be jockeys
ride @s dismount

# don't allow entities from splits to be elites
execute if entity @s[tag=gm4_mu_split_entity] run return 0

# pick a random elite, or use prepicked if set
execute store result score $elite_pick gm4_mu_data run random value 1..100
execute if score $prepicked_elite gm4_mu_data matches 1..100 run scoreboard players operation $elite_pick gm4_mu_data = $prepicked_elite gm4_mu_data
scoreboard players reset $prepicked_elite gm4_mu_data

# GLACIAL 15% 
# 3.5x health, 45% KB resist
# attacks apply chill (15 sec stacking slowness, applies freeze at 7 stacks)
# explode in a ball of frost on death, exploding after a delay to freeze entities inside for 3 seconds
# frozen entities cannot act
execute if score $elite_pick gm4_mu_data matches ..15 run return run function gm4_monsters_unbound:mob/init/elite/type/glacial

# MENDING 15%
# 2.5x health, -25% speed
# heals undead in LoS, restoring 24 health and granting them resistance II for 1 second
# explode in a healing orb on death, heals nearby mobs, can be destroyed to grant everything in radius regeneration
execute if score $elite_pick gm4_mu_data matches 16..30 run return run function gm4_monsters_unbound:mob/init/elite/type/mending

# ZEPHYR 15%
# 3x health, +15% speed, +0.5 attack knockback, immune to fall damage
# after spotting a player stand still to charge for ~4 seconds, then activate:
# zombie: charge at the player, dealing 25% increased damage
# skeleton: fire up to 16 arrows in rapid succession that deal 0.5 arrow damage, then gain a speed boost
execute if score $elite_pick gm4_mu_data matches 31..45 run return run function gm4_monsters_unbound:mob/init/elite/type/zephyr

# BLAZING 10%
# 3.5x health, -45% speed, -99% damage, can't burn
# fire aspect II / flame II
# occasionally stops to shoot homing fireballs at the closest player, exploding when they hit terrain / a player to deal 5 explosion damage
execute if score $elite_pick gm4_mu_data matches 46..55 run return run function gm4_monsters_unbound:mob/init/elite/type/blazing

# GARGANTUAN 5%
# 6.5x health (4.5x for skeleton), +50% size, +35% attack damage, 1.75 attack knockback, 85% movement efficiency, -35% speed
# projectile protection 4, skeletons have punch II and power I on bow
# based on missing health gain up to 150% speed, 50% attack damage and from 85-100% knockback resistance
# Occasionally charges up a stomp attack that slows and deals 75% damage to players within 7 blocks
execute if score $elite_pick gm4_mu_data matches 56..60 run return run function gm4_monsters_unbound:mob/init/elite/type/gargantuan

# VORPAL 10%
# 3.5x health
# can teleports up to 8 blocks away when hit, 65% chance
# On Death shoot a black cloud tracking the closest player, causing them to go blind, obscuring their vision and removing sounds
execute if score $elite_pick gm4_mu_data matches 61..70 run return run function gm4_monsters_unbound:mob/init/elite/type/vorpal

# SPLITTING 10%
# 3.5x health
# on death splits into 5 miniature versions of the entity, with -50% in scale and reduced stats
execute if score $elite_pick gm4_mu_data matches 71..80 run return run function gm4_monsters_unbound:mob/init/elite/type/splitting

# VOLATILE 10%
# 3.5x health, +20% movement speed, +25% attack damage, arrow delay set to 0
# calls down pillars of energy that explode after 4 seconds, leaving a dragon_fireball
execute if score $elite_pick gm4_mu_data matches 81..90 run return run function gm4_monsters_unbound:mob/init/elite/type/volatile

# PEARLESCENT 10%
# 3.5x health
# occasionally slow to shoot a beam of light at a player, damaging them over time
execute if score $elite_pick gm4_mu_data matches 91.. run return run function gm4_monsters_unbound:mob/init/elite/type/pearlescent
