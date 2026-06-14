# refresh the consumable component on maces
execute as @a[predicate=gm4_blasting_maces:mace_needs_consumable] run function gm4_blasting_maces:mace/add_consumable
execute as @a[predicate=gm4_blasting_maces:mace_needs_consumable_removed] run function gm4_blasting_maces:mace/remove_consumable

# reschedule
schedule function gm4_blasting_maces:main 16t
