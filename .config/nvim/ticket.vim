" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}

" The last line takes effect as default ticket
"

" Oncall tasks {{{
let g:ticket="Oncall-01"     "Investigate add-gadget error rate increase
let g:ticket="Oncall-02"     "Investigate view dashboard (shell) error rate increase
let g:ticket="Oncall-03"     "Investigate search dashboard by name error rate increase
let g:ticket="Oncall-04"     "Investigate Metal event not matching BM3 events
"}}}
" Library Researches {{{
let g:ticket="React-01"      "React source research
"}}}
" Temporary tasks (Disturbed, etc) {{{
let g:ticket="Daily-01"       "Investigate dashboard 10k-20k performance regression
let g:ticket="Disturbed-001"  "Investigate Connect gadget metrics regression (JDAG-1143)
let g:ticket="Disturbed-002"  "Compiled style QA demo
let g:ticket="Disturbed-003"  "Confluence Statics gadget timeout issue
let g:ticket="Disturbed-004"  "Investigate gadget API regression 21 Feb 2022
let g:ticket="TT-001"         "Dashboard Dev Extension
let g:ticket="TT-002"         "Investigate negative gadgetStartRender
let g:ticket="TT-003"         "20% Time - Investigate Slow TTI user group
let g:ticket="TT-004"         "Investigate metrics gap between old and new BM3
let g:ticket="TT-005"         "Investigate dashboard metrics volume drop after BM3 release
let g:ticket="TT-008"         "Investigate bundle size drop since 20 Jan 2022
let g:ticket="TT-010"         "Investigate Compiled style regression in dashboard
let g:ticket="TT-011"         "Investigate dashboard regression since 04 Feb 2022
let g:ticket="TT-012"         "Build some reusable generic splunk dashbaords
"}}}
" Backlog Grooming {{{
let g:ticket="BG-001"        "Backlog grooming 2022-02-09
"}}}

" Current
let g:ticket="TT-012"         "Build some reusable generic splunk dashbaords
