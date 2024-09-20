# nvim-scss-variables

Replaces hex colors with a scss variable if it exists.

## Installation

### Lazy

`ripgrep` needs to be installed on your system.

```lua
{
  "joshddunn/nvim-scss-variables",
  config = function()
    require("nvim-scss-variables").setup()
  end
}
```
