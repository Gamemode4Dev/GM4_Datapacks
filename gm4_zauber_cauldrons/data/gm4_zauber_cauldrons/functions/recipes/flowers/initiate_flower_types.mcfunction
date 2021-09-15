# no @s.
# at world spawn
# called by init

# randomly marks flower types as poisonous on module installation

# initialise fixed values
scoreboard players set #modulo_2 gm4_zc_flowers 2
scoreboard players set #modulo_4 gm4_zc_flowers 4
scoreboard players set #divider gm4_zc_flowers 10

# copy seed to scoreboard
execute store result score $seed gm4_zc_flowers run seed

# set all flowers to a digit of the seed. Obtain up to 20 random bits, the set first
# of 10 bits is obtained by mod 2, the second set by mod 4 later.
scoreboard players operation $red_tulip gm4_zc_flowers = $seed gm4_zc_flowers
scoreboard players operation $red_tulip gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $cornflower gm4_zc_flowers = $red_tulip gm4_zc_flowers
scoreboard players operation $orange_tulip gm4_zc_flowers = $red_tulip gm4_zc_flowers
scoreboard players operation $orange_tulip gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $lily_of_the_valley gm4_zc_flowers = $orange_tulip gm4_zc_flowers
scoreboard players operation $white_tulip gm4_zc_flowers = $orange_tulip gm4_zc_flowers
scoreboard players operation $white_tulip gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $pink_tulip gm4_zc_flowers = $white_tulip gm4_zc_flowers
scoreboard players operation $pink_tulip gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $oxeye_daisy gm4_zc_flowers = $pink_tulip gm4_zc_flowers
scoreboard players operation $oxeye_daisy gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $dandelion gm4_zc_flowers = $oxeye_daisy gm4_zc_flowers
scoreboard players operation $dandelion gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $blue_orchid gm4_zc_flowers = $dandelion gm4_zc_flowers
scoreboard players operation $blue_orchid gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $allium gm4_zc_flowers = $blue_orchid gm4_zc_flowers
scoreboard players operation $allium gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $azure_bluet gm4_zc_flowers = $allium gm4_zc_flowers
scoreboard players operation $azure_bluet gm4_zc_flowers /= #divider gm4_zc_flowers
scoreboard players operation $poppy gm4_zc_flowers = $azure_bluet gm4_zc_flowers
scoreboard players operation $poppy gm4_zc_flowers /= #divider gm4_zc_flowers

# scale down to 1 bit (mod2 for set 1, mod4 for set 2): 1=poisonous 0=normal
# set 1
scoreboard players operation $red_tulip gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $orange_tulip gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $white_tulip gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $pink_tulip gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $oxeye_daisy gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $dandelion gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $blue_orchid gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $allium gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $azure_bluet gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
scoreboard players operation $poppy gm4_zc_flowers %= #modulo_2 gm4_zc_flowers
# set2
scoreboard players operation $cornflower gm4_zc_flowers %= #modulo_4 gm4_zc_flowers
execute if score $cornflower gm4_zc_flowers matches 1..2 run scoreboard players set $cornflower gm4_zc_flowers 1
execute if score $cornflower gm4_zc_flowers matches 3 run scoreboard players set $cornflower gm4_zc_flowers 0
scoreboard players operation $lily_of_the_valley gm4_zc_flowers %= #modulo_4 gm4_zc_flowers
execute if score $lily_of_the_valley gm4_zc_flowers matches 1..2 run scoreboard players set $lily_of_the_valley gm4_zc_flowers 1
execute if score $lily_of_the_valley gm4_zc_flowers matches 3 run scoreboard players set $lily_of_the_valley gm4_zc_flowers 0

# store amount of non poisonous flowers as 12-<sum of flower scores>
scoreboard players set $required_flowers gm4_zc_flowers 12
scoreboard players operation $required_flowers gm4_zc_flowers -= $red_tulip gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $orange_tulip gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $white_tulip gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $pink_tulip gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $oxeye_daisy gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $dandelion gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $blue_orchid gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $allium gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $azure_bluet gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $poppy gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $cornflower gm4_zc_flowers
scoreboard players operation $required_flowers gm4_zc_flowers -= $lily_of_the_valley gm4_zc_flowers
