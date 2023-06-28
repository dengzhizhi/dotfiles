" This is a playground for vimscript that needs to use `source %` to load

" like easy motion {{{
let s:easymotion_key=['j','l','k','h','a','s','d','f','g','q','w','e','r','u','i','o','p','c','v','b','n','m','t','y','z','x']
let s:easymotion_leader=[';',',',' ',"'",'.','/','[','\',']']|let s:easymotion_leader_dict={';':0,',':0,'.':0,"'":0,' ':0,'/':0,'[':0,'\':0,']':0}
func! EasyMotion()abort
	echo "input key:"|let ch=nr2char(getchar())|let s:easymotion={}|let llen=len(s:easymotion_leader)+1
	let ch=tolower(ch)|if ch>='a'&&ch<='z'|let up=toupper(ch)|else|let up=""|endif
	let info=winsaveview()|let info["endline"]=winheight(0)+info["topline"]|let width=winwidth(0)|let num=0|let old=ch|let pos=0|let klen=len(s:easymotion_key)
	if ch=="\<c-[>"|return|endif|if &fen|setlocal nofen|endif
	let lines=getbufline("%",info["topline"],info["endline"])|let bak=copy(lines)|set nohlsearch
	let hlcomment=[]|let begin=info["topline"]|let end=info["endline"]
	while end-begin>=8|call add(hlcomment,matchaddpos("comment",range(begin,end)))|let begin+=8|endwhile
	call add(hlcomment,matchaddpos("comment",range(begin,end)))
	let listl=range(0,len(lines)-1)|let nowline=info["lnum"]-info["topline"]|call sort(listl,{arg1,arg2 -> abs(arg2-nowline)-abs(arg1-nowline)})
	for i in listl
		" if i+info["topline"]==info["lnum"]|continue|endif
		while 1
			let pos=stridx(lines[i],ch,pos)
			if up!=""|let postemp=stridx(lines[i],up,pos)|if postemp!=-1&&(postemp<pos||pos==-1)|let pos=postemp|endif|endif
			if pos!=-1&&(pos<width||&wrap)
				if num<klen|let req=s:easymotion_key[num]
				elseif num<llen*klen|let req=s:easymotion_leader[num/klen-1].s:easymotion_key[num%klen]
				else|break
				endif
				let m= matchaddpos("incsearch", [[i+info["topline"],pos+1,len(req)]])
				let s:easymotion[req]={"line":i,"pos":pos,"hl":m}
				let lines[i]=strpart(lines[i],0,pos).req.strpart(lines[i],pos+len(req))
				let num+=1|let pos+=2|if num>=llen*klen|break|endif
			else|let pos=0|break
			endif
		endwhile
		if num>=llen*klen|break|endif
	endfor
	if len(s:easymotion)==0|echo "cannot find"|endif
	silent! undojoin|call setline(info["topline"],lines)|redraw!|echo "target key:"| let ch=nr2char(getchar())
	if has_key(s:easymotion_leader_dict,ch)|let ch=ch.nr2char(getchar())|endif
	if has_key(s:easymotion, ch)|let temp=s:easymotion[ch]|call cursor(temp["line"]+info["topline"],temp["pos"]+1)|endif
	for [key,val] in items(s:easymotion)|let i=val["line"]|let pos=val["pos"]|let hl=val["hl"]|call matchdelete(hl)|endfor
	for hlnow in hlcomment|call matchdelete(hlnow)|endfor
	silent! undojoin|call setline(info["topline"],bak)|setlocal nomodified
endfunc

" edit binrary
func! s:BinraryEdit(args) abort
	if join(readfile(expand('%:p'), 'b', 5), '\n') !~# '[\x00-\x08\x10-\x1a\x1c-\x1f]\{2,}'
		echo "not a bin file"|return
	endif
	if &readonly|execute ":edit ++bin".expand('%')|endif|setlocal bin
	setlocal bin
	if !executable('xxd')|echoerr "xxd not find,install it first"|return|endif
	echo "transform...please wait..."
	let g:xxd_cmd=":%!xxd ".a:args
	silent! execute g:xxd_cmd|let &modified=0|redraw!
	augroup Binrary
		au!
		autocmd BufWritePre  <buffer> let g:bin_pos_now=getcurpos()|silent! exec ":%!xxd -r"
		autocmd BufWritePost <buffer> silent! exec g:xxd_cmd|call cursor([g:bin_pos_now[1],g:bin_pos_now[2]])
		autocmd BufDelete    <buffer> au! Binrary
	augroup END
endfunc
command! -nargs=? Binrary :call <sid>BinraryEdit(<q-args>)

xmap g/ "sy/\V<c-r>=@s<cr>

" 打开最近关闭的buffer
let g:map_recent_close={}
func! s:GetRecentClose()
	let s:list=[]
	for [key,value] in items(g:map_recent_close)
		let value['filename']=key
		call insert(s:list,value)
	endfor
	let s:func={m1,m2 -> m1['time']>m2['time']?-1:1}
	call sort(s:list,s:func)
	call setqflist(s:list,'r')
	copen
endfunc
nnoremap <silent><nowait><space>q :call <sid>GetRecentClose()<cr>

" set mouse
func MouseConfig()
	set mouse=a
	set mousemodel=popup_setpos
	" you can define menu self
	" visual model
	vnoremenu PopUp.Yank\ Text "+y
	vnoremenu PopUp.Cut\ Text "+d
	vnoremenu PopUp.Del\ Text "_d
	vnoremenu PopUp.Paste\ Text "+p
	" normal model
	nnoremenu PopUp.Paste\ Text "+p
	nnoremenu PopUp.Select\ All ggVG
	nnoremenu PopUp.Back\ Pos <c-o>zz
	nnoremenu PopUp.Next\ Pos <c-i>zz
	" fold
	nnoremenu PopUp.Open\ Fold  zO
	nnoremenu PopUp.Close\ Fold zC
	" close
	nnoremenu PopUp.-Sep- :<cr>
	nnoremenu PopUp.Close\ Mouse :set mouse=""<cr>
endfunc
call MouseConfig() " default set mouse enable
nnoremap <silent><nowait>=m :call MouseConfig()<cr>
nnoremap <silent><nowait>\m :set mouse=""<cr>
