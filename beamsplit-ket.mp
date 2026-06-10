%%--------------------------------------------------------------------------
%% File:        beamsplit-ket.mp [MetaPost]
%% Created:     20260525
%% Last change: 20260525
%% Description: MetaPost source code for a figure on a classic beam splitter,
%%              created as a template for diploma workers Edvin Lundberg and
%%              Joel Grenehed in their BSc Thesis.
%% Author:      Fredrik Jonsson <http://jonsson.eu>
%% Copyright:   No copyright whatsoever. Just use it.
%%--------------------------------------------------------------------------

u = 1mm;
defaultlinewidth = 1pt;

beginfig(1);
  pickup pencircle scaled defaultlinewidth;

  w := 20u;  % Edge length of splitter
  al := 10u; % Length of arrows
  draw (-w/2,-w/2)--(w/2,-w/2)--(w/2,w/2)--(-w/2,w/2)--(-w/2,-w/2);
  draw (-w/2,-w/2)--(w/2,w/2);
  drawarrow (0u,w/2+3u)--(0u,w/2+3u+al);
  label.rt(btex $|1\rangle$ etex,.5[(0u,w/2+3u),(0u,w/2+3u+al)]);
  drawarrow (0u,-w/2-3u-al)--(0u,-w/2-3u);
  label.rt(btex $|1\rangle$ etex,.5[(0u,-w/2-3u-al),(0u,-w/2-3u)]);
  drawarrow (w/2+3u,0u)--(w/2+3u+al,0u);
  label.top(btex $|0\rangle$ etex,.5[(w/2+3u,0u),(w/2+3u+al,0u)]);
  drawarrow (-w/2-3u-al,0u)--(-w/2-3u,0u);
  label.top(btex $|0\rangle$ etex,.5[(-w/2-3u-al,0u),(-w/2-3u,0u)]);

endfig;
end
