# Custom Crafters
This library, based upon the old Gamemode 4 Module of the same name, adds for a dropper-based custom crafter for custom item crafting purposes. The use of a dropper instead of a barrel ensures that the crafter can be used without a resource pack. Structured as a library, and gamemode 4 modules that require custom item crafting can include this library and come with the custom crafter features bundled. 

## How to Use
Custom Crafters have a function tag used to check recipes: `#gm4_custom_crafters:check_recipes`. Data packs should use this to set up recipes to be crafted in a custom crafter. Custom Crafters run every 16 ticks automatically checking for recipes and replacing them with their appropriate output.

Below is specific details in implementing a `check_recipes` function. Custom Crafters will only run recipe checks if all slots have the same item count.

### Check that no other recipes have been completed

`execute if score $crafted gm4_crafting matches 0 store result score $crafted gm4_crafting`
### Check the slot count
This should be set to the number of filled slots. For example if a recipe has 2 empty slots, the slot count should be 7 (9-2).

`if score $slot_count gm4_crafting matches <number>`

### Check the stack size
This should be set to the maximum count of the input items. For example if you have a recipe that will create 4 items for each single recipe (like log -> planks), then this should be set to `..16`, since 16*4 = 64, which is the maximum stack size for planks. This means only up to 16 items in each slot will work for this recipe.

`if score $stack_size gm4_crafting matches ..<number>`

### Check the Items
This checks the `Items` block data (moved to storage for efficiency), which represents the recipe input. Note that `Count` should not be checked here, since multi-crafting is supported by setting the `stack_size`

`if data storage gm4_custom_crafters:temp/crafter {Items:[<...>]}`

Note that the Custom Crafter automatically supports recipes placed anywhere in the grid, as long as the storage check assumes the recipe is inputted with alignment to the top-left. So for example, crafting a crafting table from planks will work in any 2x2 corner, but the storage check to check the items needs to check slots 0, 1, 3, and 4. The code will automatically shift the recipe in storage before the recipe checks are performed.

### Loot Replace
`run loot replace block ~ ~ ~ container.0 loot MODULE_NAMESPACE:crafting/RECIPE_NAME`

- afformentioned loot table:
```json
{
  "type": "minecraft:generic",
  "pools": [
    {
      "rolls": 8,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:air"
        }
      ]
    },
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:loot_table",
          "name": "LOOT_TABLE_TO_ITEM",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": "MULTIPLIER"
            }
          ]
        }
      ]
    }
  ]
}

```
- It is convention to put the recipe output in the last slot, but this loot table can be flexible, as long as it replaces all 9 slots. Loot tables pools are run in order, so multiple items can be outputted (such as emptying a water bucket and replacing it with an empty bucket).

### Set the Multiplier
When setting the outputs with the loot table, the count determines how much the item stack will be multiplied by. For example setting the count to 4 will output 4 of that item per recipe (like the log -> planks example from earlier).

## Recipe Check Function Example
```mcfunction
# 1 oak log -> 4 oak planks (shapeless)
execute if score $crafted gm4_crafting matches 0 store result score $crafted gm4_crafting if score $slot_count gm4_crafting matches 1 if score $stack_size gm4_crafting matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:oak_log"}]} run loot replace block ~ ~ ~ container.0 loot gm4_craft:crafting/oak_planks
```
In the example above, the stack size is 16 because 16 maximum input items * 4 output items per recipe = 64 total output items max.
