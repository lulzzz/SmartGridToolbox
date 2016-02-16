function mpc = nesta_case189_edin_mod
%NESTA_CASE189_EDIN_MOD

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
	1	1	0	0	0	0	1	1.0353	-6.84501	220	1	1.1	0.9;
	2	2	0	0	0	0	1	1.06997	0.49452	13.8	1	1.1	0.9;
	3	2	0	0	0	0	1	1.06858	-0.20615	13.8	1	1.1	0.9;
	4	2	0	0	0	0	1	1.05353	-6.87114	13.8	1	1.1	0.9;
	5	1	0	0	0	0	1	1.06206	-0.36434	66	1	1.1	0.9;
	6	1	0	0	0	0	1	1.06206	-0.36469	66	1	1.1	0.9;
	7	1	0	0	0	0	1	1.05602	-4.9766	220	1	1.1	0.9;
	8	2	0	0	0	0	1	1.07447	-3.05031	10.5	1	1.1	0.9;
	9	2	0	0	0	0	1	1.07564	-2.92409	10.5	1	1.1	0.9;
	10	3	0	0	0	0	1	1.09931	0	10.5	1	1.1	0.9;
	11	1	0	0	0	0	1	1.06214	-4.45223	132	1	1.1	0.9;
	12	1	0	0	0	0	1	1.05314	-5.10127	220	1	1.1	0.9;
	13	2	0	0	0	0	1	1.09781	5.68529	13.8	1	1.1	0.9;
	14	2	0	0	0	0	1	1.1	-3.24208	13.8	1	1.1	0.9;
	15	1	0	0	0	0	1	1.05686	-4.98702	220	1	1.1	0.9;
	16	2	0	0	0	0	1	1.07714	-5.0418	11	1	1.1	0.9;
	17	1	0	0	0	0	1	1.03597	-6.94379	220	1	1.1	0.9;
	18	2	0	0	0	0	1	1.08559	-7.0801	11	1	1.1	0.9;
	19	2	0	0	0	0	1	1.0829	1.06776	11	1	1.1	0.9;
	20	1	0	0	0	0	1	1.03613	-6.94471	220	1	1.1	0.9;
	21	1	0	0	0	0	1	1.03195	-7.19973	220	1	1.1	0.9;
	22	1	0	0	0	0	1	1.01904	-2.0662	66	1	1.1	0.9;
	23	1	0	0	0	0	1	1.03776	-1.37246	66	1	1.1	0.9;
	24	1	0	0	0	0	1	1.0172	-2.33434	66	1	1.1	0.9;
	25	1	0	0	0	0	1	1.01371	-9.01973	220	1	1.1	0.9;
	26	1	0	0	0	0	1	1.02849	-6.62219	132	1	1.1	0.9;
	27	2	0	0	0	0	1	1.04068	-6.6733	10.5	1	1.1	0.9;
	28	2	0	0	0	0	1	1.04251	-5.00026	10.5	1	1.1	0.9;
	29	2	0	0	0	0	1	1.03576	-5.94948	10.5	1	1.1	0.9;
	30	1	0	0	0	0	1	1.02957	-3.05931	66	1	1.1	0.9;
	31	1	0	0	0	0	1	1.0477	-1.95161	66	1	1.1	0.9;
	32	2	0	0	0	0	1	1.05476	-1.28383	6.6	1	1.1	0.9;
	33	2	0	0	0	0	1	1.0592	-1.0044	6.6	1	1.1	0.9;
	34	1	0	0	0	0	1	1.0477	-1.95161	6.6	1	1.1	0.9;
	35	1	0	0	0	0	1	1.03287	-2.60323	66	1	1.1	0.9;
	36	2	0	0	0	0	1	1.03656	-0.80443	6.6	1	1.1	0.9;
	37	1	0	0	0	0	1	1.00796	-4.9876	11	1	1.1	0.9;
	38	1	0	0	0	0	1	1.03287	-2.60358	66	1	1.1	0.9;
	39	1	0	0	0	0	1	0.99976	-10.38028	220	1	1.1	0.9;
	40	1	0	0	0	0	1	1.00619	-8.53936	132	1	1.1	0.9;
	41	1	0	0	0	0	1	0.99999	-10.38412	220	1	1.1	0.9;
	42	2	0	0	0	0	1	1.02755	-7.44839	11	1	1.1	0.9;
	43	2	0	0	0	0	1	1.02839	-9.13593	11	1	1.1	0.9;
	44	1	0	0	0	0	1	1.01417	-2.88232	66	1	1.1	0.9;
	45	1	0	0	0	0	1	1.00948	-3.03032	33	1	1.1	0.9;
	46	1	0	0	0	0	1	1.01536	-8.88274	220	1	1.1	0.9;
	47	1	0	0	0	0	1	1.00619	-8.53936	132	1	1.1	0.9;
	48	1	0	0	0	0	1	0.99976	-10.38033	220	1	1.1	0.9;
	49	1	0	0	0	0	1	1.03672	-8.04135	132	1	1.1	0.9;
	50	2	0	0	0	0	1	1.0534	-5.59797	11	1	1.1	0.9;
	51	2	0	0	0	0	1	1.05129	-8.09624	11	1	1.1	0.9;
	52	2	0	0	0	0	1	1.05368	-3.59113	11	1	1.1	0.9;
	53	2	0	0	0	0	1	1.05129	-8.09624	11	1	1.1	0.9;
	54	1	0	0	0	0	1	1.0285	-2.89676	66	1	1.1	0.9;
	55	1	0	0	0	0	1	1.03603	-8.08134	132	1	1.1	0.9;
	56	1	0	0	0	0	1	1.0244	-8.93098	132	1	1.1	0.9;
	57	1	0	0	0	0	1	0.99472	-10.96888	220	1	1.1	0.9;
	58	1	0	0	0	0.3	1	1.0187	-9.07256	132	1	1.1	0.9;
	59	1	0	0	0	0	1	1.01589	-9.19357	132	1	1.1	0.9;
	60	1	0	0	0	0	1	0.93336	-18.36542	21	1	1.1	0.9;
	61	1	0	0	0	0	1	0.98155	-11.9684	220	1	1.1	0.9;
	62	1	0	0	0	0	1	0.98299	-11.83588	220	1	1.1	0.9;
	63	1	0	0	0	0	1	0.92164	-20.16422	33	1	1.1	0.9;
	64	1	0	0	0	0	1	0.98433	-11.75182	220	1	1.1	0.9;
	65	1	0	0	0	0	1	0.96616	-15.35051	33	1	1.1	0.9;
	66	1	0	0	0	0	1	0.98311	-11.87782	220	1	1.1	0.9;
	67	1	0	0	0	0	1	0.95056	-17.74255	33	1	1.1	0.9;
	68	1	0	0	0	0	1	0.96169	-15.93189	33	1	1.1	0.9;
	69	1	0	0	0	0	1	1.0202	-9.13232	132	1	1.1	0.9;
	70	1	0	0	0	0	1	1.00664	-10.24036	33	1	1.1	0.9;
	71	1	0	0	0	0.08	1	0.98494	-11.67797	220	1	1.1	0.9;
	72	1	0	0	0	0.43	1	0.98651	-7.88814	132	1	1.1	0.9;
	73	1	0	0	0	0	1	0.98586	-7.92899	132	1	1.1	0.9;
	74	1	0	0	0	0	1	0.97442	-8.90732	11	1	1.1	0.9;
	75	1	0	0	0	0	1	0.99575	-10.75155	220	1	1.1	0.9;
	76	1	0	0	0	0.75	1	0.97125	-14.48724	220	1	1.1	0.9;
	77	1	0	0	0	0	1	0.9617	-12.77386	132	1	1.1	0.9;
	78	1	0	0	0	0	1	0.95853	-13.15465	66	1	1.1	0.9;
	79	1	0	0	0	0	1	0.95853	-13.15465	11	1	1.1	0.9;
	80	1	0	0	0	0	1	0.96906	-14.77842	220	1	1.1	0.9;
	81	1	0	0	0	0	1	0.96868	-14.90716	220	1	1.1	0.9;
	82	1	0	0	0	0	1	1.01524	-9.23155	132	1	1.1	0.9;
	83	1	0	0	0	0	1	1.01428	-9.2606	11	1	1.1	0.9;
	84	1	0	0	0	0	1	1.01939	-9.17208	132	1	1.1	0.9;
	85	1	0	0	0	0	1	1.01241	-9.68121	11	1	1.1	0.9;
	86	1	0	0	0	0	1	1.01481	-9.24381	132	1	1.1	0.9;
	87	1	0	0	0	0	1	1.00923	-9.50875	11	1	1.1	0.9;
	88	1	0	0	0	0	1	0.98428	-8.19364	132	1	1.1	0.9;
	89	1	0	0	0	0	1	0.97772	-8.83959	11	1	1.1	0.9;
	90	1	0	0	0	0	1	0.98512	-8.13921	132	1	1.1	0.9;
	91	1	0	0	0	0	1	0.98168	-8.48247	11	1	1.1	0.9;
	92	1	0	0	0	0	1	0.98515	-8.13342	132	1	1.1	0.9;
	93	1	0	0	0	0	1	1.04878	0.24477	132	1	1.1	0.9;
	94	1	0	0	0	0	1	1.06878	2.81202	132	1	1.1	0.9;
	95	1	0	0	0	0	1	1.06878	2.81202	11	1	1.1	0.9;
	96	1	0	0	0	0	1	1.06418	2.02157	132	1	1.1	0.9;
	97	1	0	0	0	0	1	1.08032	2.47569	132	1	1.1	0.9;
	98	2	0	0	0	0	1	1.1	3.95255	11	1	1.1	0.9;
	99	2	0	0	0	0	1	1.1	2.44441	11	1	1.1	0.9;
	100	1	0	0	0	0	1	1.08032	2.47569	11	1	1.1	0.9;
	101	1	0	0	0	0	1	1.08032	2.47569	11	1	1.1	0.9;
	102	2	0	0	0	0	1	1.09741	10.87892	11	1	1.1	0.9;
	103	1	0	0	0	0	1	0.96183	-11.10564	132	1	1.1	0.9;
	104	2	0	0	0	0	1	0.95654	-13.06751	66	1	1.1	0.9;
	105	1	0	0	0	0	1	0.95474	-13.26013	19	1	1.1	0.9;
	106	1	0	0	0	0	1	0.95474	-13.26013	0.41	1	1.1	0.9;
	107	1	0	0	0	0	1	0.95654	-13.06751	11	1	1.1	0.9;
	108	1	0	0	0	0	1	0.95474	-13.26013	11	1	1.1	0.9;
	109	1	0	0	0	0	1	0.99212	-3.00717	132	1	1.1	0.9;
	110	1	0	0	0	0	1	0.9918	-3.10984	19	1	1.1	0.9;
	111	1	0	0	0	0	1	0.9918	-3.10984	0.41	1	1.1	0.9;
	112	1	0	0	0	0	1	0.9918	-3.10984	11	1	1.1	0.9;
	113	1	0	0	0	0	1	0.99125	-4.43922	132	1	1.1	0.9;
	114	1	0	0	0	0	1	0.99203	-4.60228	33	1	1.1	0.9;
	115	1	0	0	0	0	1	0.98438	-6.499	132	1	1.1	0.9;
	116	1	0	0	0	0	1	0.98248	-7.79624	66	1	1.1	0.9;
	117	2	0	0	0	0	1	0.98579	-7.5533	6.3	1	1.1	0.9;
	118	1	0	0	0	0	1	0.98454	-7.64326	33	1	1.1	0.9;
	119	1	0	0	0	0	1	0.99208	-1.87621	132	1	1.1	0.9;
	120	1	0	0	0	0	1	0.99082	-2.02048	19	1	1.1	0.9;
	121	1	0	0	0	0	1	0.99082	-2.02048	0.41	1	1.1	0.9;
	122	1	0	0	0	0	1	0.99082	-2.02048	11	1	1.1	0.9;
	123	1	0	0	0	0	1	1.04602	8.79496	132	1	1.1	0.9;
	124	1	0	0	0	0	1	1.04461	8.45898	33	1	1.1	0.9;
	125	1	0	0	0	0	1	1.08218	13.50559	132	1	1.1	0.9;
	126	2	0	0	0	0	1	1.1	15.50344	11	1	1.1	0.9;
	127	2	0	0	0	0	1	1.1	18.59254	11	1	1.1	0.9;
	128	1	0	0	0	0	1	1.1	15.50344	11	1	1.1	0.9;
	129	1	0	0	0	0	1	1.1	18.59254	11	1	1.1	0.9;
	130	1	0	0	0	0	1	1.07722	12.86365	132	1	1.1	0.9;
	131	1	0	0	0	0	1	1.07478	12.22944	66	1	1.1	0.9;
	132	1	0	0	0	0	1	1.06074	12.08208	132	1	1.1	0.9;
	133	1	0	0	0	0	1	1.05721	11.8082	66	1	1.1	0.9;
	134	1	0	0	0	0	1	1.05555	11.64795	11	1	1.1	0.9;
	135	1	0	0	0	0	1	1.05555	11.64795	0.41	1	1.1	0.9;
	136	1	0	0	0	0	1	1.05555	11.64795	11	1	1.1	0.9;
	137	1	0	0	0	0	1	1.04754	11.78563	132	1	1.1	0.9;
	138	2	0	0	0	0	1	1.02937	14.63443	11	1	1.1	0.9;
	139	2	0	0	0	0	1	1.02778	13.67478	11	1	1.1	0.9;
	140	1	0	0	0	0	1	1.02853	14.15498	0.41	1	1.1	0.9;
	141	1	0	0	0	0	1	1.02823	13.90872	11	1	1.1	0.9;
	142	2	0	0	0	0	1	1.02823	13.90912	11	1	1.1	0.9;
	143	1	0	0	0	0	1	1.09834	15.29499	66	1	1.1	0.9;
	144	2	0	0	0	0	1	1.1	16.14819	11	1	1.1	0.9;
	145	1	0	0	0	0	1	1.09834	15.29499	33	1	1.1	0.9;
	146	1	0	0	0	0	1	1.09904	15.67332	6.6	1	1.1	0.9;
	147	1	0	0	0	0	1	1.09835	15.30009	11	1	1.1	0.9;
	148	1	0	0	0	0	1	1.09955	15.92972	0.38	1	1.1	0.9;
	149	1	0	0	0	0	1	1.09835	15.30256	0.22	1	1.1	0.9;
	150	1	0	0	0	0	1	1.09912	15.70987	0.38	1	1.1	0.9;
	151	1	0	0	0	0	1	1.09912	15.70987	0.22	1	1.1	0.9;
	152	1	0	0	0	0	1	1.09912	15.71108	6.6	1	1.1	0.9;
	153	1	0	0	0	0	1	1.09912	15.70987	6.6	1	1.1	0.9;
	154	1	0	0	0	0	1	1.09912	15.71108	0.22	1	1.1	0.9;
	155	1	0	0	0	0	1	1.08401	-0.29089	132	1	1.1	0.9;
	156	1	0	0	0	0	1	1.07588	-1.46156	66	1	1.1	0.9;
	157	1	0	0	0	0	1	1.08191	-0.4386	132	1	1.1	0.9;
	158	1	0	0	0	0	1	1.07963	-0.7394	132	1	1.1	0.9;
	159	1	0	0	0	0	1	1.07475	-1.51914	66	1	1.1	0.9;
	160	1	0	0	0	0	1	1.07475	-1.51914	11	1	1.1	0.9;
	161	1	0	0	0	0	1	1.09163	-1.69257	132	1	1.1	0.9;
	162	1	0	0	0	0	1	1.09069	-1.92204	11	1	1.1	0.9;
	163	1	0	0	0	0	1	1.09107	-1.84028	33	1	1.1	0.9;
	164	1	0	0	0	0	1	1.09069	-1.92204	0.41	1	1.1	0.9;
	165	1	0	0	0	0	1	1.09107	-1.84028	11	1	1.1	0.9;
	166	1	0	0	0	0	1	1.1	-3.47808	132	1	1.1	0.9;
	167	1	0	0	0	0	1	1.09929	-3.8477	11	1	1.1	0.9;
	168	1	0	0	0	0	1	1.09929	-3.8477	0.41	1	1.1	0.9;
	169	1	0	0	0	0	1	1.09929	-3.8477	11	1	1.1	0.9;
	170	1	0	0	0	0	1	1.07209	-1.23673	132	1	1.1	0.9;
	171	1	0	0	0	0	1	1.09929	-3.8477	19	1	1.1	0.9;
	172	1	0	0	0	0	1	1.07255	-3.63158	132	1	1.1	0.9;
	173	1	0	0	0	0	1	1.07232	-3.69907	19	1	1.1	0.9;
	174	1	0	0	0	0	1	1.07232	-3.69907	0.41	1	1.1	0.9;
	175	1	0	0	0	0	1	1.07232	-3.69907	11	1	1.1	0.9;
	176	1	0	0	0	0	1	1.08051	1.14855	132	1	1.1	0.9;
	177	1	0	0	0	0	1	1.08397	0.53096	220	1	1.1	0.9;
	178	1	0	0	0	0	1	1.07976	0.05621	11	1	1.1	0.9;
	179	1	0	0	0	0	1	1.08335	0.35455	69	1	1.1	0.9;
	180	1	0	0	0	0	1	1.08335	0.35455	69	1	1.1	0.9;
	181	1	0	0	0	0	1	1.08335	0.35455	69	1	1.1	0.9;
	182	1	0	0	0	0	1	1.08335	0.35455	69	1	1.1	0.9;
	183	1	0	0	0	0	1	1.08335	0.35455	69	1	1.1	0.9;
	184	1	0	0	0	0	1	1.07975	0.05541	11	1	1.1	0.9;
	185	1	0	0	0	0	1	1.05707	-2.23918	66	1	1.1	0.9;
	186	2	0	0	0	0	1	1.05723	-2.05921	6.6	1	1.1	0.9;
	187	1	0	0	0	0	1	1.05707	-2.23918	11	1	1.1	0.9;
	188	1	0	0	0	0	1	1.08335	0.35455	220	1	1.1	0.9;
	189	1	0	0	0	0	1	1.08334	0.35426	220	1	1.1	0.9;
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	10	79.166	38	38	-20	1.09931	69.3	1	228	0	0	0	0	0	0	0	0	0	0	0	0;
	2	115	34	34	-20	1.06997	106.6	1	115	0	0	0	0	0	0	0	0	0	0	0	0;
	3	95	34	34	-20	1.06858	106.6	1	95	0	0	0	0	0	0	0	0	0	0	0	0;
	4	0	17	17	-10	1.05353	53.3	1	128	0	0	0	0	0	0	0	0	0	0	0	0;
	8	30	15	15	-15	1.07447	69.3	1	30	0	0	0	0	0	0	0	0	0	0	0	0;
	9	32	16	16	-16	1.07564	69.3	1	32	0	0	0	0	0	0	0	0	0	0	0	0;
	13	145.492	42	42	-20	1.09781	81.5	1	236	0	0	0	0	0	0	0	0	0	0	0	0;
	14	26.062	33.998	42	-20	1.1	81.5	1	164	0	0	0	0	0	0	0	0	0	0	0	0;
	16	0	17	17	-10	1.07714	53.3	1	164	0	0	0	0	0	0	0	0	0	0	0	0;
	18	0	42	42	-20	1.08559	66.67	1	151	0	0	0	0	0	0	0	0	0	0	0	0;
	19	124	42	42	-20	1.0829	66.67	1	124	0	0	0	0	0	0	0	0	0	0	0	0;
	27	0	11.6	11.6	-5	1.04068	19.4	1	46	0	0	0	0	0	0	0	0	0	0	0	0;
	28	28.495	11.6	11.6	-5	1.04251	19.4	1	63	0	0	0	0	0	0	0	0	0	0	0	0;
	29	13	7	7	-5	1.03576	21	1	13	0	0	0	0	0	0	0	0	0	0	0	0;
	32	11	6	6	-5	1.05476	16.5	1	11	0	0	0	0	0	0	0	0	0	0	0	0;
	33	15.708	9.9	9.9	-5	1.0592	16.5	1	20	0	0	0	0	0	0	0	0	0	0	0	0;
	36	52	3.3	3.3	-2	1.03656	18.2	1	52	0	0	0	0	0	0	0	0	0	0	0	0;
	42	42	21	21	-20	1.02755	55	1	42	0	0	0	0	0	0	0	0	0	0	0	0;
	43	18.528	22	22	-20	1.02839	55	1	166	0	0	0	0	0	0	0	0	0	0	0	0;
	50	62.135	20	20	-20	1.0534	40	1	72	0	0	0	0	0	0	0	0	0	0	0	0;
	51	0	20	20	-20	1.05129	40	1	88	0	0	0	0	0	0	0	0	0	0	0	0;
	52	112	20	20	-20	1.05368	40	1	112	0	0	0	0	0	0	0	0	0	0	0	0;
	53	0	20	20	-20	1.05129	40	1	111	0	0	0	0	0	0	0	0	0	0	0	0;
	98	33.206	22.415	23	-16	1.1	55	1	121	0	0	0	0	0	0	0	0	0	0	0	0;
	99	0	22.99	23	-16	1.1	55	1	65	0	0	0	0	0	0	0	0	0	0	0	0;
	102	142.412	30	30	-26	1.09741	67.5	1	218	0	0	0	0	0	0	0	0	0	0	0	0;
	104	0	3.3	3.3	-3.3	0.95654	10	1	11	0	0	0	0	0	0	0	0	0	0	0	0;
	117	6	2.5	2.5	0	0.98579	20.2	1	6	0	0	0	0	0	0	0	0	0	0	0	0;
	126	40	18.205	20	-12	1.1	60	1	40	0	0	0	0	0	0	0	0	0	0	0	0;
	127	101	20.254	22	-12	1.1	60	1	101	0	0	0	0	0	0	0	0	0	0	0	0;
	138	58	-13.524	18.7	-16	1.02937	37.5	1	58	0	0	0	0	0	0	0	0	0	0	0	0;
	139	0	-13.513	18.7	-16	1.02778	37.5	1	95	0	0	0	0	0	0	0	0	0	0	0	0;
	142	7	0.064	1.3	0	1.02823	3.5	1	7	0	0	0	0	0	0	0	0	0	0	0	0;
	144	21	0.837	11	0	1.1	28	1	21	0	0	0	0	0	0	0	0	0	0	0	0;
	186	6	0	3	0	1.05723	10	1	6	0	0	0	0	0	0	0	0	0	0	0	0;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
	1	7	0.0055	0.0334	0.04711	321	321	321	1	0	1	-30	30;
	1	17	0.00059	0.00818	0.02064	476	476	476	1	0	1	-30	30;
	1	21	0.00138	0.00908	0.0128	334	334	334	1	0	1	-30	30;
	1	46	0.0075	0.04531	0.06412	321	321	321	1	0	1	-30	30;
	1	71	0.00607	0.08107	0.20636	389	389	389	1	0	1	-30	30;
	5	6	0	0.0001	0	9900	9900	9900	1	0	1	-30	30;
	5	23	0.1134	0.2371	0.0034	58	58	58	1	0	1	-30	30;
	6	22	0.1892	0.4045	0.0057	59	59	59	1	0	1	-30	30;
	7	12	0.0008	0.00758	0.0122	397	397	397	1	0	1	-30	30;
	7	15	0.00118	0.00525	0.00734	277	277	277	1	0	1	-30	30;
	11	172	0.0414	0.186	0.03803	166	166	166	1	0	1	-30	30;
	12	17	0.00186	0.01775	0.02631	399	399	399	1	0	1	-30	30;
	17	20	0.0015	0.01421	0.02098	397	397	397	1	0	1	-30	30;
	17	76	0.01123	0.10655	0.15787	295	295	295	1	0	1	-30	30;
	17	76	0.00673	0.0629	0.22871	395	395	395	1	0	1	-30	30;
	21	25	0.00702	0.04602	0.06492	333	333	333	1	0	1	-30	30;
	22	24	0.09229	0.11961	0.00156	47	47	47	1	0	1	-30	30;
	23	24	0.12833	0.28719	0.00422	60	60	60	1	0	1	-30	30;
	24	44	0.1	0.15	0.002	50	50	50	1	0	1	-30	30;
	25	57	0.005	0.0328	0.0456	333	333	333	1	0	1	-30	30;
	26	40	0.02416	0.06049	0.01107	127	127	127	1	0	1	-30	30;
	30	35	0.006	0.015	0	64	64	64	1	0	1	-30	30;
	31	35	0.0239	0.0599	0.0007	64	64	64	1	0	1	-30	30;
	35	38	0	0.0001	0	9900	9900	9900	1	0	1	-30	30;
	35	44	0.0615	0.1591	0.0024	65	65	65	1	0	1	-30	30;
	35	54	0.0399	0.1001	0.0011	64	64	64	1	0	1	-30	30;
	39	41	0.00023	0.00222	0.00329	401	401	401	1	0	1	-30	30;
	39	48	0.00019	0.00178	0.00263	395	395	395	1	0	1	-30	30;
	39	57	0.00187	0.01776	0.02631	398	398	398	1	0	1	-30	30;
	40	47	0.00055	0.00324	0.00018	190	190	190	1	0	1	-30	30;
	41	46	0.0054	0.03262	0.04616	321	321	321	1	0	1	-30	30;
	41	57	0.00255	0.01541	0.0218	321	321	321	1	0	1	-30	30;
	41	75	0.0009	0.00852	0.01259	397	397	397	1	0	1	-30	30;
	49	55	0.00068	0.00191	0.02173	134	134	134	1	0	1	-30	30;
	49	58	0.00677	0.01915	0.19623	134	134	134	1	0	1	-30	30;
	55	56	0.0083	0.03772	0.00758	168	168	168	1	0	1	-30	30;
	56	69	0.00352	0.00996	0.10204	134	134	134	1	0	1	-30	30;
	57	71	0.00208	0.01308	0.01975	327	327	327	1	0	1	-30	30;
	57	71	0.00208	0.01308	0.01975	327	327	327	1	0	1	-30	30;
	57	76	0.0088	0.0534	0.076	321	321	321	1	0	1	-30	30;
	58	59	0.0038	0.0084	0.0219	119	119	119	1	0	1	-30	30;
	58	69	0.0046	0.017	0.0033	152	152	152	1	0	1	-30	30;
	59	82	0.0005	0.0023	0.0325	169	169	169	1	0	1	-30	30;
	61	71	0.00041	0.00262	0.0046	329	329	329	1	0	1	-30	30;
	62	71	0.00041	0.00262	0.0046	329	329	329	1	0	1	-30	30;
	64	71	0.00041	0.00262	0.0046	329	329	329	1	0	1	-30	30;
	66	71	0.00041	0.00262	0.0046	329	329	329	1	0	1	-30	30;
	69	84	0.0032	0.0057	0.1054	108	108	108	1	0	1	-30	30;
	71	75	0.0022	0.0212	0.0321	400	400	400	1	0	1	-30	30;
	72	73	0.0011	0.0046	0.001	162	162	162	1	0	1	-30	30;
	72	92	0.00465	0.01776	0.00547	155	155	155	1	0	1	-30	30;
	72	93	0.0253	0.101	0.0219	158	158	158	1	0	1	-30	30;
	76	80	0.0007	0.004	0.0061	312	312	312	1	0	1	-30	30;
	76	81	0.0004	0.00377	0.00557	396	396	396	1	0	1	-30	30;
	76	81	0.00039	0.0037	0.00547	397	397	397	1	0	1	-30	30;
	77	103	0.0106	0.0476	0.00985	167	167	167	1	0	1	-30	30;
	82	86	0.00196	0.00418	0.04905	117	117	117	1	0	1	-30	30;
	88	90	0.00402	0.00674	0.10825	105	105	105	1	0	1	-30	30;
	90	92	0.0001	0.00042	0.00591	162	162	162	1	0	1	-30	30;
	93	96	0.00354	0.0214	0.00392	193	193	193	1	0	1	-30	30;
	94	96	0.0029	0.01159	0.00251	158	158	158	1	0	1	-30	30;
	96	97	0.00583	0.03524	0.00646	193	193	193	1	0	1	-30	30;
	103	119	0.0409	0.1829	0.03775	167	167	167	1	0	1	-30	30;
	109	113	0.0248	0.1112	0.0227	167	167	167	1	0	1	-30	30;
	109	119	0.0178	0.08	0.01636	167	167	167	1	0	1	-30	30;
	113	115	0.0429	0.1927	0.03945	161	161	161	1	0	1	-30	30;
	119	123	0.0385	0.1727	0.0356	167	167	167	1	0	1	-30	30;
	123	125	0.018	0.0797	0.0159	166	166	166	1	0	1	-30	30;
	125	130	0.0169	0.075	0.0153	166	166	166	1	0	1	-30	30;
	130	132	0.0839	0.2156	0.0427	128	128	128	1	0	1	-30	30;
	132	137	0.0435	0.1952	0.04	158	158	158	1	0	1	-30	30;
	133	143	0.35284	0.5564	0.005	48	48	48	1	0	1	-30	30;
	137	176	0.06485	0.29293	0.06014	106	106	106	1	0	1	-30	30;
	141	142	0	0.0001	0	9900	9900	9900	1	0	1	-30	30;
	155	157	0.01419	0.01638	0.10193	88	88	88	1	0	1	-30	30;
	155	158	0.01663	0.07017	0.01485	162	162	162	1	0	1	-30	30;
	155	161	0.0264	0.11823	0.0242	167	167	167	1	0	1	-30	30;
	155	176	0.01322	0.04968	0.08516	154	154	154	1	0	1	-30	30;
	159	185	0.30532	0.5096	0.003	52	52	52	1	0	1	-30	30;
	161	166	0.0399	0.1791	0.0367	167	167	167	1	0	1	-30	30;
	166	170	0	-0.40174	0	79	79	79	1	0	1	-30	30;
	170	172	0.0883	0.4	0.0838	78	78	78	1	0	1	-30	30;
	177	188	0.00219	0.03499	0.0818	510	510	510	1	0	1	-30	30;
	188	189	0	0.0001	0	9900	9900	9900	1	0	1	-30	30;
	1	2	0.00481	0.14783	0	214	214	214	1	0	1	-30	30;
	1	3	0.00481	0.14783	0	214	214	214	1	0	1	-30	30;
	1	4	0.00292	0.113	0	280	280	280	1	0	1	-30	30;
	5	2	0.01616	0.101	0	309	309	309	1	0	1	-30	30;
	6	3	0.01616	0.101	0	309	309	309	1	0	1	-30	30;
	7	8	0.00373	0.129	0	245	245	245	1	0	1	-30	30;
	7	9	0.00373	0.129	0	245	245	245	1	0	1	-30	30;
	7	10	0.00373	0.129	0	245	245	245	1	0	1	-30	30;
	7	11	0.002	0.1081	0	293	293	293	1	0	1	-30	30;
	12	13	0.00444	0.15	0	211	211	211	1	0	1	-30	30;
	12	14	0.00444	0.15	0	211	211	211	1	0	1	-30	30;
	15	16	0.0064	0.1285	0	246	246	246	1	0	1	-30	30;
	17	18	0.00637	0.12825	0	246	246	246	1	0	1	-30	30;
	17	19	0.00637	0.12825	0	246	246	246	1	0	1	-30	30;
	25	26	0.00258	0.126	0	251	251	251	1	0	1	-30	30;
	26	27	0.00823	0.1094	0	288	288	288	1	0	1	-30	30;
	26	28	0.0081	0.1098	0	287	287	287	1	0	1	-30	30;
	26	29	0.00519	0.099	0	319	319	319	1	0	1	-30	30;
	26	30	0.00583	0.1167	0	271	271	271	1	0	1	-30	30;
	31	32	0.0035	0.119	0	266	266	266	1	0	1	-30	30;
	31	33	0.0035	0.119	0	266	266	266	1	0	1	-30	30;
	31	34	0.00049	0.11797	0	268	268	268	1	0	1	-30	30;
	35	36	0.00425	0.0649	0	486	486	486	1	0	1	-30	30;
	35	37	0.16	1.6	0	20	20	20	1	0	1	-30	30;
	39	40	0.0011	0.0525	0	602	602	602	1	0	1	-30	30;
	41	42	0.0064	0.1285	0	246	246	246	1	0	1	-30	30;
	41	43	0.0064	0.1285	0	246	246	246	1	0	1	-30	30;
	44	45	0.05	0.1	0	283	283	283	1	0	1	-30	30;
	49	50	0.00522	0.07661	0	412	412	412	1	0	1	-30	30;
	49	51	0.00522	0.07661	0	412	412	412	1	0	1	-30	30;
	49	52	0.00522	0.07661	0	412	412	412	1	0	1	-30	30;
	49	53	0.00522	0.07661	0	412	412	412	1	0	1	-30	30;
	57	58	0.0011	0.0427	0	740	740	740	1	0	1	-30	30;
	61	60	0.002	0.0515	0	613	613	613	1	0	1	-30	30;
	62	63	0.00256	0.12	0	264	264	264	1	0	1	-30	30;
	64	65	0.00256	0.12	0	264	264	264	1	0	1	-30	30;
	66	67	0.00256	0.12	0	264	264	264	1	0	1	-30	30;
	66	68	0.00256	0.12	0	264	264	264	1	0	1	-30	30;
	69	70	0.0027	0.06	0	526	526	526	1	0	1	-30	30;
	71	72	0.0011	0.06	0	527	527	527	1	0	1	-30	30;
	73	74	0.01	0.1	0	315	315	315	1	0	1	-30	30;
	76	77	0.0018	0.0608	0	520	520	520	1	0	1	-30	30;
	77	78	0.00378	0.0806	0	392	392	392	1	0	1	-30	30;
	78	79	0.015	0.27	0	117	117	117	1	0	1	-30	30;
	82	83	0.0015	0.0031	0	9173	9173	9173	1	0	1	-30	30;
	85	84	0.003	0.06	0	526	526	526	1	0	1	-30	30;
	87	86	0.003	0.06	0	526	526	526	1	0	1	-30	30;
	89	88	0.0036	0.072	0	439	439	439	1	0	1	-30	30;
	91	90	0.0036	0.072	0	439	439	439	1	0	1	-30	30;
	94	95	0.00615	0.12	0	263	263	263	1	0	1	-30	30;
	94	102	0.00615	0.12	0	263	263	263	1	0	1	-30	30;
	97	98	0.00282	0.09414	0	336	336	336	1	0	1	-30	30;
	97	99	0.00282	0.09414	0	336	336	336	1	0	1	-30	30;
	97	100	0.0042	0.14004	0	226	226	226	1	0	1	-30	30;
	97	101	0.0042	0.14004	0	226	226	226	1	0	1	-30	30;
	103	104	0.00347	0.115	0	275	275	275	1	0	1	-30	30;
	104	105	0.006	0.06	0	524	524	524	1	0	1	-30	30;
	104	107	0.0044	0.072	0	438	438	438	1	0	1	-30	30;
	105	106	0.0045	0.045	0	699	699	699	1	0	1	-30	30;
	105	108	0.0044	0.072	0	438	438	438	1	0	1	-30	30;
	109	110	0.00635	0.0987	0	320	320	320	1	0	1	-30	30;
	110	111	0.0045	0.045	0	699	699	699	1	0	1	-30	30;
	110	112	0.0044	0.072	0	438	438	438	1	0	1	-30	30;
	113	114	0.00477	0.0917	0	344	344	344	1	0	1	-30	30;
	115	116	0.00447	0.1218	0	260	260	260	1	0	1	-30	30;
	116	118	0.00536	0.13302	0	238	238	238	1	0	1	-30	30;
	117	118	0.00431	0.07931	0	398	398	398	1	0	1	-30	30;
	119	120	0.00552	0.0987	0	320	320	320	1	0	1	-30	30;
	120	121	0.004	0.04	0	786	786	786	1	0	1	-30	30;
	120	122	0.0044	0.072	0	438	438	438	1	0	1	-30	30;
	123	124	0.00535	0.12914	0	245	245	245	1	0	1	-30	30;
	125	126	0.00297	0.1051	0	301	301	301	1	0	1	-30	30;
	125	127	0.00297	0.1051	0	301	301	301	1	0	1	-30	30;
	126	128	0.0006	0.06	0	62	62	62	1	0	1	-30	30;
	127	129	0.0006	0.06	0	62	62	62	1	0	1	-30	30;
	130	131	0.00499	0.1432	0	221	221	221	1	0	1	-30	30;
	132	133	0.00492	0.1179	0	268	268	268	1	0	1	-30	30;
	133	134	0.008	0.08	0	393	393	393	1	0	1	-30	30;
	134	135	0.006	0.06	0	524	524	524	1	0	1	-30	30;
	134	136	0.00011	0.0018	0	26	26	26	1	0	1	-30	30;
	137	138	0.0042	0.14004	0	226	226	226	1	0	1	-30	30;
	137	139	0.0042	0.14044	0	225	225	225	1	0	1	-30	30;
	138	140	0.0044	0.044	0	715	715	715	1	0	1	-30	30;
	139	140	0.0044	0.044	0	715	715	715	1	0	1	-30	30;
	139	141	0.00629	0.06169	0	21	21	21	1	0	1	-30	30;
	143	144	0.00694	0.13939	0	227	227	227	1	0	1	-30	30;
	143	145	0.0042	0.0843	0	375	375	375	1	0	1	-30	30;
	143	146	0.01002	0.10017	0	314	314	314	1	0	1	-30	30;
	143	147	0.012	0.12	0	262	262	262	1	0	1	-30	30;
	144	148	0.00573	0.0573	0	549	549	549	1	0	1	-30	30;
	146	152	0.001	0.01	0	13	13	13	1	0	1	-30	30;
	147	149	0.00573	0.0573	0	549	549	549	1	0	1	-30	30;
	148	152	0.00573	0.0573	0	549	549	549	1	0	1	-30	30;
	149	153	0.96	9.55	0	4	4	4	1	0	1	-30	30;
	150	153	2.667	26.67	0	2	2	2	1	0	1	-30	30;
	151	153	2.667	26.67	0	2	2	2	1	0	1	-30	30;
	152	153	0.00288	0.02865	0	13	13	13	1	0	1	-30	30;
	152	154	2.667	26.67	0	2	2	2	1	0	1	-30	30;
	157	156	0.00563	0.12099	0	261	261	261	1	0	1	-30	30;
	158	159	0.00347	0.115	0	275	275	275	1	0	1	-30	30;
	159	160	0.00011	0.0018	0	9900	9900	9900	1	0	1	-30	30;
	161	163	0.006	0.1078	0	293	293	293	1	0	1	-30	30;
	163	162	0.006	0.06	0	524	524	524	1	0	1	-30	30;
	162	164	0.0044	0.044	0	715	715	715	1	0	1	-30	30;
	163	165	0.0044	0.072	0	438	438	438	1	0	1	-30	30;
	166	167	0.00454	0.1077	0	294	294	294	1	0	1	-30	30;
	167	168	0.0044	0.044	0	715	715	715	1	0	1	-30	30;
	167	169	0.0044	0.072	0	26	26	26	1	0	1	-30	30;
	167	171	0.0063	0.0693	0	454	454	454	1	0	1	-30	30;
	172	173	0.00508	0.07896	0	400	400	400	1	0	1	-30	30;
	173	174	0.0045	0.045	0	699	699	699	1	0	1	-30	30;
	173	175	0.0044	0.072	0	438	438	438	1	0	1	-30	30;
	177	176	0.00363	0.12	0	264	264	264	1	0	1	-30	30;
	188	178	0.005	0.12	0	263	263	263	1	0	1	-30	30;
	188	179	0.00501	0.12	0	263	263	263	1	0	1	-30	30;
	188	180	0.00501	0.12	0	263	263	263	1	0	1	-30	30;
	188	181	0.00501	0.12	0	263	263	263	1	0	1	-30	30;
	188	182	0.00501	0.12	0	263	263	263	1	0	1	-30	30;
	188	183	0.00501	0.12	0	263	263	263	1	0	1	-30	30;
	189	184	0.005	0.12	0	263	263	263	1	0	1	-30	30;
	185	186	0.003	0.0585	0	540	540	540	1	0	1	-30	30;
	185	187	0.003	0.0585	0	540	540	540	1	0	1	-30	30;
];

%%-----  OPF Data  -----%%
%% area data
%	area	refbus
mpc.areas = [
	1	1;
];

%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	0	0	3	0	0.950261	0;
	2	0	0	3	0	0.41091	0;
	2	0	0	3	0	0.193324	0;
	2	0	0	3	0	1.08271	0;
	2	0	0	3	0	0.187727	0;
	2	0	0	3	0	0.685695	0;
	2	0	0	3	0	0.908043	0;
	2	0	0	3	0	0.975515	0;
	2	0	0	3	0	1.031722	0;
	2	0	0	3	0	1.078768	0;
	2	0	0	3	0	0.363147	0;
	2	0	0	3	0	1.033987	0;
	2	0	0	3	0	0.994267	0;
	2	0	0	3	0	0.200299	0;
	2	0	0	3	0	0.625656	0;
	2	0	0	3	0	0.947925	0;
	2	0	0	3	0	0.523605	0;
	2	0	0	3	0	0.194502	0;
	2	0	0	3	0	1.05008	0;
	2	0	0	3	0	0.95958	0;
	2	0	0	3	0	1.036212	0;
	2	0	0	3	0	0.812749	0;
	2	0	0	3	0	1.160191	0;
	2	0	0	3	0	0.607646	0;
	2	0	0	3	0	1.043813	0;
	2	0	0	3	0	0.583193	0;
	2	0	0	3	0	1.204295	0;
	2	0	0	3	0	0.207683	0;
	2	0	0	3	0	0.255753	0;
	2	0	0	3	0	0.655194	0;
	2	0	0	3	0	0.529207	0;
	2	0	0	3	0	0.810865	0;
	2	0	0	3	0	0.474352	0;
	2	0	0	3	0	0.197888	0;
	2	0	0	3	0	0.17339	0;
];