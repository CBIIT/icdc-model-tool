<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

# Integrated Canine Data Commons data model

Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

<p>
<a href="./model-desc/icdc-model.svg">SVG file (in view above)</a>
<p>
<a href="./model-desc">Additional model files</a>


<div id='graph' style='display:off;'>
<svg width="3218pt" height="2966pt"
 viewBox="0.00 0.00 3217.50 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3213.5,-2962 3213.5,4 -4,4"/>
<!-- vital_signs -->
<g id="node1" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M2002.5,-1865.5C2002.5,-1865.5 2289.5,-1865.5 2289.5,-1865.5 2295.5,-1865.5 2301.5,-1871.5 2301.5,-1877.5 2301.5,-1877.5 2301.5,-2175.5 2301.5,-2175.5 2301.5,-2181.5 2295.5,-2187.5 2289.5,-2187.5 2289.5,-2187.5 2002.5,-2187.5 2002.5,-2187.5 1996.5,-2187.5 1990.5,-2181.5 1990.5,-2175.5 1990.5,-2175.5 1990.5,-1877.5 1990.5,-1877.5 1990.5,-1871.5 1996.5,-1865.5 2002.5,-1865.5"/>
<text text-anchor="middle" x="2037" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="2083.5,-1865.5 2083.5,-2187.5 "/>
<text text-anchor="middle" x="2094" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2104.5,-1865.5 2104.5,-2187.5 "/>
<text text-anchor="middle" x="2192.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2164.5 2280.5,-2164.5 "/>
<text text-anchor="middle" x="2192.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2141.5 2280.5,-2141.5 "/>
<text text-anchor="middle" x="2192.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2118.5 2280.5,-2118.5 "/>
<text text-anchor="middle" x="2192.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2095.5 2280.5,-2095.5 "/>
<text text-anchor="middle" x="2192.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2072.5 2280.5,-2072.5 "/>
<text text-anchor="middle" x="2192.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2049.5 2280.5,-2049.5 "/>
<text text-anchor="middle" x="2192.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2026.5 2280.5,-2026.5 "/>
<text text-anchor="middle" x="2192.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="2104.5,-2003.5 2280.5,-2003.5 "/>
<text text-anchor="middle" x="2192.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="2104.5,-1980.5 2280.5,-1980.5 "/>
<text text-anchor="middle" x="2192.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="2104.5,-1957.5 2280.5,-1957.5 "/>
<text text-anchor="middle" x="2192.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2104.5,-1934.5 2280.5,-1934.5 "/>
<text text-anchor="middle" x="2192.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="2104.5,-1911.5 2280.5,-1911.5 "/>
<text text-anchor="middle" x="2192.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="2104.5,-1888.5 2280.5,-1888.5 "/>
<text text-anchor="middle" x="2192.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="2280.5,-1865.5 2280.5,-2187.5 "/>
<text text-anchor="middle" x="2291" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node7" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1950.5,-1549C1950.5,-1549 2125.5,-1549 2125.5,-1549 2131.5,-1549 2137.5,-1555 2137.5,-1561 2137.5,-1561 2137.5,-1583 2137.5,-1583 2137.5,-1589 2131.5,-1595 2125.5,-1595 2125.5,-1595 1950.5,-1595 1950.5,-1595 1944.5,-1595 1938.5,-1589 1938.5,-1583 1938.5,-1583 1938.5,-1561 1938.5,-1561 1938.5,-1555 1944.5,-1549 1950.5,-1549"/>
<text text-anchor="middle" x="1962" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1985.5,-1549 1985.5,-1595 "/>
<text text-anchor="middle" x="1996" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2006.5,-1549 2006.5,-1595 "/>
<text text-anchor="middle" x="2061.5" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="2006.5,-1572 2116.5,-1572 "/>
<text text-anchor="middle" x="2061.5" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2116.5,-1549 2116.5,-1595 "/>
<text text-anchor="middle" x="2127" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2107.6952,-1865.3007C2085.1872,-1770.5793 2058.6949,-1659.0912 2045.8172,-1604.8973"/>
<polygon fill="#000000" stroke="#000000" points="2049.2188,-1604.0727 2043.5017,-1595.1528 2042.4084,-1605.6911 2049.2188,-1604.0727"/>
<text text-anchor="middle" x="2097" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node2" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1687,-.5C1687,-.5 1995,-.5 1995,-.5 2001,-.5 2007,-6.5 2007,-12.5 2007,-12.5 2007,-126.5 2007,-126.5 2007,-132.5 2001,-138.5 1995,-138.5 1995,-138.5 1687,-138.5 1687,-138.5 1681,-138.5 1675,-132.5 1675,-126.5 1675,-126.5 1675,-12.5 1675,-12.5 1675,-6.5 1681,-.5 1687,-.5"/>
<text text-anchor="middle" x="1714" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1753,-.5 1753,-138.5 "/>
<text text-anchor="middle" x="1763.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1774,-.5 1774,-138.5 "/>
<text text-anchor="middle" x="1880" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1774,-115.5 1986,-115.5 "/>
<text text-anchor="middle" x="1880" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1774,-92.5 1986,-92.5 "/>
<text text-anchor="middle" x="1880" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1774,-69.5 1986,-69.5 "/>
<text text-anchor="middle" x="1880" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1774,-46.5 1986,-46.5 "/>
<text text-anchor="middle" x="1880" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1774,-23.5 1986,-23.5 "/>
<text text-anchor="middle" x="1880" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1986,-.5 1986,-138.5 "/>
<text text-anchor="middle" x="1996.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node3" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1721.5,-1065.5C1721.5,-1065.5 1940.5,-1065.5 1940.5,-1065.5 1946.5,-1065.5 1952.5,-1071.5 1952.5,-1077.5 1952.5,-1077.5 1952.5,-1145.5 1952.5,-1145.5 1952.5,-1151.5 1946.5,-1157.5 1940.5,-1157.5 1940.5,-1157.5 1721.5,-1157.5 1721.5,-1157.5 1715.5,-1157.5 1709.5,-1151.5 1709.5,-1145.5 1709.5,-1145.5 1709.5,-1077.5 1709.5,-1077.5 1709.5,-1071.5 1715.5,-1065.5 1721.5,-1065.5"/>
<text text-anchor="middle" x="1734" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1758.5,-1065.5 1758.5,-1157.5 "/>
<text text-anchor="middle" x="1769" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1779.5,-1065.5 1779.5,-1157.5 "/>
<text text-anchor="middle" x="1855.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1779.5,-1134.5 1931.5,-1134.5 "/>
<text text-anchor="middle" x="1855.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1779.5,-1111.5 1931.5,-1111.5 "/>
<text text-anchor="middle" x="1855.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1779.5,-1088.5 1931.5,-1088.5 "/>
<text text-anchor="middle" x="1855.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1931.5,-1065.5 1931.5,-1157.5 "/>
<text text-anchor="middle" x="1942" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort -->
<g id="node4" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2397.5,-524.5C2397.5,-524.5 2630.5,-524.5 2630.5,-524.5 2636.5,-524.5 2642.5,-530.5 2642.5,-536.5 2642.5,-536.5 2642.5,-558.5 2642.5,-558.5 2642.5,-564.5 2636.5,-570.5 2630.5,-570.5 2630.5,-570.5 2397.5,-570.5 2397.5,-570.5 2391.5,-570.5 2385.5,-564.5 2385.5,-558.5 2385.5,-558.5 2385.5,-536.5 2385.5,-536.5 2385.5,-530.5 2391.5,-524.5 2397.5,-524.5"/>
<text text-anchor="middle" x="2417" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2448.5,-524.5 2448.5,-570.5 "/>
<text text-anchor="middle" x="2459" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2469.5,-524.5 2469.5,-570.5 "/>
<text text-anchor="middle" x="2545.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2469.5,-547.5 2621.5,-547.5 "/>
<text text-anchor="middle" x="2545.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2621.5,-524.5 2621.5,-570.5 "/>
<text text-anchor="middle" x="2632" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge26" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1952.6728,-1105.4729C2166.0922,-1093.6463 2589.6202,-1064.0943 2634,-1014 2749.5309,-883.5929 2718.6861,-774.2552 2634,-622 2622.94,-602.1154 2604.1325,-586.858 2584.6468,-575.4858"/>
<polygon fill="#000000" stroke="#000000" points="2586.1178,-572.2999 2575.6716,-570.5314 2582.7349,-578.4283 2586.1178,-572.2999"/>
<text text-anchor="middle" x="2749.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node6" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2197.5,-714.5C2197.5,-714.5 2612.5,-714.5 2612.5,-714.5 2618.5,-714.5 2624.5,-720.5 2624.5,-726.5 2624.5,-726.5 2624.5,-909.5 2624.5,-909.5 2624.5,-915.5 2618.5,-921.5 2612.5,-921.5 2612.5,-921.5 2197.5,-921.5 2197.5,-921.5 2191.5,-921.5 2185.5,-915.5 2185.5,-909.5 2185.5,-909.5 2185.5,-726.5 2185.5,-726.5 2185.5,-720.5 2191.5,-714.5 2197.5,-714.5"/>
<text text-anchor="middle" x="2227" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2268.5,-714.5 2268.5,-921.5 "/>
<text text-anchor="middle" x="2279" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2289.5,-714.5 2289.5,-921.5 "/>
<text text-anchor="middle" x="2446.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2289.5,-898.5 2603.5,-898.5 "/>
<text text-anchor="middle" x="2446.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2289.5,-875.5 2603.5,-875.5 "/>
<text text-anchor="middle" x="2446.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2289.5,-852.5 2603.5,-852.5 "/>
<text text-anchor="middle" x="2446.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2289.5,-829.5 2603.5,-829.5 "/>
<text text-anchor="middle" x="2446.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2289.5,-806.5 2603.5,-806.5 "/>
<text text-anchor="middle" x="2446.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2289.5,-783.5 2603.5,-783.5 "/>
<text text-anchor="middle" x="2446.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2289.5,-760.5 2603.5,-760.5 "/>
<text text-anchor="middle" x="2446.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2289.5,-737.5 2603.5,-737.5 "/>
<text text-anchor="middle" x="2446.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2603.5,-714.5 2603.5,-921.5 "/>
<text text-anchor="middle" x="2614" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge18" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1952.8223,-1090.7198C2021.4562,-1075.7554 2107.1555,-1051.467 2177,-1014 2219.2998,-991.3089 2260.6302,-959.6289 2296.2295,-928.3457"/>
<polygon fill="#000000" stroke="#000000" points="2298.5832,-930.9364 2303.7373,-921.6797 2293.9356,-925.7019 2298.5832,-930.9364"/>
<text text-anchor="middle" x="2187.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node9" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1221.5,-726C1221.5,-726 1668.5,-726 1668.5,-726 1674.5,-726 1680.5,-732 1680.5,-738 1680.5,-738 1680.5,-898 1680.5,-898 1680.5,-904 1674.5,-910 1668.5,-910 1668.5,-910 1221.5,-910 1221.5,-910 1215.5,-910 1209.5,-904 1209.5,-898 1209.5,-898 1209.5,-738 1209.5,-738 1209.5,-732 1215.5,-726 1221.5,-726"/>
<text text-anchor="middle" x="1267" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1324.5,-726 1324.5,-910 "/>
<text text-anchor="middle" x="1335" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1345.5,-726 1345.5,-910 "/>
<text text-anchor="middle" x="1502.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1345.5,-887 1659.5,-887 "/>
<text text-anchor="middle" x="1502.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1345.5,-864 1659.5,-864 "/>
<text text-anchor="middle" x="1502.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1345.5,-841 1659.5,-841 "/>
<text text-anchor="middle" x="1502.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1345.5,-818 1659.5,-818 "/>
<text text-anchor="middle" x="1502.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1345.5,-795 1659.5,-795 "/>
<text text-anchor="middle" x="1502.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1345.5,-772 1659.5,-772 "/>
<text text-anchor="middle" x="1502.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1345.5,-749 1659.5,-749 "/>
<text text-anchor="middle" x="1502.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1659.5,-726 1659.5,-910 "/>
<text text-anchor="middle" x="1670" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge19" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1712.5518,-1065.488C1701.597,-1059.7811 1690.9048,-1053.6063 1681,-1047 1626.6738,-1010.7653 1573.7801,-961.1938 1531.8843,-917.4372"/>
<polygon fill="#000000" stroke="#000000" points="1534.418,-915.0226 1524.9912,-910.1868 1529.3448,-919.8458 1534.418,-915.0226"/>
<text text-anchor="middle" x="1752" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- adverse_event -->
<g id="node14" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1710.5,-622.5C1710.5,-622.5 2105.5,-622.5 2105.5,-622.5 2111.5,-622.5 2117.5,-628.5 2117.5,-634.5 2117.5,-634.5 2117.5,-1001.5 2117.5,-1001.5 2117.5,-1007.5 2111.5,-1013.5 2105.5,-1013.5 2105.5,-1013.5 1710.5,-1013.5 1710.5,-1013.5 1704.5,-1013.5 1698.5,-1007.5 1698.5,-1001.5 1698.5,-1001.5 1698.5,-634.5 1698.5,-634.5 1698.5,-628.5 1704.5,-622.5 1710.5,-622.5"/>
<text text-anchor="middle" x="1758.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1818.5,-622.5 1818.5,-1013.5 "/>
<text text-anchor="middle" x="1829" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1839.5,-622.5 1839.5,-1013.5 "/>
<text text-anchor="middle" x="1968" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1839.5,-990.5 2096.5,-990.5 "/>
<text text-anchor="middle" x="1968" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1839.5,-967.5 2096.5,-967.5 "/>
<text text-anchor="middle" x="1968" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1839.5,-944.5 2096.5,-944.5 "/>
<text text-anchor="middle" x="1968" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1839.5,-921.5 2096.5,-921.5 "/>
<text text-anchor="middle" x="1968" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1839.5,-898.5 2096.5,-898.5 "/>
<text text-anchor="middle" x="1968" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1839.5,-875.5 2096.5,-875.5 "/>
<text text-anchor="middle" x="1968" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1839.5,-852.5 2096.5,-852.5 "/>
<text text-anchor="middle" x="1968" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1839.5,-829.5 2096.5,-829.5 "/>
<text text-anchor="middle" x="1968" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1839.5,-806.5 2096.5,-806.5 "/>
<text text-anchor="middle" x="1968" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1839.5,-783.5 2096.5,-783.5 "/>
<text text-anchor="middle" x="1968" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1839.5,-760.5 2096.5,-760.5 "/>
<text text-anchor="middle" x="1968" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1839.5,-737.5 2096.5,-737.5 "/>
<text text-anchor="middle" x="1968" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1839.5,-714.5 2096.5,-714.5 "/>
<text text-anchor="middle" x="1968" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1839.5,-691.5 2096.5,-691.5 "/>
<text text-anchor="middle" x="1968" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1839.5,-668.5 2096.5,-668.5 "/>
<text text-anchor="middle" x="1968" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1839.5,-645.5 2096.5,-645.5 "/>
<text text-anchor="middle" x="1968" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2096.5,-622.5 2096.5,-1013.5 "/>
<text text-anchor="middle" x="2107" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge20" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1875.7216,-1065.4575C1879.7386,-1059.5721 1883.3007,-1053.3682 1886,-1047 1889.2137,-1039.4185 1892.0524,-1031.5728 1894.5557,-1023.5548"/>
<polygon fill="#000000" stroke="#000000" points="1897.9915,-1024.2759 1897.4455,-1013.6951 1891.2741,-1022.307 1897.9915,-1024.2759"/>
<text text-anchor="middle" x="1960" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- study -->
<g id="node19" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1701,-190.5C1701,-190.5 1981,-190.5 1981,-190.5 1987,-190.5 1993,-196.5 1993,-202.5 1993,-202.5 1993,-339.5 1993,-339.5 1993,-345.5 1987,-351.5 1981,-351.5 1981,-351.5 1701,-351.5 1701,-351.5 1695,-351.5 1689,-345.5 1689,-339.5 1689,-339.5 1689,-202.5 1689,-202.5 1689,-196.5 1695,-190.5 1701,-190.5"/>
<text text-anchor="middle" x="1717" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1745,-190.5 1745,-351.5 "/>
<text text-anchor="middle" x="1755.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1766,-190.5 1766,-351.5 "/>
<text text-anchor="middle" x="1869" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1766,-328.5 1972,-328.5 "/>
<text text-anchor="middle" x="1869" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1766,-305.5 1972,-305.5 "/>
<text text-anchor="middle" x="1869" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1766,-282.5 1972,-282.5 "/>
<text text-anchor="middle" x="1869" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1766,-259.5 1972,-259.5 "/>
<text text-anchor="middle" x="1869" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1766,-236.5 1972,-236.5 "/>
<text text-anchor="middle" x="1869" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1766,-213.5 1972,-213.5 "/>
<text text-anchor="middle" x="1869" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1972,-190.5 1972,-351.5 "/>
<text text-anchor="middle" x="1982.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge25" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1709.486,-1100.72C1536.0335,-1084.1484 1234.4725,-1050.4835 1200,-1014 1139.8925,-950.386 1181,-905.5195 1181,-818 1181,-818 1181,-818 1181,-438 1181,-335.6212 1483.2386,-295.3285 1678.6596,-279.9763"/>
<polygon fill="#000000" stroke="#000000" points="1679.0527,-283.4565 1688.754,-279.198 1678.5144,-276.4772 1679.0527,-283.4565"/>
<text text-anchor="middle" x="1221.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node18" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1368.5,-403.5C1368.5,-403.5 1737.5,-403.5 1737.5,-403.5 1743.5,-403.5 1749.5,-409.5 1749.5,-415.5 1749.5,-415.5 1749.5,-460.5 1749.5,-460.5 1749.5,-466.5 1743.5,-472.5 1737.5,-472.5 1737.5,-472.5 1368.5,-472.5 1368.5,-472.5 1362.5,-472.5 1356.5,-466.5 1356.5,-460.5 1356.5,-460.5 1356.5,-415.5 1356.5,-415.5 1356.5,-409.5 1362.5,-403.5 1368.5,-403.5"/>
<text text-anchor="middle" x="1402.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1448.5,-403.5 1448.5,-472.5 "/>
<text text-anchor="middle" x="1459" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1469.5,-403.5 1469.5,-472.5 "/>
<text text-anchor="middle" x="1599" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="1469.5,-449.5 1728.5,-449.5 "/>
<text text-anchor="middle" x="1599" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1469.5,-426.5 1728.5,-426.5 "/>
<text text-anchor="middle" x="1599" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1728.5,-403.5 1728.5,-472.5 "/>
<text text-anchor="middle" x="1739" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge28" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2385.2632,-537.6099C2236.759,-525.5638 1985.097,-503.195 1759.6606,-473.1967"/>
<polygon fill="#000000" stroke="#000000" points="1760.0001,-469.711 1749.6242,-471.8537 1759.0717,-476.6491 1760.0001,-469.711"/>
<text text-anchor="middle" x="2067.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge27" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2516.8783,-524.4519C2519.4622,-492.5983 2518.8504,-435.3913 2487,-403 2420.8506,-335.7272 2172.0442,-300.3598 2003.2376,-283.702"/>
<polygon fill="#000000" stroke="#000000" points="2003.5392,-280.2149 1993.2469,-282.7287 2002.8604,-287.1819 2003.5392,-280.2149"/>
<text text-anchor="middle" x="2556.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- demographic -->
<g id="node5" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1620,-1232.5C1620,-1232.5 1956,-1232.5 1956,-1232.5 1962,-1232.5 1968,-1238.5 1968,-1244.5 1968,-1244.5 1968,-1381.5 1968,-1381.5 1968,-1387.5 1962,-1393.5 1956,-1393.5 1956,-1393.5 1620,-1393.5 1620,-1393.5 1614,-1393.5 1608,-1387.5 1608,-1381.5 1608,-1381.5 1608,-1244.5 1608,-1244.5 1608,-1238.5 1614,-1232.5 1620,-1232.5"/>
<text text-anchor="middle" x="1663" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1718,-1232.5 1718,-1393.5 "/>
<text text-anchor="middle" x="1728.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1739,-1232.5 1739,-1393.5 "/>
<text text-anchor="middle" x="1843" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1739,-1370.5 1947,-1370.5 "/>
<text text-anchor="middle" x="1843" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1739,-1347.5 1947,-1347.5 "/>
<text text-anchor="middle" x="1843" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1739,-1324.5 1947,-1324.5 "/>
<text text-anchor="middle" x="1843" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1739,-1301.5 1947,-1301.5 "/>
<text text-anchor="middle" x="1843" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1739,-1278.5 1947,-1278.5 "/>
<text text-anchor="middle" x="1843" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1739,-1255.5 1947,-1255.5 "/>
<text text-anchor="middle" x="1843" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1947,-1232.5 1947,-1393.5 "/>
<text text-anchor="middle" x="1957.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge37" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1805.1801,-1232.4932C1809.8229,-1210.7369 1814.746,-1187.6672 1819.0344,-1167.5713"/>
<polygon fill="#000000" stroke="#000000" points="1822.4851,-1168.1713 1821.1493,-1157.661 1815.6392,-1166.7104 1822.4851,-1168.1713"/>
<text text-anchor="middle" x="1845" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge36" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2137.731,-1551.877C2210.6991,-1531.3723 2304.7112,-1491.5762 2351,-1417 2399.7519,-1338.4555 2410.0383,-1280.1368 2351,-1209 2302.5715,-1150.6472 2100.2874,-1127.0071 1962.7659,-1117.5766"/>
<polygon fill="#000000" stroke="#000000" points="1962.7777,-1114.0696 1952.5666,-1116.8949 1962.3109,-1121.0541 1962.7777,-1114.0696"/>
<text text-anchor="middle" x="2418" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge16" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2096.0376,-1595.0098C2127.1529,-1598.9199 2155.5,-1591.25 2155.5,-1572 2155.5,-1554.8555 2133.0147,-1546.8964 2106.1145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="2105.7006,-1544.6454 2096.0376,-1548.9902 2106.301,-1551.6196 2105.7006,-1544.6454"/>
<text text-anchor="middle" x="2171.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node15" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1350,-1278.5C1350,-1278.5 1578,-1278.5 1578,-1278.5 1584,-1278.5 1590,-1284.5 1590,-1290.5 1590,-1290.5 1590,-1335.5 1590,-1335.5 1590,-1341.5 1584,-1347.5 1578,-1347.5 1578,-1347.5 1350,-1347.5 1350,-1347.5 1344,-1347.5 1338,-1341.5 1338,-1335.5 1338,-1335.5 1338,-1290.5 1338,-1290.5 1338,-1284.5 1344,-1278.5 1350,-1278.5"/>
<text text-anchor="middle" x="1365" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1392,-1278.5 1392,-1347.5 "/>
<text text-anchor="middle" x="1402.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1413,-1278.5 1413,-1347.5 "/>
<text text-anchor="middle" x="1491" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1413,-1324.5 1569,-1324.5 "/>
<text text-anchor="middle" x="1491" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1413,-1301.5 1569,-1301.5 "/>
<text text-anchor="middle" x="1491" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1569,-1278.5 1569,-1347.5 "/>
<text text-anchor="middle" x="1579.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge12" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1946.6027,-1548.8954C1855.2524,-1523.7283 1712.4426,-1478.6667 1599,-1417 1567.2183,-1399.7237 1535.0003,-1375.2266 1510.0123,-1354.3471"/>
<polygon fill="#000000" stroke="#000000" points="1512.0588,-1351.4939 1502.1632,-1347.7088 1507.5385,-1356.8388 1512.0588,-1351.4939"/>
<text text-anchor="middle" x="1685.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- diagnosis -->
<g id="node8" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1960.5,-2344.5C1960.5,-2344.5 2303.5,-2344.5 2303.5,-2344.5 2309.5,-2344.5 2315.5,-2350.5 2315.5,-2356.5 2315.5,-2356.5 2315.5,-2631.5 2315.5,-2631.5 2315.5,-2637.5 2309.5,-2643.5 2303.5,-2643.5 2303.5,-2643.5 1960.5,-2643.5 1960.5,-2643.5 1954.5,-2643.5 1948.5,-2637.5 1948.5,-2631.5 1948.5,-2631.5 1948.5,-2356.5 1948.5,-2356.5 1948.5,-2350.5 1954.5,-2344.5 1960.5,-2344.5"/>
<text text-anchor="middle" x="1990.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2032.5,-2344.5 2032.5,-2643.5 "/>
<text text-anchor="middle" x="2043" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2053.5,-2344.5 2053.5,-2643.5 "/>
<text text-anchor="middle" x="2174" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2620.5 2294.5,-2620.5 "/>
<text text-anchor="middle" x="2174" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2597.5 2294.5,-2597.5 "/>
<text text-anchor="middle" x="2174" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2574.5 2294.5,-2574.5 "/>
<text text-anchor="middle" x="2174" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2551.5 2294.5,-2551.5 "/>
<text text-anchor="middle" x="2174" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2528.5 2294.5,-2528.5 "/>
<text text-anchor="middle" x="2174" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2505.5 2294.5,-2505.5 "/>
<text text-anchor="middle" x="2174" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2482.5 2294.5,-2482.5 "/>
<text text-anchor="middle" x="2174" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2459.5 2294.5,-2459.5 "/>
<text text-anchor="middle" x="2174" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2436.5 2294.5,-2436.5 "/>
<text text-anchor="middle" x="2174" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2413.5 2294.5,-2413.5 "/>
<text text-anchor="middle" x="2174" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2390.5 2294.5,-2390.5 "/>
<text text-anchor="middle" x="2174" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2053.5,-2367.5 2294.5,-2367.5 "/>
<text text-anchor="middle" x="2174" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2294.5,-2344.5 2294.5,-2643.5 "/>
<text text-anchor="middle" x="2305" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge35" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2315.8038,-2460.0518C2453.5302,-2430.5029 2625.4209,-2383.4441 2669,-2326 2710.9576,-2270.6933 2688,-1770.921 2688,-1701.5 2688,-1701.5 2688,-1701.5 2688,-1313 2688,-1165.9009 2203.4978,-1126.0907 1963.0835,-1115.3913"/>
<polygon fill="#000000" stroke="#000000" points="1963.0195,-1111.8854 1952.8771,-1114.9481 1962.7158,-1118.8788 1963.0195,-1111.8854"/>
<text text-anchor="middle" x="2715" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node10" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M1779.5,-403.5C1779.5,-403.5 2096.5,-403.5 2096.5,-403.5 2102.5,-403.5 2108.5,-409.5 2108.5,-415.5 2108.5,-415.5 2108.5,-460.5 2108.5,-460.5 2108.5,-466.5 2102.5,-472.5 2096.5,-472.5 2096.5,-472.5 1779.5,-472.5 1779.5,-472.5 1773.5,-472.5 1767.5,-466.5 1767.5,-460.5 1767.5,-460.5 1767.5,-415.5 1767.5,-415.5 1767.5,-409.5 1773.5,-403.5 1779.5,-403.5"/>
<text text-anchor="middle" x="1812.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="1857.5,-403.5 1857.5,-472.5 "/>
<text text-anchor="middle" x="1868" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1878.5,-403.5 1878.5,-472.5 "/>
<text text-anchor="middle" x="1983" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1878.5,-449.5 2087.5,-449.5 "/>
<text text-anchor="middle" x="1983" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1878.5,-426.5 2087.5,-426.5 "/>
<text text-anchor="middle" x="1983" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2087.5,-403.5 2087.5,-472.5 "/>
<text text-anchor="middle" x="2098" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge5" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1917.9015,-403.3975C1910.5723,-390.779 1901.9069,-375.8603 1893.0825,-360.6678"/>
<polygon fill="#000000" stroke="#000000" points="1895.9265,-358.5956 1887.8773,-351.7063 1889.8735,-362.1114 1895.9265,-358.5956"/>
<text text-anchor="middle" x="1936.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- disease_extent -->
<g id="node11" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2332,-1877C2332,-1877 2648,-1877 2648,-1877 2654,-1877 2660,-1883 2660,-1889 2660,-1889 2660,-2164 2660,-2164 2660,-2170 2654,-2176 2648,-2176 2648,-2176 2332,-2176 2332,-2176 2326,-2176 2320,-2170 2320,-2164 2320,-2164 2320,-1889 2320,-1889 2320,-1883 2326,-1877 2332,-1877"/>
<text text-anchor="middle" x="2381.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2443,-1877 2443,-2176 "/>
<text text-anchor="middle" x="2453.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2464,-1877 2464,-2176 "/>
<text text-anchor="middle" x="2551.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2464,-2153 2639,-2153 "/>
<text text-anchor="middle" x="2551.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2464,-2130 2639,-2130 "/>
<text text-anchor="middle" x="2551.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2464,-2107 2639,-2107 "/>
<text text-anchor="middle" x="2551.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2464,-2084 2639,-2084 "/>
<text text-anchor="middle" x="2551.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2464,-2061 2639,-2061 "/>
<text text-anchor="middle" x="2551.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2464,-2038 2639,-2038 "/>
<text text-anchor="middle" x="2551.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2464,-2015 2639,-2015 "/>
<text text-anchor="middle" x="2551.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2464,-1992 2639,-1992 "/>
<text text-anchor="middle" x="2551.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2464,-1969 2639,-1969 "/>
<text text-anchor="middle" x="2551.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2464,-1946 2639,-1946 "/>
<text text-anchor="middle" x="2551.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2464,-1923 2639,-1923 "/>
<text text-anchor="middle" x="2551.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2464,-1900 2639,-1900 "/>
<text text-anchor="middle" x="2551.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2639,-1877 2639,-2176 "/>
<text text-anchor="middle" x="2649.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2420.4932,-1876.7312C2391.647,-1825.1425 2354.6334,-1769.6703 2311,-1727 2251.6346,-1668.9449 2166.2413,-1625.0936 2106.8244,-1599.1012"/>
<polygon fill="#000000" stroke="#000000" points="2108.0876,-1595.8344 2097.5194,-1595.0835 2105.3127,-1602.2609 2108.0876,-1595.8344"/>
<text text-anchor="middle" x="2313" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node12" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M2138.5,-403.5C2138.5,-403.5 2465.5,-403.5 2465.5,-403.5 2471.5,-403.5 2477.5,-409.5 2477.5,-415.5 2477.5,-415.5 2477.5,-460.5 2477.5,-460.5 2477.5,-466.5 2471.5,-472.5 2465.5,-472.5 2465.5,-472.5 2138.5,-472.5 2138.5,-472.5 2132.5,-472.5 2126.5,-466.5 2126.5,-460.5 2126.5,-460.5 2126.5,-415.5 2126.5,-415.5 2126.5,-409.5 2132.5,-403.5 2138.5,-403.5"/>
<text text-anchor="middle" x="2213.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="2300.5,-403.5 2300.5,-472.5 "/>
<text text-anchor="middle" x="2311" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2321.5,-403.5 2321.5,-472.5 "/>
<text text-anchor="middle" x="2389" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="2321.5,-449.5 2456.5,-449.5 "/>
<text text-anchor="middle" x="2389" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2321.5,-426.5 2456.5,-426.5 "/>
<text text-anchor="middle" x="2389" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="2456.5,-403.5 2456.5,-472.5 "/>
<text text-anchor="middle" x="2467" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge4" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2206.7601,-403.4988C2147.9624,-382.199 2070.9937,-354.3166 2002.8385,-329.627"/>
<polygon fill="#000000" stroke="#000000" points="2003.877,-326.2806 1993.2828,-326.1653 2001.4928,-332.8621 2003.877,-326.2806"/>
<text text-anchor="middle" x="2182.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- lab_exam -->
<g id="node13" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1900,-2008.5C1900,-2008.5 1960,-2008.5 1960,-2008.5 1966,-2008.5 1972,-2014.5 1972,-2020.5 1972,-2020.5 1972,-2032.5 1972,-2032.5 1972,-2038.5 1966,-2044.5 1960,-2044.5 1960,-2044.5 1900,-2044.5 1900,-2044.5 1894,-2044.5 1888,-2038.5 1888,-2032.5 1888,-2032.5 1888,-2020.5 1888,-2020.5 1888,-2014.5 1894,-2008.5 1900,-2008.5"/>
<text text-anchor="middle" x="1930" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge6" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1932.0259,-2008.3716C1937.5211,-1961.3496 1954.1923,-1831.8258 1982,-1727 1993.4525,-1683.8281 2011.7608,-1635.6723 2024.3054,-1604.6639"/>
<polygon fill="#000000" stroke="#000000" points="2027.6188,-1605.8078 2028.1597,-1595.2268 2021.1384,-1603.161 2027.6188,-1605.8078"/>
<text text-anchor="middle" x="2018" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge31" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1831.7405,-1013.7233C1830.3485,-1019.8484 1829.0938,-1025.9502 1828,-1032 1826.6501,-1039.4658 1826.0177,-1047.3879 1825.8569,-1055.2268"/>
<polygon fill="#000000" stroke="#000000" points="1822.3577,-1055.4522 1825.8966,-1065.4385 1829.3576,-1055.4249 1822.3577,-1055.4522"/>
<text text-anchor="middle" x="1855" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge13" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2117.7046,-845.2761C2128.876,-838.5862 2135.5,-829.4941 2135.5,-818 2135.5,-809.7386 2132.0781,-802.7181 2126.0052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2127.8073,-793.9155 2117.7046,-790.7239 2123.6119,-799.519 2127.8073,-793.9155"/>
<text text-anchor="middle" x="2151.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node22" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1795,-524.5C1795,-524.5 2021,-524.5 2021,-524.5 2027,-524.5 2033,-530.5 2033,-536.5 2033,-536.5 2033,-558.5 2033,-558.5 2033,-564.5 2027,-570.5 2021,-570.5 2021,-570.5 1795,-570.5 1795,-570.5 1789,-570.5 1783,-564.5 1783,-558.5 1783,-558.5 1783,-536.5 1783,-536.5 1783,-530.5 1789,-524.5 1795,-524.5"/>
<text text-anchor="middle" x="1811.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1840,-524.5 1840,-570.5 "/>
<text text-anchor="middle" x="1850.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1861,-524.5 1861,-570.5 "/>
<text text-anchor="middle" x="1936.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1861,-547.5 2012,-547.5 "/>
<text text-anchor="middle" x="1936.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2012,-524.5 2012,-570.5 "/>
<text text-anchor="middle" x="2022.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge22" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1908,-622.4901C1908,-606.8636 1908,-592.5861 1908,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1911.5001,-580.664 1908,-570.6641 1904.5001,-580.6641 1911.5001,-580.664"/>
<text text-anchor="middle" x="1939" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge30" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1503.1225,-1278.4849C1529.0905,-1256.7091 1564.6088,-1229.018 1599,-1209 1630.4944,-1190.6681 1666.094,-1173.9317 1699.7805,-1159.6972"/>
<polygon fill="#000000" stroke="#000000" points="1701.3492,-1162.835 1709.2261,-1155.7494 1698.6498,-1156.3764 1701.3492,-1162.835"/>
<text text-anchor="middle" x="1688" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node16" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1335,-2836C1335,-2836 1371,-2836 1371,-2836 1377,-2836 1383,-2842 1383,-2848 1383,-2848 1383,-2860 1383,-2860 1383,-2866 1377,-2872 1371,-2872 1371,-2872 1335,-2872 1335,-2872 1329,-2872 1323,-2866 1323,-2860 1323,-2860 1323,-2848 1323,-2848 1323,-2842 1329,-2836 1335,-2836"/>
<text text-anchor="middle" x="1353" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node23" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1303,-2662.5C1303,-2662.5 1335,-2662.5 1335,-2662.5 1341,-2662.5 1347,-2668.5 1347,-2674.5 1347,-2674.5 1347,-2686.5 1347,-2686.5 1347,-2692.5 1341,-2698.5 1335,-2698.5 1335,-2698.5 1303,-2698.5 1303,-2698.5 1297,-2698.5 1291,-2692.5 1291,-2686.5 1291,-2686.5 1291,-2674.5 1291,-2674.5 1291,-2668.5 1297,-2662.5 1303,-2662.5"/>
<text text-anchor="middle" x="1319" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge2" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1349.4257,-2835.7604C1343.4824,-2805.4321 1331.5283,-2744.4314 1324.5032,-2708.5827"/>
<polygon fill="#000000" stroke="#000000" points="1327.9353,-2707.8958 1322.5775,-2698.7556 1321.0659,-2709.242 1327.9353,-2707.8958"/>
<text text-anchor="middle" x="1360.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- prior_therapy -->
<g id="node17" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M40,-1727.5C40,-1727.5 496,-1727.5 496,-1727.5 502,-1727.5 508,-1733.5 508,-1739.5 508,-1739.5 508,-2313.5 508,-2313.5 508,-2319.5 502,-2325.5 496,-2325.5 496,-2325.5 40,-2325.5 40,-2325.5 34,-2325.5 28,-2319.5 28,-2313.5 28,-2313.5 28,-1739.5 28,-1739.5 28,-1733.5 34,-1727.5 40,-1727.5"/>
<text text-anchor="middle" x="85.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="143,-1727.5 143,-2325.5 "/>
<text text-anchor="middle" x="153.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="164,-1727.5 164,-2325.5 "/>
<text text-anchor="middle" x="325.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="164,-2302.5 487,-2302.5 "/>
<text text-anchor="middle" x="325.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2279.5 487,-2279.5 "/>
<text text-anchor="middle" x="325.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-2256.5 487,-2256.5 "/>
<text text-anchor="middle" x="325.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="164,-2233.5 487,-2233.5 "/>
<text text-anchor="middle" x="325.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2210.5 487,-2210.5 "/>
<text text-anchor="middle" x="325.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-2187.5 487,-2187.5 "/>
<text text-anchor="middle" x="325.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="164,-2164.5 487,-2164.5 "/>
<text text-anchor="middle" x="325.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="164,-2141.5 487,-2141.5 "/>
<text text-anchor="middle" x="325.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="164,-2118.5 487,-2118.5 "/>
<text text-anchor="middle" x="325.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="164,-2095.5 487,-2095.5 "/>
<text text-anchor="middle" x="325.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="164,-2072.5 487,-2072.5 "/>
<text text-anchor="middle" x="325.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="164,-2049.5 487,-2049.5 "/>
<text text-anchor="middle" x="325.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="164,-2026.5 487,-2026.5 "/>
<text text-anchor="middle" x="325.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-2003.5 487,-2003.5 "/>
<text text-anchor="middle" x="325.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-1980.5 487,-1980.5 "/>
<text text-anchor="middle" x="325.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="164,-1957.5 487,-1957.5 "/>
<text text-anchor="middle" x="325.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="164,-1934.5 487,-1934.5 "/>
<text text-anchor="middle" x="325.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="164,-1911.5 487,-1911.5 "/>
<text text-anchor="middle" x="325.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="164,-1888.5 487,-1888.5 "/>
<text text-anchor="middle" x="325.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="164,-1865.5 487,-1865.5 "/>
<text text-anchor="middle" x="325.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="164,-1842.5 487,-1842.5 "/>
<text text-anchor="middle" x="325.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="164,-1819.5 487,-1819.5 "/>
<text text-anchor="middle" x="325.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="164,-1796.5 487,-1796.5 "/>
<text text-anchor="middle" x="325.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="164,-1773.5 487,-1773.5 "/>
<text text-anchor="middle" x="325.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="164,-1750.5 487,-1750.5 "/>
<text text-anchor="middle" x="325.5" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="487,-1727.5 487,-2325.5 "/>
<text text-anchor="middle" x="497.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge14" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M508.2384,-2064.6912C519.4387,-2055.0507 526,-2042.3203 526,-2026.5 526,-2014.3876 522.1539,-2004.0864 515.3244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="517.719,-1993.0385 508.2384,-1988.3088 512.7002,-1997.9183 517.719,-1993.0385"/>
<text text-anchor="middle" x="542" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node21" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M748.5,-1468.5C748.5,-1468.5 1097.5,-1468.5 1097.5,-1468.5 1103.5,-1468.5 1109.5,-1474.5 1109.5,-1480.5 1109.5,-1480.5 1109.5,-1663.5 1109.5,-1663.5 1109.5,-1669.5 1103.5,-1675.5 1097.5,-1675.5 1097.5,-1675.5 748.5,-1675.5 748.5,-1675.5 742.5,-1675.5 736.5,-1669.5 736.5,-1663.5 736.5,-1663.5 736.5,-1480.5 736.5,-1480.5 736.5,-1474.5 742.5,-1468.5 748.5,-1468.5"/>
<text text-anchor="middle" x="784" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="831.5,-1468.5 831.5,-1675.5 "/>
<text text-anchor="middle" x="842" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="852.5,-1468.5 852.5,-1675.5 "/>
<text text-anchor="middle" x="970.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="852.5,-1652.5 1088.5,-1652.5 "/>
<text text-anchor="middle" x="970.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="852.5,-1629.5 1088.5,-1629.5 "/>
<text text-anchor="middle" x="970.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="852.5,-1606.5 1088.5,-1606.5 "/>
<text text-anchor="middle" x="970.5" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="852.5,-1583.5 1088.5,-1583.5 "/>
<text text-anchor="middle" x="970.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="852.5,-1560.5 1088.5,-1560.5 "/>
<text text-anchor="middle" x="970.5" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="852.5,-1537.5 1088.5,-1537.5 "/>
<text text-anchor="middle" x="970.5" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="852.5,-1514.5 1088.5,-1514.5 "/>
<text text-anchor="middle" x="970.5" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="852.5,-1491.5 1088.5,-1491.5 "/>
<text text-anchor="middle" x="970.5" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1088.5,-1468.5 1088.5,-1675.5 "/>
<text text-anchor="middle" x="1099" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge43" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M508.2134,-1771.378C527.4318,-1755.5444 547.1193,-1740.5556 567,-1727 615.8321,-1693.7041 672.974,-1665.0337 727.0055,-1641.7262"/>
<polygon fill="#000000" stroke="#000000" points="728.528,-1644.8818 736.3494,-1637.735 725.7784,-1638.4444 728.528,-1644.8818"/>
<text text-anchor="middle" x="662" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge24" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1612.6738,-403.3975C1636.34,-389.6744 1664.6981,-373.2306 1693.2528,-356.6729"/>
<polygon fill="#000000" stroke="#000000" points="1695.2208,-359.5776 1702.1159,-351.5335 1691.7094,-353.522 1695.2208,-359.5776"/>
<text text-anchor="middle" x="1703.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge29" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1841,-190.4932C1841,-176.7786 1841,-162.5421 1841,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="1844.5001,-148.5183 1841,-138.5184 1837.5001,-148.5184 1844.5001,-148.5183"/>
<text text-anchor="middle" x="1881.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node20" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1998,-1209.5C1998,-1209.5 2330,-1209.5 2330,-1209.5 2336,-1209.5 2342,-1215.5 2342,-1221.5 2342,-1221.5 2342,-1404.5 2342,-1404.5 2342,-1410.5 2336,-1416.5 2330,-1416.5 2330,-1416.5 1998,-1416.5 1998,-1416.5 1992,-1416.5 1986,-1410.5 1986,-1404.5 1986,-1404.5 1986,-1221.5 1986,-1221.5 1986,-1215.5 1992,-1209.5 1998,-1209.5"/>
<text text-anchor="middle" x="2028.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2071,-1209.5 2071,-1416.5 "/>
<text text-anchor="middle" x="2081.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2092,-1209.5 2092,-1416.5 "/>
<text text-anchor="middle" x="2206.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2092,-1393.5 2321,-1393.5 "/>
<text text-anchor="middle" x="2206.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2092,-1370.5 2321,-1370.5 "/>
<text text-anchor="middle" x="2206.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2092,-1347.5 2321,-1347.5 "/>
<text text-anchor="middle" x="2206.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2092,-1324.5 2321,-1324.5 "/>
<text text-anchor="middle" x="2206.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2092,-1301.5 2321,-1301.5 "/>
<text text-anchor="middle" x="2206.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2092,-1278.5 2321,-1278.5 "/>
<text text-anchor="middle" x="2206.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2092,-1255.5 2321,-1255.5 "/>
<text text-anchor="middle" x="2206.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2092,-1232.5 2321,-1232.5 "/>
<text text-anchor="middle" x="2206.5" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2321,-1209.5 2321,-1416.5 "/>
<text text-anchor="middle" x="2331.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge34" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1992.6227,-1209.2987C1965.9397,-1193.1527 1939.4238,-1177.1078 1915.8194,-1162.8247"/>
<polygon fill="#000000" stroke="#000000" points="1917.6275,-1159.8279 1907.2599,-1157.6452 1914.0035,-1165.8168 1917.6275,-1159.8279"/>
<text text-anchor="middle" x="1984" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge33" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M969.0458,-1468.1243C1020.8232,-1367.2104 1115.8488,-1222.5965 1252,-1176 1331.9588,-1148.6349 1554.2571,-1129.5114 1698.986,-1119.5307"/>
<polygon fill="#000000" stroke="#000000" points="1699.5313,-1123.0017 1709.2694,-1118.8279 1699.054,-1116.018 1699.5313,-1123.0017"/>
<text text-anchor="middle" x="1211" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge21" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1833.1474,-524.4117C1787.1864,-510.2349 1727.2355,-491.7431 1674.5918,-475.5051"/>
<polygon fill="#000000" stroke="#000000" points="1675.4396,-472.1039 1664.8522,-472.5009 1673.3763,-478.7929 1675.4396,-472.1039"/>
<text text-anchor="middle" x="1821.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- sample -->
<g id="node24" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1026.5,-1750.5C1026.5,-1750.5 1449.5,-1750.5 1449.5,-1750.5 1455.5,-1750.5 1461.5,-1756.5 1461.5,-1762.5 1461.5,-1762.5 1461.5,-2290.5 1461.5,-2290.5 1461.5,-2296.5 1455.5,-2302.5 1449.5,-2302.5 1449.5,-2302.5 1026.5,-2302.5 1026.5,-2302.5 1020.5,-2302.5 1014.5,-2296.5 1014.5,-2290.5 1014.5,-2290.5 1014.5,-1762.5 1014.5,-1762.5 1014.5,-1756.5 1020.5,-1750.5 1026.5,-1750.5"/>
<text text-anchor="middle" x="1048.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1082.5,-1750.5 1082.5,-2302.5 "/>
<text text-anchor="middle" x="1093" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1103.5,-1750.5 1103.5,-2302.5 "/>
<text text-anchor="middle" x="1272" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2279.5 1440.5,-2279.5 "/>
<text text-anchor="middle" x="1272" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2256.5 1440.5,-2256.5 "/>
<text text-anchor="middle" x="1272" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2233.5 1440.5,-2233.5 "/>
<text text-anchor="middle" x="1272" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2210.5 1440.5,-2210.5 "/>
<text text-anchor="middle" x="1272" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2187.5 1440.5,-2187.5 "/>
<text text-anchor="middle" x="1272" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2164.5 1440.5,-2164.5 "/>
<text text-anchor="middle" x="1272" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2141.5 1440.5,-2141.5 "/>
<text text-anchor="middle" x="1272" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2118.5 1440.5,-2118.5 "/>
<text text-anchor="middle" x="1272" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2095.5 1440.5,-2095.5 "/>
<text text-anchor="middle" x="1272" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2072.5 1440.5,-2072.5 "/>
<text text-anchor="middle" x="1272" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2049.5 1440.5,-2049.5 "/>
<text text-anchor="middle" x="1272" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2026.5 1440.5,-2026.5 "/>
<text text-anchor="middle" x="1272" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1103.5,-2003.5 1440.5,-2003.5 "/>
<text text-anchor="middle" x="1272" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1980.5 1440.5,-1980.5 "/>
<text text-anchor="middle" x="1272" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1957.5 1440.5,-1957.5 "/>
<text text-anchor="middle" x="1272" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1934.5 1440.5,-1934.5 "/>
<text text-anchor="middle" x="1272" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1911.5 1440.5,-1911.5 "/>
<text text-anchor="middle" x="1272" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1888.5 1440.5,-1888.5 "/>
<text text-anchor="middle" x="1272" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1865.5 1440.5,-1865.5 "/>
<text text-anchor="middle" x="1272" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1842.5 1440.5,-1842.5 "/>
<text text-anchor="middle" x="1272" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1819.5 1440.5,-1819.5 "/>
<text text-anchor="middle" x="1272" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1796.5 1440.5,-1796.5 "/>
<text text-anchor="middle" x="1272" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1773.5 1440.5,-1773.5 "/>
<text text-anchor="middle" x="1272" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1440.5,-1750.5 1440.5,-2302.5 "/>
<text text-anchor="middle" x="1451" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge38" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1316.7491,-2662.3257C1310.3301,-2610.4988 1291.2513,-2456.4546 1273.4814,-2312.9795"/>
<polygon fill="#000000" stroke="#000000" points="1276.9071,-2312.163 1272.2044,-2302.6691 1269.9602,-2313.0235 1276.9071,-2312.163"/>
<text text-anchor="middle" x="1350.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge32" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1234.7407,-1750.3207C1238.3867,-1544.4795 1257.8163,-1286.1946 1329,-1209 1377.9788,-1155.8854 1567.5948,-1130.8981 1699.2213,-1119.7423"/>
<polygon fill="#000000" stroke="#000000" points="1699.711,-1123.2138 1709.3871,-1118.8984 1699.1318,-1116.2378 1699.711,-1123.2138"/>
<text text-anchor="middle" x="1283" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1355.0306,-1750.2466C1371.7956,-1729.1084 1390.7139,-1709.8675 1412,-1694 1492.189,-1634.224 1770.9529,-1598.0585 1928.0895,-1581.9487"/>
<polygon fill="#000000" stroke="#000000" points="1928.665,-1585.4083 1938.2605,-1580.9165 1927.9582,-1578.4441 1928.665,-1585.4083"/>
<text text-anchor="middle" x="1440" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge15" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1461.5955,-2065.8333C1472.8572,-2056.0642 1479.5,-2042.9531 1479.5,-2026.5 1479.5,-2013.9031 1475.6061,-2003.2652 1468.7267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="1471.0485,-1991.9513 1461.5955,-1987.1667 1466.0016,-1996.802 1471.0485,-1991.9513"/>
<text text-anchor="middle" x="1495.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery -->
<g id="node25" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M588,-1946C588,-1946 934,-1946 934,-1946 940,-1946 946,-1952 946,-1958 946,-1958 946,-2095 946,-2095 946,-2101 940,-2107 934,-2107 934,-2107 588,-2107 588,-2107 582,-2107 576,-2101 576,-2095 576,-2095 576,-1958 576,-1958 576,-1952 582,-1946 588,-1946"/>
<text text-anchor="middle" x="633.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="691,-1946 691,-2107 "/>
<text text-anchor="middle" x="701.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="712,-1946 712,-2107 "/>
<text text-anchor="middle" x="818.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="712,-2084 925,-2084 "/>
<text text-anchor="middle" x="818.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="712,-2061 925,-2061 "/>
<text text-anchor="middle" x="818.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="712,-2038 925,-2038 "/>
<text text-anchor="middle" x="818.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="712,-2015 925,-2015 "/>
<text text-anchor="middle" x="818.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="712,-1992 925,-1992 "/>
<text text-anchor="middle" x="818.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="712,-1969 925,-1969 "/>
<text text-anchor="middle" x="818.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="925,-1946 925,-2107 "/>
<text text-anchor="middle" x="935.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge41" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M789.7757,-1945.7682C815.5938,-1873.3341 853.7521,-1766.2789 882.6215,-1685.2842"/>
<polygon fill="#000000" stroke="#000000" points="886.0339,-1686.1347 886.0946,-1675.5401 879.4403,-1683.7845 886.0339,-1686.1347"/>
<text text-anchor="middle" x="926" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge17" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M946.113,-2068.5585C957.2907,-2058.5547 964,-2044.5352 964,-2026.5 964,-2012.5509 959.9865,-2001.004 952.9962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="955.4806,-1989.3911 946.113,-1984.4415 950.3494,-1994.1525 955.4806,-1989.3911"/>
<text text-anchor="middle" x="980" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- file -->
<g id="node26" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1107.5,-2750.5C1107.5,-2750.5 1292.5,-2750.5 1292.5,-2750.5 1298.5,-2750.5 1304.5,-2756.5 1304.5,-2762.5 1304.5,-2762.5 1304.5,-2945.5 1304.5,-2945.5 1304.5,-2951.5 1298.5,-2957.5 1292.5,-2957.5 1292.5,-2957.5 1107.5,-2957.5 1107.5,-2957.5 1101.5,-2957.5 1095.5,-2951.5 1095.5,-2945.5 1095.5,-2945.5 1095.5,-2762.5 1095.5,-2762.5 1095.5,-2756.5 1101.5,-2750.5 1107.5,-2750.5"/>
<text text-anchor="middle" x="1115" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1134.5,-2750.5 1134.5,-2957.5 "/>
<text text-anchor="middle" x="1145" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1155.5,-2750.5 1155.5,-2957.5 "/>
<text text-anchor="middle" x="1219.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2934.5 1283.5,-2934.5 "/>
<text text-anchor="middle" x="1219.5" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2911.5 1283.5,-2911.5 "/>
<text text-anchor="middle" x="1219.5" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2888.5 1283.5,-2888.5 "/>
<text text-anchor="middle" x="1219.5" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2865.5 1283.5,-2865.5 "/>
<text text-anchor="middle" x="1219.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2842.5 1283.5,-2842.5 "/>
<text text-anchor="middle" x="1219.5" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2819.5 1283.5,-2819.5 "/>
<text text-anchor="middle" x="1219.5" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2796.5 1283.5,-2796.5 "/>
<text text-anchor="middle" x="1219.5" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1155.5,-2773.5 1283.5,-2773.5 "/>
<text text-anchor="middle" x="1219.5" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1283.5,-2750.5 1283.5,-2957.5 "/>
<text text-anchor="middle" x="1294" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge40" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1304.7939,-2755.1171C1307.8387,-2753.3161 1310.9094,-2751.6055 1314,-2750 1346.7258,-2732.9994 1359.4141,-2741.677 1395,-2732 1581.4702,-2681.2923 1790.8538,-2612.5081 1938.6528,-2561.9256"/>
<polygon fill="#000000" stroke="#000000" points="1939.9727,-2565.1731 1948.2981,-2558.6205 1937.7035,-2558.5511 1939.9727,-2565.1731"/>
<text text-anchor="middle" x="1493.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge3" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1095.3457,-2849.8073C803.175,-2836.719 0,-2790.7163 0,-2680.5 0,-2680.5 0,-2680.5 0,-438 0,-354.0948 1228.8821,-295.8188 1678.6245,-277.3007"/>
<polygon fill="#000000" stroke="#000000" points="1678.929,-280.7912 1688.777,-276.884 1678.6418,-273.7971 1678.929,-280.7912"/>
<text text-anchor="middle" x="30.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge1" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1239.0409,-2750.1667C1245.7405,-2738.3402 1253.3752,-2726.9715 1262,-2717 1267.691,-2710.4204 1274.8572,-2704.5939 1282.1696,-2699.635"/>
<polygon fill="#000000" stroke="#000000" points="1284.1567,-2702.5196 1290.7412,-2694.2192 1280.4177,-2696.6019 1284.1567,-2702.5196"/>
<text text-anchor="middle" x="1292.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge39" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1204.7551,-2750.4524C1209.7679,-2641.291 1217.8872,-2464.4826 1224.8469,-2312.927"/>
<polygon fill="#000000" stroke="#000000" points="1228.3622,-2312.6713 1225.3247,-2302.5212 1221.3696,-2312.3501 1228.3622,-2312.6713"/>
<text text-anchor="middle" x="1245.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- physical_exam -->
<g id="node27" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1542,-1934.5C1542,-1934.5 1858,-1934.5 1858,-1934.5 1864,-1934.5 1870,-1940.5 1870,-1946.5 1870,-1946.5 1870,-2106.5 1870,-2106.5 1870,-2112.5 1864,-2118.5 1858,-2118.5 1858,-2118.5 1542,-2118.5 1542,-2118.5 1536,-2118.5 1530,-2112.5 1530,-2106.5 1530,-2106.5 1530,-1946.5 1530,-1946.5 1530,-1940.5 1536,-1934.5 1542,-1934.5"/>
<text text-anchor="middle" x="1591" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1652,-1934.5 1652,-2118.5 "/>
<text text-anchor="middle" x="1662.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1673,-1934.5 1673,-2118.5 "/>
<text text-anchor="middle" x="1761" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1673,-2095.5 1849,-2095.5 "/>
<text text-anchor="middle" x="1761" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1673,-2072.5 1849,-2072.5 "/>
<text text-anchor="middle" x="1761" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1673,-2049.5 1849,-2049.5 "/>
<text text-anchor="middle" x="1761" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1673,-2026.5 1849,-2026.5 "/>
<text text-anchor="middle" x="1761" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1673,-2003.5 1849,-2003.5 "/>
<text text-anchor="middle" x="1761" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1673,-1980.5 1849,-1980.5 "/>
<text text-anchor="middle" x="1761" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1673,-1957.5 1849,-1957.5 "/>
<text text-anchor="middle" x="1761" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1849,-1934.5 1849,-2118.5 "/>
<text text-anchor="middle" x="1859.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1746.9179,-1934.401C1780.0944,-1873.0283 1827.6623,-1792.0107 1879,-1727 1916.7114,-1679.2448 1968.3664,-1631.4524 2002.4331,-1601.8242"/>
<polygon fill="#000000" stroke="#000000" points="2004.9885,-1604.242 2010.271,-1595.058 2000.4143,-1598.9432 2004.9885,-1604.242"/>
<text text-anchor="middle" x="1934" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge42" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1668.8028,-1934.2721C1635.0845,-1851.8758 1572.28,-1737.6418 1472,-1694 1360.2237,-1645.355 1226.8923,-1615.1404 1119.6175,-1596.9495"/>
<polygon fill="#000000" stroke="#000000" points="1120.0889,-1593.4798 1109.6482,-1595.2807 1118.9332,-1600.3837 1120.0889,-1593.4798"/>
<text text-anchor="middle" x="1551" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent_administration -->
<g id="node28" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M2728.5,-1785C2728.5,-1785 3197.5,-1785 3197.5,-1785 3203.5,-1785 3209.5,-1791 3209.5,-1797 3209.5,-1797 3209.5,-2256 3209.5,-2256 3209.5,-2262 3203.5,-2268 3197.5,-2268 3197.5,-2268 2728.5,-2268 2728.5,-2268 2722.5,-2268 2716.5,-2262 2716.5,-2256 2716.5,-2256 2716.5,-1797 2716.5,-1797 2716.5,-1791 2722.5,-1785 2728.5,-1785"/>
<text text-anchor="middle" x="2801.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2886.5,-1785 2886.5,-2268 "/>
<text text-anchor="middle" x="2897" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2907.5,-1785 2907.5,-2268 "/>
<text text-anchor="middle" x="3048" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2245 3188.5,-2245 "/>
<text text-anchor="middle" x="3048" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2222 3188.5,-2222 "/>
<text text-anchor="middle" x="3048" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2199 3188.5,-2199 "/>
<text text-anchor="middle" x="3048" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2176 3188.5,-2176 "/>
<text text-anchor="middle" x="3048" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2153 3188.5,-2153 "/>
<text text-anchor="middle" x="3048" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2130 3188.5,-2130 "/>
<text text-anchor="middle" x="3048" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2107 3188.5,-2107 "/>
<text text-anchor="middle" x="3048" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2084 3188.5,-2084 "/>
<text text-anchor="middle" x="3048" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2061 3188.5,-2061 "/>
<text text-anchor="middle" x="3048" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2038 3188.5,-2038 "/>
<text text-anchor="middle" x="3048" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2907.5,-2015 3188.5,-2015 "/>
<text text-anchor="middle" x="3048" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1992 3188.5,-1992 "/>
<text text-anchor="middle" x="3048" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1969 3188.5,-1969 "/>
<text text-anchor="middle" x="3048" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1946 3188.5,-1946 "/>
<text text-anchor="middle" x="3048" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1923 3188.5,-1923 "/>
<text text-anchor="middle" x="3048" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1900 3188.5,-1900 "/>
<text text-anchor="middle" x="3048" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1877 3188.5,-1877 "/>
<text text-anchor="middle" x="3048" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1854 3188.5,-1854 "/>
<text text-anchor="middle" x="3048" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1831 3188.5,-1831 "/>
<text text-anchor="middle" x="3048" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2907.5,-1808 3188.5,-1808 "/>
<text text-anchor="middle" x="3048" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="3188.5,-1785 3188.5,-2268 "/>
<text text-anchor="middle" x="3199" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2751.5572,-1784.9423C2725.355,-1763.2252 2697.6486,-1743.3183 2669,-1727 2502.5379,-1632.1827 2279.2442,-1594.9538 2147.7768,-1580.634"/>
<polygon fill="#000000" stroke="#000000" points="2148.0056,-1577.1386 2137.6914,-1579.5608 2147.2649,-1584.0993 2148.0056,-1577.1386"/>
<text text-anchor="middle" x="2650" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge23" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2818.9515,-1784.8022C2790.9034,-1718.1358 2770,-1644.224 2770,-1572 2770,-1572 2770,-1572 2770,-1039.5 2770,-853.8401 2883.682,-756.7846 2756,-622 2731.8704,-596.5281 2276.7913,-567.8454 2043.4873,-554.7363"/>
<polygon fill="#000000" stroke="#000000" points="2043.4115,-551.2266 2033.2315,-554.162 2043.0201,-558.2157 2043.4115,-551.2266"/>
<text text-anchor="middle" x="2801" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
</g>
</svg>
</div>
