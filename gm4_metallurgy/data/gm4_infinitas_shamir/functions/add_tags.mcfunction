
tag @s add gm4_has_infinitas

tag @s[advancements={gm4_infinitas_shamir:bucket_inventory_change={bucket=true}}] add gm4_has_empty_infinitas
# tag @s[advancements={gm4_infinitas_shamir:bucket_inventory_change={lava_bucket=true}}] add gm4_has_lava_infinitas
tag @s[advancements={gm4_infinitas_shamir:bucket_inventory_change={water_bucket=true}}] add gm4_has_water_infinitas

advancement revoke @s only gm4_infinitas_shamir:bucket_inventory_change

function gm4_infinitas_shamir:clock/active
