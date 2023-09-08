# Initially run as player who earned bucket_inventory_change advancement
# run from gm4_infinitas_shamir:add_tags or scheduled from self

execute as @a[tag=gm4_has_infinitas] run function gm4_infinitas_shamir:clock/inventory_check

execute if entity @a[tag=gm4_has_infinitas,limit=1] run schedule function gm4_infinitas_shamir:clock/active 1t
