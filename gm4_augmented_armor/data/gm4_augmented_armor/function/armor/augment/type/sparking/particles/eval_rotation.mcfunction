# rotate particles around the entity based on a score
# @s = entity with a lightning charge
# at @s rotaed ~x ~
# run from weapon/modifier/lightning/tick

$execute rotated ~$(deg) ~ run function gm4_augmented_armor:armor/augment/type/sparking/particles/display with storage gm4_augmented_armor:temp lightning
