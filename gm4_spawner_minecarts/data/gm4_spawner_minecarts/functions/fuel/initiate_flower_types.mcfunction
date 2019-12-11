#no @s.
#at world spawn
#called by init

#randomly marks flower types as poisonous on module installation

#initialise fixed values
scoreboard players set modulo_2 gm4_sm_flowers 2
scoreboard players set modulo_4 gm4_sm_flowers 4
scoreboard players set divider gm4_sm_flowers 10

#copy seed to scoreboard
execute store result score seed gm4_sm_flowers run seed

#set all flowers to a digit of the seed. Obtain up to 20 random bits, the set first
#of 10 bits is obtained by mod 2, the second set by mod 4 later.
scoreboard players operation red_tulip gm4_sm_flowers = seed gm4_sm_flowers
scoreboard players operation red_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation cornflower gm4_sm_flowers = red_tulip gm4_sm_flowers
scoreboard players operation orange_tulip gm4_sm_flowers = red_tulip gm4_sm_flowers
scoreboard players operation orange_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation lily_of_the_valley gm4_sm_flowers = orange_tulip gm4_sm_flowers
scoreboard players operation white_tulip gm4_sm_flowers = orange_tulip gm4_sm_flowers
scoreboard players operation white_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation pink_tulip gm4_sm_flowers = white_tulip gm4_sm_flowers
scoreboard players operation pink_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation oxeye_daisy gm4_sm_flowers = pink_tulip gm4_sm_flowers
scoreboard players operation oxeye_daisy gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation dandelion gm4_sm_flowers = oxeye_daisy gm4_sm_flowers
scoreboard players operation dandelion gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation blue_orchid gm4_sm_flowers = dandelion gm4_sm_flowers
scoreboard players operation blue_orchid gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation allium gm4_sm_flowers = blue_orchid gm4_sm_flowers
scoreboard players operation allium gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation azure_bluet gm4_sm_flowers = allium gm4_sm_flowers
scoreboard players operation azure_bluet gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation poppy gm4_sm_flowers = azure_bluet gm4_sm_flowers
scoreboard players operation poppy gm4_sm_flowers /= divider gm4_sm_flowers

#scale down to 1 bit (mod2 for set 1, mod4 for set 2): 1=poisonous 0=normal
#set 1
scoreboard players operation red_tulip gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation orange_tulip gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation white_tulip gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation pink_tulip gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation oxeye_daisy gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation dandelion gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation blue_orchid gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation allium gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation azure_bluet gm4_sm_flowers %= modulo_2 gm4_sm_flowers
scoreboard players operation poppy gm4_sm_flowers %= modulo_2 gm4_sm_flowers
#set2
scoreboard players operation cornflower gm4_sm_flowers %= modulo_4 gm4_sm_flowers
execute if score cornflower gm4_sm_flowers matches 1..2 run scoreboard players set cornflower gm4_sm_flowers 1
execute if score cornflower gm4_sm_flowers matches 3 run scoreboard players set cornflower gm4_sm_flowers 0
scoreboard players operation lily_of_the_valley gm4_sm_flowers %= modulo_4 gm4_sm_flowers
execute if score lily_of_the_valley gm4_sm_flowers matches 1..2 run scoreboard players set lily_of_the_valley gm4_sm_flowers 1
execute if score lily_of_the_valley gm4_sm_flowers matches 3 run scoreboard players set lily_of_the_valley gm4_sm_flowers 0

#store amount of non poisonous flowers as 10-<sum of flower scores>
scoreboard players set required_flowers gm4_sm_flowers 12
scoreboard players operation required_flowers gm4_sm_flowers -= red_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= orange_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= white_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= pink_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= oxeye_daisy gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= dandelion gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= blue_orchid gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= allium gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= azure_bluet gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= poppy gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= cornflower gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= lily_of_the_valley gm4_sm_flowers
