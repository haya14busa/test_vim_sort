let s:suite = themis#suite('sort')
let s:assert = themis#helper('assert')

" return (x > y)
function! s:is_pos_more_equal(x, y)
    return (a:x[0] == a:y[0]) ? a:x[1] > a:y[1] : a:x[0] > a:y[0]
endfunction

function! s:sort_pos(pos_list)
    return sort(a:pos_list, 's:is_pos_more_equal')
endfunction

function! s:suite.offset()
    let xs = [[15, 4], [9, 1]]
    let sorted = [[9, 1], [15, 4]] 
    call s:assert.equals(s:sort_pos(xs), sorted)
endfunction
