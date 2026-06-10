%%--------------------------------------------------------------------------
%% File:        michelson.mp [MetaPost]
%% Created:     20260523
%% Last change: 20260523
%% Description: MetaPost source code for a figure on a classic Michelson
%%              interferometer, created as a template for diploma workers
%%              Edvin Lundberg and Joel Grenehed in their BSc Thesis.
%% Author:      Fredrik Jonsson <http://jonsson.eu>
%% Copyright:   No copyright whatsoever. Just use it.
%%--------------------------------------------------------------------------

u = 1mm;
defaultlinewidth = 1pt;

beginfig(1);
  path p;
  pickup pencircle scaled defaultlinewidth;
  w := 16u;  % Edge length of splitter
  al := 18u; % Length of arrows

  %
  % Draw the beam splitter in the Michelson interferometer.
  %
  draw (-w/2,-w/2)--(w/2,-w/2)--(w/2,w/2)--(-w/2,w/2)--(-w/2,-w/2);
  draw (-w/2,-w/2)--(w/2,w/2);

  %
  % Draw the light paths.
  %
  drawarrow ((0u,w/2+3u)--(0u,w/2+3u+al)) shifted (-1u,0u);
  drawarrow reverse ((0u,w/2+3u)--(0u,w/2+3u+al)) shifted (1u,0u);
  drawarrow reverse ((0u,-w/2-3u-al)--(0u,-w/2-3u));
  label.rt(btex $E_{\rm out}$ etex,.5[(0u,-w/2-3u-al),(0u,-w/2-3u)]);
  drawarrow ((w/2+3u,0u)--(w/2+3u+al,0u)) shifted (0u,1u);
  drawarrow reverse ((w/2+3u,0u)--(w/2+3u+al,0u)) shifted (0u,-1u);
  drawarrow (-w/2-3u-al,0u)--(-w/2-3u,0u);
  label.top(btex $E_{\rm in}$ etex,.5[(-w/2-3u-al,0u),(-w/2-3u,0u)]);

  %
  % Draw the top mirror.
  %
  pickup pencircle scaled 2defaultlinewidth;
  draw (-w,w/2+al+6u)--(w,w/2+al+6u);
  label.top(btex mirror etex,(0u,w/2+al+6u));

  %
  % Draw the right mirror.
  %
  pickup pencircle scaled 2defaultlinewidth;
  draw (w/2+al+6u,-w)--(w/2+al+6u,w);
  label.bot(btex mirror etex,(0u,0u)) rotated 90 shifted (w/2+al+6u,0u);

  %
  % Draw the detector.
  %
  pickup pencircle scaled defaultlinewidth;
  p:=(-w/4,-w/2-al-6u)--(w/4,-w/2-al-6u)..(0u,-w/2-al-6u-2.6u)
    ..(-w/4,-w/2-al-6u)--cycle;
  fill p withcolor .95[black,white];
  draw p;
  label.bot(btex detector etex,(0u,-w/2-al-6u-2.6u));
  
endfig;
end
