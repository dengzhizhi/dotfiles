local navigator = {
    prefix = '<C-CR>',

    d = {
	name = '+harpoon|git|fold',
	f = {
	    name = '+harpoon',
	    j = {':lua require("harpoon.mark").add_file()', 'mark-current'},
	    k = {':lua require("harpoon.ui").toggle_quick_menu()', 'show-picker'},
	    ['1'] = {':<c-u>lua require("harpoon.ui").nav_file(1)', 'file-1'},
	    ['2'] = {':<c-u>lua require("harpoon.ui").nav_file(2)', 'file-2'},
	    ['3'] = {':<c-u>lua require("harpoon.ui").nav_file(3)', 'file-3'},
	    ['4'] = {':<c-u>lua require("harpoon.ui").nav_file(4)', 'file-4'},
	    ['5'] = {':<c-u>lua require("harpoon.ui").nav_file(5)', 'file-5'},
	},
	d = {
	    name = '+fold',
	    v = {'<key>\\zv', 'fold-except-selection'},
	    j = {'<key><space>ddj<space>', 'fold-to-current-level'},
	    k = {'<key><space>ddk<space>', 'decrease-fold-level'},
	    l = {'<key><space>ddl<space>', 'increase-fold-level'},
	    u = {'<key><space>ddu<space>', 'fold-all-and-reveal-cursor'},
	    i = {'<key><space>ddi<space>', 'fold-by-last-search'},
	    I = {'<key><space>ddii<space>', 'fold-by-current-word'},
	    o = {'<key><space>ddo<space>', 'fold-except-selection'},
	    [";"] = {'<key><space>dd;<space>', 'fold-by-syntax'},
	    t = {'<key><space>ddt<space>', 'fold-by-treesitter'},
	    h = {'<key><space>ddh<space>', 'fold-vim-help-file'},
	},
	s = {
	    name = '+git',
	    j = {'<key><space>dsj<space>', 'show-file-log-20'},
	    J = {'<key><space>dsjj<space>', 'show-file-log-all'},
	    l = {
		name = '+Gclog',
		l = {'<key><space>dsjj<space>', 'Gclog'},
		k = {'<key><space>dskl<space>', 'Gclog-20'},
	    },
	    k = {'<key><space>dsk<space>', 'diff-to-current'},
	    K = {
		name = '+difftastic',
		K = {'<key><space>dskk<space>', 'difft'},
		k = {'<key><space>dskkk<space>', 'difft-unify'},
	    },
	    s = {
		name = '+smerge',
		d = {'<key><space>dssd<space>', 'smerge-diff-to-current'},
		m = {'<key><space>dssm<space>', 'smerge-log-project'},
		j = {'<key><space>dssj<space>', 'smerge-log-current'},
		b = {'<key><space>dssb<space>', 'smerge-blame'},
	    },
	    t = {
		name = '+tools',
		m = {'<key><space>dstm<space>', 'meld-diff-to-current'},
		k = {'<key><space>dstk<space>', 'kdiff3-diff-to-current'},
	    },
	    u = {'<key><space>dsu<space>', 'git blame'},
	    i = {'<key><space>dsi<space>', 'find-cword-change'},
	}
    },
    e = {
	name = '+easyalign|leaderf',
	a = {
	    name = '+easyalign',
	    f = {'<key><space>eaf<space>', 'easyalign'},
	    r = {'<key><space>ear<space>', 'easyalign-regex'},
	},
	f = {
	    name = '+leaderf',
	    j = {'<key><space>efj<space>', 'search-cword'},
	    J = {'<key><space>efjj<space>', 'search-word-exclude-test'},
	    h = {'<key><space>efh<space>', 'search-word-fill-cword'},
	    k = {'<key><space>efk<space>', 'search-word'},
	    K = {'<key><space>efjk<space>', 'leaderf-recall'},
	    l = {'<key><space>efl<space>', 'buffers'},
	    u = {'<key><space>efu<space>', 'search-cword-in-buffer'},
	    i = {'<key><space>efi<space>', 'search-word-in-buffer'},
	    [";"] = {'<key><space>ef;<space>', 'command-history'},
	    ["/"] = {'<key><space>ef/<space>', 'search-history'},
	    I = {'<key><space>efui<space>', 'search-in-buffer-recall'},
	    o = {'<key><space>efo<space>', 'MRU'},
	},
    },
    f = {
	name = '+highlight|filter|telescope',
	d = {
	    name = '+highlight',
	    j = {'<key><space>fdj<space>', 'highlight-word'},
	    k = {'<key><space>fdk<space>', 'highlight-pattern'},
	    l = {'<key><space>fdl<space>', 'clear-all'},
	    i = {'<key><space>fdi<space>', 'clear-word'},
	    u = {'<key><space>fdu<space>', 'previous-word'},
	    o = {'<key><space>fdo<space>', 'next-word'},
	    U = {'<key><space>fdU<space>', 'previous-highlight'},
	    O = {'<key><space>fdO<space>', 'next-highlight'},
	    h = {'<key><space>fdh<space>', 'hydrad-highlight-submode'},
	},
	f = {
	    name = '+filter',
	    j = {
		name = '+jq|js',
		q = {'<key><space>jq<space>', 'jq'},
		s = {
		    ["<cr>"] = {'<key><space>jqs<space>', 'jq -S'},
		    ["<space>"] = {'<key><space>jqs<space>', 'jq -S'},
		    s = {'<key><space>fjs<space>', 'js-beautify'}
		},
		f = {'<key><space>jqf<sapce>', 'jq-with-syntax-fold'},
	    },
	    q = {'<key><space>fsql<space>', 'sqlformat'},
	    x = {'<key><space>fxml<space>', 'xmllint'},
	    h = {'<key><space>fhtm<space>', 'tidy-html'},
	    e = {'<key><space>decs<space>', 'unescape-string'},
	    c = {'<key><space>fcss<space>', 'css-beautify'},
	    p = {'<key><space>fpy<space>', 'python'},
	    u = {
		name = '+url',
		d = {'<key><space>decu<space>', 'decode-url'},
		e = {'<key><space>encu<space>', 'encode-url'},
	    },
	},
	e = {
	    name = '+telescope',
	    f = {
		name = 'telescope',
		j = {'<key><space>fefj<space>', 'find-files'},
		k = {'<key><space>fefk<space>', 'live-grep'},
		b = {'<key><space>fefb<space>', 'live-grep-buffers'},
		u = {'<key><space>fefu<space>', 'file-browser'},
		l = {'<key><space>fefl<space>', 'buffers'},
		h = {'<key><space>fefh<space>', 'vim-help'},
		p = {'<key><space>fefp<space>', 'document-symbols'},
		i = {'<key><space>fefp<space>', 'diagnostics'},
		m = {'<key><space>fefm<space>', 'marks'},
		f = {'<key><space>feff<space>', 'fecency'},
		o = {'<key><space>fefo<space>', 'symbols-outline'},
		O = {'<key><space>fefO<space>', 'symbols-outline-close'},
	    },
	},
    },
    i = {
	name = '+IDE',
	d = {
	    name = '+IDE',
	    C = {'<key><space>idcc<space>', 'open-link-in-vscode'},
	    c = {'<key><space>idc<space>', 'open-file-in-vscode'},
	    W = {'<key><space>idww<space>', 'open-link-in-webstorm'},
	    w = {'<key><space>idw<space>', 'open-file-in-webstorm'},
	    E = {'<key><space>idee<space>', 'open-link-in-idea'},
	    e = {'<key><space>ide<space>', 'open-file-in-idea'},
	    S = {'<key><space>idss<space>', 'open-link-in-sublime'},
	    s = {'<key><space>ids<space>', 'open-file-in-sublime'},
	    p = {'<key><space>idp<space>', 'open-file-in-pycharm'},
	    v = {'<key><space>vin<space>', 'open-file-in-kitty-vim'},
	},
    },
    j = {
	name = '+telescope',
	i = {
	    name = '+telescope',
	    j = {
		name = '+telescope',
		s = {'<key><space>jijs<space>', 'git-status'},
		f = {'<key><space>jijf<space>', 'jump-list'},
		c = {'<key><space>jijc<space>', 'command-history'},
		v = {'<key><space>jijv<space>', 'search-history'},
		z = {'<key><space>jijz<space>', 'spell-suggest'},
		t = {'<key><space>jijt<space>', 'treesitter'},
		b = {'<key><space>jijb<space>', 'bookmarks'},
		r = {'<key><space>jijr<space>', 'resume'},
	    },
	},
    },
    l = {
	name = '+telescope-lsp',
	s = {
	    name = '+telescope-lsp',
	    j = {'<key><space>lsj<space>', 'doc-symbols'},
	    k = {'<key><space>lsk<space>', 'definitions'},
	    l = {'<key><space>lsl<space>', 'type-definitions'},
	    u = {'<key><space>lsu<space>', 'references'},
	    i = {'<key><space>lsi<space>', 'incoming-calls'},
	    o = {'<key><space>lsi<space>', 'outgoing-calls'},
	    p = {'<key><space>lsp<space>', 'workspace-symbols'},
	},
    },
    p = {
	name = '+file',
	f = {'<key><space>pf<space>', 'leader-file'},
    },
    ["<CR>"] = {
	name = '+dict|open|hydra',
	d = {
	    name = '+dict',
	    d = {'<key>,dd', 'dict-current-word'},
	    v = {'<key>,dv', 'dict-vert-current-word'},
	    t = {'<key>,dt', 'dict-tab-current-word'},
	    r = {'<key>,dr', 'pronounce-current-word'},
	    R = {'<key>,dR', 'open-word-book'},
	    G = {'<key>,dG', 'open-game-word-book'},
	    f = {'<key>,df', 'fold-explaination'},
	    n = {'<key>,dn', 'next-book'},
	    p = {'<key>,dp', 'previous-book'},
	},
	h = {
	    name = '+hydra',
	    b = {'<key>;b', 'manage-buffer'},
	    h = {
		name = '+single-hand',
		l = {'<key><space>ddd<space>', 'left-hand'},
		r = {'<key><space>kkk<space>', 'right-hand'},
	    },
	    v = {'<key><space>dd<space>', 'Venn'},
	    n = {'<key><space>np<space>', 'NoNeckPain'},
	    h = {'<key><space>fdh<space>', 'Highlight'},
	},
	o = {
	    name = '+open',
	    t = {'<key>,tt', 'tickets'},
	    q = {'<key>,tq', 'saved-macros'},
	    c = {'<key>,tc', 'commands.vim'},
	    k = {'<key>,tk', 'mappings.vim'},
	    p = {'<key>,tp', 'plugins.lua'},
	    f = {'<key>,tff', 'preset-commands.vim'},
	    s = {
		name = '+scratch|shortcut',
		v = {'<key>,tfs', 'vim'},
		l = {'<key>,tfl', 'lua'},
		s = {'<key>,ts', 'shortcut-table'},
	    },
	    b = {'<key>,tb', 'bookmarks'},
	    n = {'<key>,tn', 'quick-notes'},
	    h = {'<key>,th', 'open-in-help-buffer'},
	    N = {'<key>,tN', 'open-vim-navigator-config'},
	}
    },
    s = {
	name = '+neotree',
	o = {'<key><space>so<space>', 'Toggle Tree'},
	i = {'<key><space>si<space>', 'Reveal file'},
	u = {'<key><space>su<space>', 'Left focus'},
	f = {'<key><space>suu<space>', 'Float focus'},
	c = {'<key><space>sui<space>', 'Close'},
	b = {'<key><space>sii<space>', 'Reveal in buffers'},
	g = {'<key><space>sgd<space>', 'Reveal file under cursor'},
	p = {'<key><space>scp<space>', 'Copy file path'},
    },
}
vim.g.navigator_normal = navigator
vim.g.navigator_popup = 1

vim.keymap.set( 'n', '<C-CR>', '<cmd>Navigator g:navigator_normal<cr>', {silent=true})
vim.keymap.set( 'x', '<C-CR>', '<cmd>NavigatorVisual g:navigator_normal<cr>', {silent=true})