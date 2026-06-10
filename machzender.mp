%%--------------------------------------------------------------------------
%% File:        machzender.mp [MetaPost]
%% Created:     20260523
%% Last change: 20260523
%% Description: MetaPost source code for a figure on a classic Mach-Zender
%%              interferometer, created as a template for diploma workers
%%              Edvin Lundberg and Joel Grenehed in their BSc Thesis.
%% Author:      Fredrik Jonsson <http://jonsson.eu>
%% Copyright:   No copyright whatsoever. Just use it.
%%--------------------------------------------------------------------------

u = 1mm;
defaultlinewidth = 1pt;

beginfig(1);
  path pa, pb;
  pickup pencircle scaled defaultlinewidth;
  w := 12u;  % Edge length of splitter
  al := 12u; % Length of arrows
  bsshift := 40u;  % Lateral shift between beam splitters
  mirrlen := 20u;  % Length of each mirror

  %
  % Draw the first beam splitter in the Mach-Zender interferometer.
  %
  pa := (-w/2,-w/2)--(w/2,-w/2)--(w/2,w/2)--(-w/2,w/2)--(-w/2,-w/2);
  pb := (-w/2,-w/2)--(w/2,w/2);
  draw pa shifted (-bsshift,-bsshift);
  draw pb shifted (-bsshift,-bsshift);

  %
  % Draw the second beam splitter in the Mach-Zender interferometer.
  %
  draw pa shifted (0u,0u);
  draw pb shifted (0u,0u);

  %
  % Draw the 45-degree slanted mirrors.
  %
  pickup pencircle scaled 2defaultlinewidth;
  pa := ((-mirrlen/2,0u)--(mirrlen/2,0u)) rotated 45;
  draw pa shifted (-bsshift,0u);
  draw pa shifted (0u,-bsshift);
  label.top(btex mirror etex,(0u,0u)) rotated 45 shifted (-bsshift,0u);
  label.bot(btex mirror etex,(0u,0u)) rotated 45 shifted (0u,-bsshift);

  %
  % Draw the light paths.
  %
  pickup pencircle scaled defaultlinewidth;
  drawarrow ((0u,w/2+3u)--(0u,w/2+3u+al)) shifted (0u,0u);
  label.rt(btex $E_{{\rm out},1}$ etex,.5[(0u,w/2+3u),(0u,w/2+al+3u)]);
  drawarrow ((w/2+3u,0u)--(w/2+3u+al,0u)) shifted (0u,0u);
  label.bot(btex $E_{{\rm out},2}$ etex,.5[(w/2+3u,0),(w/2+al+3u,0)]);
  drawarrow ((-w/2-3u-al,0u)--(-w/2-3u,0u)) shifted (-bsshift,-bsshift);
  label.top(btex $E_{\rm in}$ etex,.5[(-w/2-3u-al,0u),(-w/2-3u,0u)])
    shifted (-bsshift,-bsshift);
  drawarrow (-bsshift,-bsshift+al/2+3u)--(-bsshift,0u)--(-w/2-3u,0u);
  drawarrow (-bsshift+al/2+3u,-bsshift)--(0u,-bsshift)--(0u,-w/2-3u);

  %
  % Draw the top detector.
  %
  pa:=(-w/4,-w/2-al-6u)--(w/4,-w/2-al-6u)..(0u,-w/2-al-6u-2.6u)
    ..(-w/4,-w/2-al-6u)--cycle;
  fill pa rotated 180 withcolor .95[black,white];
  draw pa rotated 180;
  label.top(btex detector etex,(0u,w/2+al+6u+2.6u));
  
  %
  % Draw the right detector.
  %
  pa:=(-w/4,-w/2-al-6u)--(w/4,-w/2-al-6u)..(0u,-w/2-al-6u-2.6u)
    ..(-w/4,-w/2-al-6u)--cycle;
  fill pa rotated 90 withcolor .95[black,white];
  draw pa rotated 90;
  label.bot(btex detector etex,(0u,0u)) rotated 90 shifted (w/2+al+6u+2.6u,0u);
  
endfig;
end
