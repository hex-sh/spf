Definitions.

VERSION     = v=spf1
QUALIFIER   = [+\-?~]
MECHANISM   = all|include|a(/|:)?|mx|ptr|ip4:|ip6:|exists
MODIFIER    = redirect|explaination
IP_4        = [0-9./]+
IP_6        = [0-9A-Fa-f/:]+
DOMAIN_SPEC = [\w._]+
WHITESPACE  = [\s]

Rules.

{VERSION}     : {token, {version,     TokenLine, TokenChars}}.
{QUALIFIER}   : {token, {qualifier,   TokenLine, list_to_atom(TokenChars)}}.
{MECHANISM}   : {token, {mechanism,   TokenLine, mechanism_to_atom(TokenChars)}}.
{MODIFIER}    : {token, {modifier,    TokenLine, list_to_atom(TokenChars)}}.
{IP_4}        : {token, {ip4,         TokenLine, TokenChars}}.
{IP_6}        : {token, {ip6,         TokenLine, TokenChars}}.
{DOMAIN_SPEC} : {token, {domain_spec, TokenLine, TokenChars}}.
=             : {token, {'=',         TokenLine}}.
{WHITESPACE}+ : skip_token.

Erlang code.

mechanism_to_atom(Mechanism) ->
  M1 = string:strip(Mechanism, both, $:),
  M2 = string:strip(M1, both, $/),
  list_to_atom(M2).
