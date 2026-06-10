%%--------------------------------------------------------------------------
%% File:        young.mp [MetaPost]
%% Created:     20260521
%% Last change: 20260521 (cleanup)
%% Description: MetaPost source code for a figure on the the classic Young's
%%              slit experiment, created as a template for diploma workers
%%              Edvin Lundberg and Joel Grenehed in their BSc Thesis.
%% Author:      Fredrik Jonsson <http://jonsson.eu>
%% Copyright:   No copyright whatsoever. Just use it.
%%--------------------------------------------------------------------------

u = 1mm;
defaultlinewidth = 1pt;

beginfig(1);
  pickup pencircle scaled defaultlinewidth;
  numeric t;
  pair pa, pb, pc, tangent, normal;
  path p;

  %
  % Draw the incident wave front.
  %
  arrowlength := 15u;
  pa := (0u,-15u);
  pb := (-5u,15u);
  pc := (.5[pa,pb]);
  p := pa{dir 150}..{dir 90}pc..{dir 70}pb;
  draw p;

  %
  % Draw two orthogonal arrows through the curve. (We do this in a loop
  % to avoid code replication.)
  %
  for t = 0.7 step 0.4 until 1.4:
    pa := point t of p;
    tangent := direction t of p;                % Tangent vector of path at t
    normal := unitvector(tangent rotated -90);  % Normal vector of path at t
    drawarrow (pa - (arrowlength/2)*normal)--(pa + (arrowlength/2)*normal);
  endfor;

  %
  % Draw the opaque screen with two slits.
  %
  pickup pencircle scaled 1.5defaultlinewidth;
  screenwidth:=40u;
  slitwidth:=2u;
  slitseparation:=10u;
  draw (20u,-screenwidth/2)--(20u,-slitseparation/2-slitwidth/2);
  draw (20u,-slitseparation/2+slitwidth/2)--(20u,slitseparation/2-slitwidth/2);
  draw (20u,slitseparation/2+slitwidth/2)--(20u,screenwidth/2);
  label.lft(btex $Q_1$ etex,(20u,slitseparation/2));
  label.lft(btex $Q_2$ etex,(20u,-slitseparation/2));
  label.bot(btex ${\cal A}$ etex,(20u,-screenwidth/2));

  %
  % Draw the detector screen.
  %
  pickup pencircle scaled defaultlinewidth;
  draw (60u,-screenwidth/2)--(60u,screenwidth/2);
  label.bot(btex ${\cal B}$ etex,(60u,-screenwidth/2));

  %
  % Draw the geometry of the two paths from the slits to the point P.
  %
  pa := (20u,slitseparation/2);   % Slit Q_1
  pb := (20u,-slitseparation/2);  % Slit Q_2
  pc := (60u,0.2screenwidth);     % Observation point P
  dotlabel.rt(btex $P$ etex, pc);
  draw pa--pc; label.top(btex $R_1$ etex, .5[pa,pc]);
  draw pb--pc; label.bot(btex $R_2$ etex, .5[pb,pc]);

endfig;
end
