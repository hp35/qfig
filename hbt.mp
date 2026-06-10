%%--------------------------------------------------------------------------
%% File:        hbt.mp [MetaPost]
%% Created:     20260523
%% Last change: 20260523
%% Description: MetaPost source code for a figure on a classic state-splitting
%%              beam splitter, created as a template for diploma workers
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
  al := 12u; % Length of arrows

  %
  % Draw the beam splitter in the Michelson interferometer.
  %
  draw (-w/2,-w/2)--(w/2,-w/2)--(w/2,w/2)--(-w/2,w/2)--(-w/2,-w/2);
  draw (-w/2,-w/2)--(w/2,w/2);

  %
  % Draw the light paths.
  %
  drawarrow ((0u,w/2+3u)--(0u,w/2+3u+al)) shifted (0u,0u);
  label.rt(btex $I_{{\rm out},1}$ etex,.5[(0u,w/2+3u),(0u,w/2+al+3u)]);
  drawarrow ((w/2+3u,0u)--(w/2+3u+al,0u)) shifted (0u,0u);
  label.bot(btex $I_{{\rm out},2}$ etex,.5[(w/2+3u,0),(w/2+al+3u,0)]);
  drawarrow (-w/2-3u-al,0u)--(-w/2-3u,0u);
  label.top(btex $I_{\rm in}$ etex,.5[(-w/2-3u-al,0u),(-w/2-3u,0u)]);

  %
  % Draw the top detector.
  %
  p:=(-w/4,-w/2-al-6u)--(w/4,-w/2-al-6u)..(0u,-w/2-al-6u-2.6u)
    ..(-w/4,-w/2-al-6u)--cycle;
  fill p rotated 180 withcolor .95[black,white];
  draw p rotated 180;
  label.top(btex detector etex,(0u,w/2+al+6u+2.6u));
  
  %
  % Draw the right detector.
  %
  p:=(-w/4,-w/2-al-6u)--(w/4,-w/2-al-6u)..(0u,-w/2-al-6u-2.6u)
    ..(-w/4,-w/2-al-6u)--cycle;
  fill p rotated 90 withcolor .95[black,white];
  draw p rotated 90;
  label.bot(btex detector etex,(0u,0u)) rotated 90 shifted (w/2+al+6u+2.6u,0u);
  
endfig;
end
