local cmp = require('cmp')
local cmp_buffer = require('cmp_buffer')

cmp.setup({
  sorting = {
    comparators = {
      function(...) return cmp_buffer:compare_locality(...) end,
    }
  }
})
