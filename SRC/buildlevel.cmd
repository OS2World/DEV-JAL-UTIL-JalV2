/* Create 'bldlevel.lnk' Wmake linker option file */

parse arg v s m .

if m = '' then do
  say 'Usage: BUILDLEVEL <version> <subversion> <minor>'
  return 1
end

BLD_HOST = value('HOSTNAME',,'OS2ENVIRONMENT')
BLD_VEND = 'Rob Hamerling'
BLD_VERS = v'.'s
BLD_SUB  = m
BLD_DATE = '20'date('O') time('N')
BLD_DESC = 'JalV2 compiler'
BLD_OPTS = '##1##' BLD_DATE '     'BLD_HOST'::EN::'BLD_SUB'::@@'
BLDLEVEL = '@#'BLD_VEND':'BLD_VERS'#@'BLD_OPTS||BLD_DESC

lnk = 'bldlevel.lnk'

if stream(lnk, 'c', 'query exists') \= '' then
  '@erase' lnk
call stream  lnk, "C", "Open Write"
call lineout lnk, "Option Description '"BLDLEVEL"'"
call stream  lnk, "C", "Close"

return 0

