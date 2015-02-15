%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                                                                  %%%%%
%%%%      NICTA Energy System Test Case Archive (NESTA) - v0.1.5      %%%%%
%%%%            Optimal Power Flow - Active Power Increase            %%%%%
%%%%                       30 - October - 2014                        %%%%%
%%%%                                                                  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mpc = nesta_case39_epri__api
mpc.version = '2';
mpc.baseMVA = 100.0;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
	1	 1	 161.00	 44.20	 0.0	 0.0	 2	     1.0394	   -13.5366	 345.0	 1	     1.0600	     0.9400;
	2	 1	 0.00	 0.00	 0.0	 0.0	 2	     1.0485	    -9.7853	 345.0	 1	     1.0600	     0.9400;
	3	 1	 531.16	 2.40	 0.0	 0.0	 2	     1.0307	   -12.2764	 345.0	 1	     1.0600	     0.9400;
	4	 1	 824.78	 184.00	 0.0	 0.0	 1	     1.0045	   -12.6267	 345.0	 1	     1.0600	     0.9400;
	5	 1	 0.00	 0.00	 0.0	 0.0	 1	     1.0060	   -11.1923	 345.0	 1	     1.0600	     0.9400;
	6	 1	 0.00	 0.00	 0.0	 0.0	 1	     1.0082	   -10.4083	 345.0	 1	     1.0600	     0.9400;
	7	 1	 385.67	 84.00	 0.0	 0.0	 1	     0.9984	   -12.7556	 345.0	 1	     1.0600	     0.9400;
	8	 1	 861.07	 176.60	 0.0	 0.0	 1	     0.9979	   -13.3358	 345.0	 1	     1.0600	     0.9400;
	9	 1	 6.50	 -66.60	 0.0	 0.0	 1	     1.0383	   -14.1784	 345.0	 1	     1.0600	     0.9400;
	10	 1	 0.00	 0.00	 0.0	 0.0	 1	     1.0178	    -8.1709	 345.0	 1	     1.0600	     0.9400;
	11	 1	 0.00	 0.00	 0.0	 0.0	 1	     1.0134	    -8.9370	 345.0	 1	     1.0600	     0.9400;
	12	 1	 14.07	 88.00	 0.0	 0.0	 1	     1.0008	    -8.9988	 345.0	 1	     1.0600	     0.9400;
	13	 1	 0.00	 0.00	 0.0	 0.0	 1	     1.0149	    -8.9299	 345.0	 1	     1.0600	     0.9400;
	14	 1	 0.00	 0.00	 0.0	 0.0	 1	     1.0123	   -10.7153	 345.0	 1	     1.0600	     0.9400;
	15	 1	 527.86	 153.00	 0.0	 0.0	 3	     1.0162	   -11.3454	 345.0	 1	     1.0600	     0.9400;
	16	 1	 542.70	 32.30	 0.0	 0.0	 3	     1.0325	   -10.0333	 345.0	 1	     1.0600	     0.9400;
	17	 1	 0.00	 0.00	 0.0	 0.0	 2	     1.0342	   -11.1164	 345.0	 1	     1.0600	     0.9400;
	18	 1	 260.63	 30.00	 0.0	 0.0	 2	     1.0316	   -11.9862	 345.0	 1	     1.0600	     0.9400;
	19	 1	 0.00	 0.00	 0.0	 0.0	 3	     1.0501	    -5.4101	 345.0	 1	     1.0600	     0.9400;
	20	 1	 1121.70	 103.00	 0.0	 0.0	 3	     0.9910	    -6.8212	 345.0	 1	     1.0600	     0.9400;
	21	 1	 451.98	 115.00	 0.0	 0.0	 3	     1.0323	    -7.6287	 345.0	 1	     1.0600	     0.9400;
	22	 1	 0.00	 0.00	 0.0	 0.0	 3	     1.0501	    -3.1831	 345.0	 1	     1.0600	     0.9400;
	23	 1	 408.26	 84.60	 0.0	 0.0	 3	     1.0451	    -3.3813	 345.0	 1	     1.0600	     0.9400;
	24	 1	 308.60	 -92.20	 0.0	 0.0	 3	     1.0380	    -9.9138	 345.0	 1	     1.0600	     0.9400;
	25	 1	 369.50	 47.20	 0.0	 0.0	 2	     1.0577	    -8.3692	 345.0	 1	     1.0600	     0.9400;
	26	 1	 229.29	 17.00	 0.0	 0.0	 2	     1.0526	    -9.4388	 345.0	 1	     1.0600	     0.9400;
	27	 1	 463.52	 75.50	 0.0	 0.0	 2	     1.0383	   -11.3622	 345.0	 1	     1.0600	     0.9400;
	28	 1	 339.81	 27.60	 0.0	 0.0	 3	     1.0504	    -5.9284	 345.0	 1	     1.0600	     0.9400;
	29	 1	 467.65	 26.90	 0.0	 0.0	 3	     1.0501	    -3.1699	 345.0	 1	     1.0600	     0.9400;
	30	 2	 0.00	 0.00	 0.0	 0.0	 2	     1.0499	    -7.3705	 345.0	 1	     1.0600	     0.9400;
	31	 3	 15.18	 4.60	 0.0	 0.0	 1	     0.9820	     0.0000	 345.0	 1	     1.0600	     0.9400;
	32	 2	 0.00	 0.00	 0.0	 0.0	 1	     0.9841	    -0.1884	 345.0	 1	     1.0600	     0.9400;
	33	 2	 0.00	 0.00	 0.0	 0.0	 3	     0.9972	    -0.1932	 345.0	 1	     1.0600	     0.9400;
	34	 2	 0.00	 0.00	 0.0	 0.0	 3	     1.0123	    -1.6311	 345.0	 1	     1.0600	     0.9400;
	35	 2	 0.00	 0.00	 0.0	 0.0	 3	     1.0494	     1.7765	 345.0	 1	     1.0600	     0.9400;
	36	 2	 0.00	 0.00	 0.0	 0.0	 3	     1.0636	     4.4684	 345.0	 1	     1.0600	     0.9400;
	37	 2	 0.00	 0.00	 0.0	 0.0	 2	     1.0275	    -1.5829	 345.0	 1	     1.0600	     0.9400;
	38	 2	 0.00	 0.00	 0.0	 0.0	 3	     1.0265	     3.8928	 345.0	 1	     1.0600	     0.9400;
	39	 2	 1821.11	 250.00	 0.0	 0.0	 1	     1.0300	   -14.5353	 345.0	 1	     1.0600	     0.9400;
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	30	 88.0	 236.0	 400.0	 -283.2	 1.0499	 100.0	 1	 181	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	31	 1453.0	 712.0	 854.4	 -854.4	 0.982	 100.0	 1	 1576	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	32	 806.0	 401.0	 481.2	 -481.2	 0.9841	 100.0	 1	 962	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	33	 859.0	 253.0	 796.0	 -796.0	 0.9972	 100.0	 1	 1592	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	34	 859.0	 251.0	 485.0	 -485.0	 1.0123	 100.0	 1	 970	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % NG
	35	 865.0	 250.0	 434.0	 -434.0	 1.0494	 100.0	 1	 868	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	36	 874.0	 215.0	 1013.0	 -1013.0	 1.0636	 100.0	 1	 2026	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	37	 887.0	 3.0	 570.0	 -570.0	 1.0275	 100.0	 1	 1139	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	38	 1185.0	 188.0	 943.0	 -943.0	 1.0265	 100.0	 1	 1885	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
	39	 2330.0	 143.0	 1264.0	 -1264.0	 1.03	 100.0	 1	 2527	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0	 0.0; % COW
];

%% generator cost data
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	 0.0	 0.0	 3	   0.000000	   1.165120	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.634989	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.551479	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.947212	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   1.572225	   0.000000; % NG
	2	 0.0	 0.0	 3	   0.000000	   0.867424	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.734745	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.879627	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.941501	   0.000000; % COW
	2	 0.0	 0.0	 3	   0.000000	   0.294086	   0.000000; % COW
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
	1	 2	 0.0035	 0.0411	 0.6987	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	1	 39	 0.001	 0.025	 0.75	 1000.0	 1000.0	 1000.0	 0.0	 0.0	 1	 -30.0	 30.0;
	2	 3	 0.0013	 0.0151	 0.2572	 500.0	 500.0	 500.0	 0.0	 0.0	 1	 -30.0	 30.0;
	2	 25	 0.007	 0.0086	 0.146	 500.0	 500.0	 500.0	 0.0	 0.0	 1	 -30.0	 30.0;
	2	 30	 0.0	 0.0181	 0.0	 900.0	 900.0	 2500.0	 1.025	 0.0	 1	 -30.0	 30.0;
	3	 4	 0.0013	 0.0213	 0.2214	 500.0	 500.0	 500.0	 0.0	 0.0	 1	 -30.0	 30.0;
	3	 18	 0.0011	 0.0133	 0.2138	 500.0	 500.0	 500.0	 0.0	 0.0	 1	 -30.0	 30.0;
	4	 5	 0.0008	 0.0128	 0.1342	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	4	 14	 0.0008	 0.0129	 0.1382	 500.0	 500.0	 500.0	 0.0	 0.0	 1	 -30.0	 30.0;
	5	 6	 0.0002	 0.0026	 0.0434	 1200.0	 1200.0	 1200.0	 0.0	 0.0	 1	 -30.0	 30.0;
	5	 8	 0.0008	 0.0112	 0.1476	 900.0	 900.0	 900.0	 0.0	 0.0	 1	 -30.0	 30.0;
	6	 7	 0.0006	 0.0092	 0.113	 900.0	 900.0	 900.0	 0.0	 0.0	 1	 -30.0	 30.0;
	6	 11	 0.0007	 0.0082	 0.1389	 480.0	 480.0	 480.0	 0.0	 0.0	 1	 -30.0	 30.0;
	6	 31	 0.0	 0.025	 0.0	 1800.0	 1800.0	 1800.0	 1.07	 0.0	 1	 -30.0	 30.0;
	7	 8	 0.0004	 0.0046	 0.078	 900.0	 900.0	 900.0	 0.0	 0.0	 1	 -30.0	 30.0;
	8	 9	 0.0023	 0.0363	 0.3804	 900.0	 900.0	 900.0	 0.0	 0.0	 1	 -30.0	 30.0;
	9	 39	 0.001	 0.025	 1.2	 900.0	 900.0	 900.0	 0.0	 0.0	 1	 -30.0	 30.0;
	10	 11	 0.0004	 0.0043	 0.0729	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	10	 13	 0.0004	 0.0043	 0.0729	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	10	 32	 0.0	 0.02	 0.0	 900.0	 900.0	 2500.0	 1.07	 0.0	 1	 -30.0	 30.0;
	12	 11	 0.0016	 0.0435	 0.0	 500.0	 500.0	 500.0	 1.006	 0.0	 1	 -30.0	 30.0;
	12	 13	 0.0016	 0.0435	 0.0	 500.0	 500.0	 500.0	 1.006	 0.0	 1	 -30.0	 30.0;
	13	 14	 0.0009	 0.0101	 0.1723	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	14	 15	 0.0018	 0.0217	 0.366	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	15	 16	 0.0009	 0.0094	 0.171	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	16	 17	 0.0007	 0.0089	 0.1342	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	16	 19	 0.0016	 0.0195	 0.304	 600.0	 600.0	 2500.0	 0.0	 0.0	 1	 -30.0	 30.0;
	16	 21	 0.0008	 0.0135	 0.2548	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	16	 24	 0.0003	 0.0059	 0.068	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	17	 18	 0.0007	 0.0082	 0.1319	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	17	 27	 0.0013	 0.0173	 0.3216	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	19	 20	 0.0007	 0.0138	 0.0	 900.0	 900.0	 2500.0	 1.06	 0.0	 1	 -30.0	 30.0;
	19	 33	 0.0007	 0.0142	 0.0	 900.0	 900.0	 2500.0	 1.07	 0.0	 1	 -30.0	 30.0;
	20	 34	 0.0009	 0.018	 0.0	 900.0	 900.0	 2500.0	 1.009	 0.0	 1	 -30.0	 30.0;
	21	 22	 0.0008	 0.014	 0.2565	 900.0	 900.0	 900.0	 0.0	 0.0	 1	 -30.0	 30.0;
	22	 23	 0.0006	 0.0096	 0.1846	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	22	 35	 0.0	 0.0143	 0.0	 900.0	 900.0	 2500.0	 1.025	 0.0	 1	 -30.0	 30.0;
	23	 24	 0.0022	 0.035	 0.361	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	23	 36	 0.0005	 0.0272	 0.0	 900.0	 900.0	 2500.0	 1.0	 0.0	 1	 -30.0	 30.0;
	25	 26	 0.0032	 0.0323	 0.531	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	25	 37	 0.0006	 0.0232	 0.0	 900.0	 900.0	 2500.0	 1.025	 0.0	 1	 -30.0	 30.0;
	26	 27	 0.0014	 0.0147	 0.2396	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	26	 28	 0.0043	 0.0474	 0.7802	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	26	 29	 0.0057	 0.0625	 1.029	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	28	 29	 0.0014	 0.0151	 0.249	 600.0	 600.0	 600.0	 0.0	 0.0	 1	 -30.0	 30.0;
	29	 38	 0.0008	 0.0156	 0.0	 1200.0	 1200.0	 2500.0	 1.025	 0.0	 1	 -30.0	 30.0;
];

% INFO    : === Translation Options ===
% INFO    : Load Model:                  from file ./nesta_case39_epri.dat.sol
% INFO    : Gen Active Capacity Model:   stat
% INFO    : Gen Reactive Capacity Model: al50ag
% INFO    : Gen Active Cost Model:       stat
% INFO    : 
% INFO    : === Load Replacement Notes ===
% INFO    : Bus 1	: Pd=97.6, Qd=44.2 -> Pd=161.00, Qd=44.20
% INFO    : Bus 2	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 3	: Pd=322.0, Qd=2.4 -> Pd=531.16, Qd=2.40
% INFO    : Bus 4	: Pd=500.0, Qd=184.0 -> Pd=824.78, Qd=184.00
% INFO    : Bus 5	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 6	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 7	: Pd=233.8, Qd=84.0 -> Pd=385.67, Qd=84.00
% INFO    : Bus 8	: Pd=522.0, Qd=176.6 -> Pd=861.07, Qd=176.60
% INFO    : Bus 9	: Pd=6.5, Qd=-66.6 -> Pd=6.50, Qd=-66.60
% INFO    : Bus 10	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 11	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 12	: Pd=8.53, Qd=88.0 -> Pd=14.07, Qd=88.00
% INFO    : Bus 13	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 14	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 15	: Pd=320.0, Qd=153.0 -> Pd=527.86, Qd=153.00
% INFO    : Bus 16	: Pd=329.0, Qd=32.3 -> Pd=542.70, Qd=32.30
% INFO    : Bus 17	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 18	: Pd=158.0, Qd=30.0 -> Pd=260.63, Qd=30.00
% INFO    : Bus 19	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 20	: Pd=680.0, Qd=103.0 -> Pd=1121.70, Qd=103.00
% INFO    : Bus 21	: Pd=274.0, Qd=115.0 -> Pd=451.98, Qd=115.00
% INFO    : Bus 22	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 23	: Pd=247.5, Qd=84.6 -> Pd=408.26, Qd=84.60
% INFO    : Bus 24	: Pd=308.6, Qd=-92.2 -> Pd=308.60, Qd=-92.20
% INFO    : Bus 25	: Pd=224.0, Qd=47.2 -> Pd=369.50, Qd=47.20
% INFO    : Bus 26	: Pd=139.0, Qd=17.0 -> Pd=229.29, Qd=17.00
% INFO    : Bus 27	: Pd=281.0, Qd=75.5 -> Pd=463.52, Qd=75.50
% INFO    : Bus 28	: Pd=206.0, Qd=27.6 -> Pd=339.81, Qd=27.60
% INFO    : Bus 29	: Pd=283.5, Qd=26.9 -> Pd=467.65, Qd=26.90
% INFO    : Bus 30	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 31	: Pd=9.2, Qd=4.6 -> Pd=15.18, Qd=4.60
% INFO    : Bus 32	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 33	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 34	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 35	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 36	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 37	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 38	: Pd=0.0, Qd=0.0 -> Pd=0.00, Qd=0.00
% INFO    : Bus 39	: Pd=1104.0, Qd=250.0 -> Pd=1821.11, Qd=250.00
% INFO    : 
% INFO    : === Generator Setpoint Replacement Notes ===
% INFO    : Gen at bus 30	: Pg=250.0, Qg=161.762 -> Pg=88.0, Qg=236.0
% INFO    : Gen at bus 31	: Pg=677.871, Qg=221.574 -> Pg=1453.0, Qg=712.0
% INFO    : Gen at bus 32	: Pg=650.0, Qg=206.965 -> Pg=806.0, Qg=401.0
% INFO    : Gen at bus 33	: Pg=632.0, Qg=108.293 -> Pg=859.0, Qg=253.0
% INFO    : Gen at bus 34	: Pg=508.0, Qg=166.688 -> Pg=859.0, Qg=251.0
% INFO    : Gen at bus 35	: Pg=650.0, Qg=210.661 -> Pg=865.0, Qg=250.0
% INFO    : Gen at bus 36	: Pg=560.0, Qg=100.165 -> Pg=874.0, Qg=215.0
% INFO    : Gen at bus 37	: Pg=540.0, Qg=-1.36945 -> Pg=887.0, Qg=3.0
% INFO    : Gen at bus 38	: Pg=830.0, Qg=21.7327 -> Pg=1185.0, Qg=188.0
% INFO    : Gen at bus 39	: Pg=1000.0, Qg=78.4674 -> Pg=2330.0, Qg=143.0
% INFO    : 
% INFO    : === Generator Reactive Capacity Atleast Setpoint Value Notes ===
% INFO    : Gen at bus 30	: Qg 236.0, Qmin 140.0, Qmax 400.0 -> Qmin -283.2, Qmax 400.0
% INFO    : Gen at bus 31	: Qg 712.0, Qmin -100.0, Qmax 300.0 -> Qmin -854.4, Qmax 854.4
% INFO    : Gen at bus 32	: Qg 401.0, Qmin 150.0, Qmax 300.0 -> Qmin -481.2, Qmax 481.2
% INFO    : Gen at bus 33	: Qg 253.0, Qmin 0.0, Qmax 250.0 -> Qmin -303.6, Qmax 303.6
% INFO    : Gen at bus 34	: Qg 251.0, Qmin 0.0, Qmax 167.0 -> Qmin -301.2, Qmax 301.2
% INFO    : Gen at bus 35	: Qg 250.0, Qmin -100.0, Qmax 300.0 -> Qmin -300.0, Qmax 300.0
% INFO    : Gen at bus 36	: Qg 215.0, Qmin 0.0, Qmax 240.0 -> Qmin -258.0, Qmax 240.0
% INFO    : Gen at bus 37	: Qg 3.0, Qmin 0.0, Qmax 250.0 -> Qmin -3.6, Qmax 250.0
% INFO    : Gen at bus 38	: Qg 188.0, Qmin -150.0, Qmax 300.0 -> Qmin -225.6, Qmax 300.0
% INFO    : Gen at bus 39	: Qg 143.0, Qmin -100.0, Qmax 300.0 -> Qmin -171.6, Qmax 300.0
% INFO    : 
% INFO    : === Generator Classification Notes ===
% INFO    : COW    9   -    91.58
% INFO    : NG     1   -     8.42
% INFO    : 
% INFO    : === Generator Active Capacity Stat Model Notes ===
% INFO    : Gen at bus 30 - COW	: Pg=88.0, Pmax=1040.0 -> Pmax=181   samples: 1
% WARNING : Failed to find a generator capacity within (1453.0-7265.0) after 100 samples, using percent increase model
% INFO    : Gen at bus 31 - COW	: Pg=1453.0, Pmax=646.0 -> Pmax=1576   samples: 100
% INFO    : Gen at bus 32 - COW	: Pg=806.0, Pmax=725.0 -> Pmax=962   samples: 10
% INFO    : Gen at bus 33 - COW	: Pg=859.0, Pmax=652.0 -> Pmax=1592   samples: 2
% WARNING : Failed to find a generator capacity within (859.0-4295.0) after 100 samples, using percent increase model
% INFO    : Gen at bus 34 - NG	: Pg=859.0, Pmax=508.0 -> Pmax=970   samples: 100
% INFO    : Gen at bus 35 - COW	: Pg=865.0, Pmax=687.0 -> Pmax=868   samples: 4
% INFO    : Gen at bus 36 - COW	: Pg=874.0, Pmax=580.0 -> Pmax=2026   samples: 41
% INFO    : Gen at bus 37 - COW	: Pg=887.0, Pmax=564.0 -> Pmax=1139   samples: 5
% INFO    : Gen at bus 38 - COW	: Pg=1185.0, Pmax=865.0 -> Pmax=1885   samples: 35
% WARNING : Failed to find a generator capacity within (2330.0-11650.0) after 100 samples, using percent increase model
% INFO    : Gen at bus 39 - COW	: Pg=2330.0, Pmax=1100.0 -> Pmax=2527   samples: 100
% INFO    : 
% INFO    : === Generator Active Capacity LB Model Notes ===
% INFO    : 
% INFO    : === Generator Reactive Capacity Atleast Max 50 Percent Active Model Notes ===
% INFO    : Gen at bus 33 - COW	: Pmax 1592.0, Qmin -303.6, Qmax 303.6 -> Qmin -796.0, Qmax 796.0
% INFO    : Gen at bus 34 - NG	: Pmax 970.0, Qmin -301.2, Qmax 301.2 -> Qmin -485.0, Qmax 485.0
% INFO    : Gen at bus 35 - COW	: Pmax 868.0, Qmin -300.0, Qmax 300.0 -> Qmin -434.0, Qmax 434.0
% INFO    : Gen at bus 36 - COW	: Pmax 2026.0, Qmin -258.0, Qmax 240.0 -> Qmin -1013.0, Qmax 1013.0
% INFO    : Gen at bus 37 - COW	: Pmax 1139.0, Qmin -3.6, Qmax 250.0 -> Qmin -570.0, Qmax 570.0
% INFO    : Gen at bus 38 - COW	: Pmax 1885.0, Qmin -225.6, Qmax 300.0 -> Qmin -943.0, Qmax 943.0
% INFO    : Gen at bus 39 - COW	: Pmax 2527.0, Qmin -171.6, Qmax 300.0 -> Qmin -1264.0, Qmax 1264.0
% INFO    : 
% INFO    : === Generator Active Cost Stat Model Notes ===
% INFO    : Updated Generator Cost: COW - 240.0 15.37 0.0105 -> 0 1.16511982201 0
% INFO    : Updated Generator Cost: COW - 200.0 11.29 0.009 -> 0 0.634989326149 0
% INFO    : Updated Generator Cost: COW - 220.0 8.8 0.009 -> 0 0.551479162426 0
% INFO    : Updated Generator Cost: COW - 250.0 8.0 0.0095 -> 0 0.947212438279 0
% INFO    : Updated Generator Cost: NG - 220.0 11.4 0.0085 -> 0 1.5722252782 0
% INFO    : Updated Generator Cost: COW - 190.0 10.45 0.0075 -> 0 0.867424379331 0
% INFO    : Updated Generator Cost: COW - 200.0 10.03 0.009 -> 0 0.734745353755 0
% INFO    : Updated Generator Cost: COW - 210.0 10.15 0.009 -> 0 0.879627473134 0
% INFO    : Updated Generator Cost: COW - 230.0 7.98 0.007 -> 0 0.941500881831 0
% INFO    : Updated Generator Cost: COW - 220.0 8.0 0.006 -> 0 0.294085812562 0
% INFO    : 
% INFO    : === Writing Matpower Case File Notes ===