define_constants;
mpc = loadcase("anu.m");
% mpc.bus(:, QD) *= 1; 
sel = mpc.branch(:, TAP) == 0;
mpc.branch(sel, BR_X) *= 3;
mpc.branch(sel, RATE_A) = 0;
mpc.branch(sel, RATE_B) = 0;
mpc.branch(sel, RATE_C) = 0;
mpc = runpf(mpc);
savecase("anu_a.m", mpc);