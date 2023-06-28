local insx = require('insx')
local esc = insx.helper.regex.esc

-- Endwise (experimental).
local endwise = require('insx.recipe.endwise')
insx.add('<CR>', endwise(endwise.builtin))

-- Quotes
for open, close in pairs({
    ["'"] = "'",
    ['"'] = '"',
    ['`'] = '`',
}) do
    -- Auto pair.
    insx.add(open, require('insx.recipe.auto_pair')({
	open = open,
	close = close,
	ignore_pat = [[\\\%#]],
    }))

    -- Jump next.
    insx.add(close, require('insx.recipe.jump_next')({
	jump_pat = {
	    [[\%#]] .. esc(close) .. [[\zs]]
	}
    }))

    -- Delete pair.
    insx.add('<BS>', require('insx.recipe.delete_pair')({
	open_pat = esc(open),
	close_pat = esc(close),
    }))
end

-- Pairs.
for open, close in pairs({
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['<'] = '>',
}) do
    -- Auto pair.
    insx.add(open, require('insx.recipe.auto_pair')({
	open = open,
	close = close,
    }))

    -- Jump next.
    insx.add(close, require('insx.recipe.jump_next')({
	jump_pat = {
	    [[\%#]] .. esc(close) .. [[\zs]]
	}
    }))

    -- Delete pair.
    insx.add('<BS>', require('insx.recipe.delete_pair')({
	open_pat = esc(open),
	close_pat = esc(close),
    }))

    -- Increase/decrease spacing.
    insx.add('<Space>', require('insx.recipe.pair_spacing').increase({
	open_pat = esc(open),
	close_pat = esc(close),
    }))
    insx.add('<BS>', require('insx.recipe.pair_spacing').decrease({
	open_pat = esc(open),
	close_pat = esc(close),
    }))

    -- Break pairs: `(|)` -> `<CR>` -> `(<CR>|<CR>)`
    insx.add('<CR>', require('insx.recipe.fast_break')({
	open_pat = esc(open),
	close_pat = esc(close),
    }))

    -- Wrap next token: `(|)func(...)` -> `)` -> `(func(...)|)`
    insx.add('<C-;>', require('insx.recipe.fast_wrap')({
	close = close
    }))
end

-- Remove HTML Tag: `<div>|</div>` -> `<BS>` -> `|`
insx.add('<BS>', require('insx.recipe.delete_pair')({
    open_pat = insx.helper.search.Tag.Open,
    close_pat = insx.helper.search.Tag.Close,
}))

-- Break HTML Tag: `<div>|</div>` -> `<BS>` -> `<div><CR>|<CR></div>`
insx.add('<CR>', require('insx.recipe.fast_break')({
    open_pat = insx.helper.search.Tag.Open,
    close_pat = insx.helper.search.Tag.Close,
}))
