require("neo-tree").setup({
    -- Too much noise
    enable_diagnostics = false,
    enable_git_status = false,
    use_popups_for_input = false,
    -- Remove Icons
    default_component_configs = {
        icon = {
          folder_closed = "+",
          folder_open = "-",
          folder_empty = "-",
          default = " ",
        }
    }
})
