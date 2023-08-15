<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

[![Build Status](https://travis-ci.org/CBIIT/icdc-model-tool.svg?branch=master)](https://travis-ci.org/CBIIT/icdc-model-tool)

# Integrated Canine Data Commons Data Model

[View model on GitHub Pages](https://cbiit.github.io/icdc-model-tool/)




Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

<p>
<a href="./model-desc/icdc-model-tool.svg">SVG file (in view above)</a>
<p>
<a href="./model-desc">Additional model files</a>
<div id='graph' style='display:off;'>
<svg width="4192pt" height="3104pt"
 viewBox="0.00 0.00 4192.00 3104.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 3100)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-3100 4188,-3100 4188,4 -4,4"/>
<!-- case -->
<g id="node1" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1597,-1249.5C1597,-1249.5 1816,-1249.5 1816,-1249.5 1822,-1249.5 1828,-1255.5 1828,-1261.5 1828,-1261.5 1828,-1306.5 1828,-1306.5 1828,-1312.5 1822,-1318.5 1816,-1318.5 1816,-1318.5 1597,-1318.5 1597,-1318.5 1591,-1318.5 1585,-1312.5 1585,-1306.5 1585,-1306.5 1585,-1261.5 1585,-1261.5 1585,-1255.5 1591,-1249.5 1597,-1249.5"/>
<text text-anchor="middle" x="1609.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1634,-1249.5 1634,-1318.5 "/>
<text text-anchor="middle" x="1644.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1655,-1249.5 1655,-1318.5 "/>
<text text-anchor="middle" x="1731" y="-1303.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1655,-1295.5 1807,-1295.5 "/>
<text text-anchor="middle" x="1731" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1655,-1272.5 1807,-1272.5 "/>
<text text-anchor="middle" x="1731" y="-1257.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1807,-1249.5 1807,-1318.5 "/>
<text text-anchor="middle" x="1817.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort -->
<g id="node10" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2000,-639.5C2000,-639.5 2233,-639.5 2233,-639.5 2239,-639.5 2245,-645.5 2245,-651.5 2245,-651.5 2245,-696.5 2245,-696.5 2245,-702.5 2239,-708.5 2233,-708.5 2233,-708.5 2000,-708.5 2000,-708.5 1994,-708.5 1988,-702.5 1988,-696.5 1988,-696.5 1988,-651.5 1988,-651.5 1988,-645.5 1994,-639.5 2000,-639.5"/>
<text text-anchor="middle" x="2019.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2051,-639.5 2051,-708.5 "/>
<text text-anchor="middle" x="2061.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2072,-639.5 2072,-708.5 "/>
<text text-anchor="middle" x="2148" y="-693.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2072,-685.5 2224,-685.5 "/>
<text text-anchor="middle" x="2148" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2072,-662.5 2224,-662.5 "/>
<text text-anchor="middle" x="2148" y="-647.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_id</text>
<polyline fill="none" stroke="#000000" points="2224,-639.5 2224,-708.5 "/>
<text text-anchor="middle" x="2234.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge4" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1828.0869,-1273.2635C1929.397,-1261.5487 2062.4388,-1238.7727 2096.5,-1198 2213.1657,-1058.3465 2159.8388,-817.3191 2130.855,-718.3635"/>
<polygon fill="#000000" stroke="#000000" points="2134.1785,-717.2607 2127.9628,-708.6807 2127.4713,-719.2641 2134.1785,-717.2607"/>
<text text-anchor="middle" x="2209" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node12" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1630,-760.5C1630,-760.5 2025,-760.5 2025,-760.5 2031,-760.5 2037,-766.5 2037,-772.5 2037,-772.5 2037,-1185.5 2037,-1185.5 2037,-1191.5 2031,-1197.5 2025,-1197.5 2025,-1197.5 1630,-1197.5 1630,-1197.5 1624,-1197.5 1618,-1191.5 1618,-1185.5 1618,-1185.5 1618,-772.5 1618,-772.5 1618,-766.5 1624,-760.5 1630,-760.5"/>
<text text-anchor="middle" x="1678" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1738,-760.5 1738,-1197.5 "/>
<text text-anchor="middle" x="1748.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1759,-760.5 1759,-1197.5 "/>
<text text-anchor="middle" x="1887.5" y="-1182.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_agent_dose</text>
<polyline fill="none" stroke="#000000" points="1759,-1174.5 2016,-1174.5 "/>
<text text-anchor="middle" x="1887.5" y="-1159.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_agent_name</text>
<polyline fill="none" stroke="#000000" points="1759,-1151.5 2016,-1151.5 "/>
<text text-anchor="middle" x="1887.5" y="-1136.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1759,-1128.5 2016,-1128.5 "/>
<text text-anchor="middle" x="1887.5" y="-1113.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1759,-1105.5 2016,-1105.5 "/>
<text text-anchor="middle" x="1887.5" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1759,-1082.5 2016,-1082.5 "/>
<text text-anchor="middle" x="1887.5" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1759,-1059.5 2016,-1059.5 "/>
<text text-anchor="middle" x="1887.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1759,-1036.5 2016,-1036.5 "/>
<text text-anchor="middle" x="1887.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1759,-1013.5 2016,-1013.5 "/>
<text text-anchor="middle" x="1887.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1759,-990.5 2016,-990.5 "/>
<text text-anchor="middle" x="1887.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1759,-967.5 2016,-967.5 "/>
<text text-anchor="middle" x="1887.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1759,-944.5 2016,-944.5 "/>
<text text-anchor="middle" x="1887.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_onset</text>
<polyline fill="none" stroke="#000000" points="1759,-921.5 2016,-921.5 "/>
<text text-anchor="middle" x="1887.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_resolution</text>
<polyline fill="none" stroke="#000000" points="1759,-898.5 2016,-898.5 "/>
<text text-anchor="middle" x="1887.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1759,-875.5 2016,-875.5 "/>
<text text-anchor="middle" x="1887.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1759,-852.5 2016,-852.5 "/>
<text text-anchor="middle" x="1887.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">existing_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1759,-829.5 2016,-829.5 "/>
<text text-anchor="middle" x="1887.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ongoing_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1759,-806.5 2016,-806.5 "/>
<text text-anchor="middle" x="1887.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">other_attribution_description</text>
<polyline fill="none" stroke="#000000" points="1759,-783.5 2016,-783.5 "/>
<text text-anchor="middle" x="1887.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2016,-760.5 2016,-1197.5 "/>
<text text-anchor="middle" x="2026.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge34" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1680.1572,-1249.439C1675.0718,-1238.9367 1672.2154,-1227.2055 1675.5,-1216 1676.3379,-1213.1416 1677.222,-1210.285 1678.1496,-1207.4317"/>
<polygon fill="#000000" stroke="#000000" points="1681.538,-1208.3401 1681.4677,-1197.7455 1674.9158,-1206.0716 1681.538,-1208.3401"/>
<text text-anchor="middle" x="1744.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- canine_individual -->
<g id="node13" class="node">
<title>canine_individual</title>
<path fill="none" stroke="#000000" d="M2321,-961C2321,-961 2644,-961 2644,-961 2650,-961 2656,-967 2656,-973 2656,-973 2656,-985 2656,-985 2656,-991 2650,-997 2644,-997 2644,-997 2321,-997 2321,-997 2315,-997 2309,-991 2309,-985 2309,-985 2309,-973 2309,-973 2309,-967 2315,-961 2321,-961"/>
<text text-anchor="middle" x="2380" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual</text>
<polyline fill="none" stroke="#000000" points="2451,-961 2451,-997 "/>
<text text-anchor="middle" x="2461.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2472,-961 2472,-997 "/>
<text text-anchor="middle" x="2553.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual_id</text>
<polyline fill="none" stroke="#000000" points="2635,-961 2635,-997 "/>
<text text-anchor="middle" x="2645.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;canine_individual -->
<g id="edge1" class="edge">
<title>case&#45;&gt;canine_individual</title>
<path fill="none" stroke="#000000" d="M1828.1523,-1278.3568C1988.723,-1270.0983 2255.8176,-1253.2523 2295.5,-1231 2388.1,-1179.0735 2448.0798,-1060.1804 2471.4445,-1006.3615"/>
<polygon fill="#000000" stroke="#000000" points="2474.6901,-1007.6727 2475.3807,-997.1004 2468.2479,-1004.9346 2474.6901,-1007.6727"/>
<text text-anchor="middle" x="2355.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">represents</text>
</g>
<!-- study -->
<g id="node20" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2876.5,-190.5C2876.5,-190.5 3156.5,-190.5 3156.5,-190.5 3162.5,-190.5 3168.5,-196.5 3168.5,-202.5 3168.5,-202.5 3168.5,-385.5 3168.5,-385.5 3168.5,-391.5 3162.5,-397.5 3156.5,-397.5 3156.5,-397.5 2876.5,-397.5 2876.5,-397.5 2870.5,-397.5 2864.5,-391.5 2864.5,-385.5 2864.5,-385.5 2864.5,-202.5 2864.5,-202.5 2864.5,-196.5 2870.5,-190.5 2876.5,-190.5"/>
<text text-anchor="middle" x="2892.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2920.5,-190.5 2920.5,-397.5 "/>
<text text-anchor="middle" x="2931" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2941.5,-190.5 2941.5,-397.5 "/>
<text text-anchor="middle" x="3044.5" y="-382.3" font-family="Times,serif" font-size="14.00" fill="#000000">accession_id</text>
<polyline fill="none" stroke="#000000" points="2941.5,-374.5 3147.5,-374.5 "/>
<text text-anchor="middle" x="3044.5" y="-359.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2941.5,-351.5 3147.5,-351.5 "/>
<text text-anchor="middle" x="3044.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2941.5,-328.5 3147.5,-328.5 "/>
<text text-anchor="middle" x="3044.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2941.5,-305.5 3147.5,-305.5 "/>
<text text-anchor="middle" x="3044.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2941.5,-282.5 3147.5,-282.5 "/>
<text text-anchor="middle" x="3044.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2941.5,-259.5 3147.5,-259.5 "/>
<text text-anchor="middle" x="3044.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2941.5,-236.5 3147.5,-236.5 "/>
<text text-anchor="middle" x="3044.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2941.5,-213.5 3147.5,-213.5 "/>
<text text-anchor="middle" x="3044.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_disposition</text>
<polyline fill="none" stroke="#000000" points="3147.5,-190.5 3147.5,-397.5 "/>
<text text-anchor="middle" x="3158" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge5" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1828.0882,-1272.7155C1980.2644,-1257.4092 2224.5884,-1228.4617 2253.5,-1198 2321.0507,-1126.8274 2281.5,-1077.1256 2281.5,-979 2281.5,-979 2281.5,-979 2281.5,-518.5 2281.5,-399.6381 2637.5293,-337.4818 2854.0065,-310.6746"/>
<polygon fill="#000000" stroke="#000000" points="2854.7074,-314.115 2864.2075,-309.4247 2853.8561,-307.167 2854.7074,-314.115"/>
<text text-anchor="middle" x="2322" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node22" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1710,-472.5C1710,-472.5 2079,-472.5 2079,-472.5 2085,-472.5 2091,-478.5 2091,-484.5 2091,-484.5 2091,-552.5 2091,-552.5 2091,-558.5 2085,-564.5 2079,-564.5 2079,-564.5 1710,-564.5 1710,-564.5 1704,-564.5 1698,-558.5 1698,-552.5 1698,-552.5 1698,-484.5 1698,-484.5 1698,-478.5 1704,-472.5 1710,-472.5"/>
<text text-anchor="middle" x="1744" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1790,-472.5 1790,-564.5 "/>
<text text-anchor="middle" x="1800.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1811,-472.5 1811,-564.5 "/>
<text text-anchor="middle" x="1940.5" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1811,-541.5 2070,-541.5 "/>
<text text-anchor="middle" x="1940.5" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="1811,-518.5 2070,-518.5 "/>
<text text-anchor="middle" x="1940.5" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_id</text>
<polyline fill="none" stroke="#000000" points="1811,-495.5 2070,-495.5 "/>
<text text-anchor="middle" x="1940.5" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2070,-472.5 2070,-564.5 "/>
<text text-anchor="middle" x="2080.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge29" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1584.8747,-1283.0252C1322.8975,-1279.6594 723.9102,-1264.6769 662.5,-1198 530.6212,-1054.811 538.7956,-910.3075 662.5,-760 789.9699,-605.1172 1371.0327,-548.1098 1687.5258,-528.3013"/>
<polygon fill="#000000" stroke="#000000" points="1687.9769,-531.7802 1697.7416,-527.6691 1687.5444,-524.7936 1687.9769,-531.7802"/>
<text text-anchor="middle" x="741" y="-730.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- off_study -->
<g id="node23" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M684,-875.5C684,-875.5 1099,-875.5 1099,-875.5 1105,-875.5 1111,-881.5 1111,-887.5 1111,-887.5 1111,-1070.5 1111,-1070.5 1111,-1076.5 1105,-1082.5 1099,-1082.5 1099,-1082.5 684,-1082.5 684,-1082.5 678,-1082.5 672,-1076.5 672,-1070.5 672,-1070.5 672,-887.5 672,-887.5 672,-881.5 678,-875.5 684,-875.5"/>
<text text-anchor="middle" x="713.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="755,-875.5 755,-1082.5 "/>
<text text-anchor="middle" x="765.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="776,-875.5 776,-1082.5 "/>
<text text-anchor="middle" x="933" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="776,-1059.5 1090,-1059.5 "/>
<text text-anchor="middle" x="933" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="776,-1036.5 1090,-1036.5 "/>
<text text-anchor="middle" x="933" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="776,-1013.5 1090,-1013.5 "/>
<text text-anchor="middle" x="933" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="776,-990.5 1090,-990.5 "/>
<text text-anchor="middle" x="933" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="776,-967.5 1090,-967.5 "/>
<text text-anchor="middle" x="933" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="776,-944.5 1090,-944.5 "/>
<text text-anchor="middle" x="933" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="776,-921.5 1090,-921.5 "/>
<text text-anchor="middle" x="933" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="776,-898.5 1090,-898.5 "/>
<text text-anchor="middle" x="933" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1090,-875.5 1090,-1082.5 "/>
<text text-anchor="middle" x="1100.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge16" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1584.9328,-1274.89C1437.8632,-1262.3675 1200.0723,-1236.8704 1120.5,-1198 1068.151,-1172.4279 1019.9224,-1130.5323 981.3645,-1090.1961"/>
<polygon fill="#000000" stroke="#000000" points="983.6874,-1087.5579 974.2787,-1082.6869 978.5962,-1092.3621 983.6874,-1087.5579"/>
<text text-anchor="middle" x="1281" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node27" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1141,-887C1141,-887 1588,-887 1588,-887 1594,-887 1600,-893 1600,-899 1600,-899 1600,-1059 1600,-1059 1600,-1065 1594,-1071 1588,-1071 1588,-1071 1141,-1071 1141,-1071 1135,-1071 1129,-1065 1129,-1059 1129,-1059 1129,-899 1129,-899 1129,-893 1135,-887 1141,-887"/>
<text text-anchor="middle" x="1186.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1244,-887 1244,-1071 "/>
<text text-anchor="middle" x="1254.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1265,-887 1265,-1071 "/>
<text text-anchor="middle" x="1422" y="-1055.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1265,-1048 1579,-1048 "/>
<text text-anchor="middle" x="1422" y="-1032.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1265,-1025 1579,-1025 "/>
<text text-anchor="middle" x="1422" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1265,-1002 1579,-1002 "/>
<text text-anchor="middle" x="1422" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1265,-979 1579,-979 "/>
<text text-anchor="middle" x="1422" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1265,-956 1579,-956 "/>
<text text-anchor="middle" x="1422" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1265,-933 1579,-933 "/>
<text text-anchor="middle" x="1422" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1265,-910 1579,-910 "/>
<text text-anchor="middle" x="1422" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1579,-887 1579,-1071 "/>
<text text-anchor="middle" x="1589.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge31" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1584.8965,-1260.7577C1564.5168,-1253.3947 1544.4986,-1243.716 1527.5,-1231 1475.7342,-1192.2759 1435.8582,-1131.8947 1408.5065,-1079.9449"/>
<polygon fill="#000000" stroke="#000000" points="1411.5913,-1078.2905 1403.8854,-1071.0193 1405.375,-1081.5089 1411.5913,-1078.2905"/>
<text text-anchor="middle" x="1598.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- diagnosis -->
<g id="node2" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2084,-2459.5C2084,-2459.5 2427,-2459.5 2427,-2459.5 2433,-2459.5 2439,-2465.5 2439,-2471.5 2439,-2471.5 2439,-2769.5 2439,-2769.5 2439,-2775.5 2433,-2781.5 2427,-2781.5 2427,-2781.5 2084,-2781.5 2084,-2781.5 2078,-2781.5 2072,-2775.5 2072,-2769.5 2072,-2769.5 2072,-2471.5 2072,-2471.5 2072,-2465.5 2078,-2459.5 2084,-2459.5"/>
<text text-anchor="middle" x="2114" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2156,-2459.5 2156,-2781.5 "/>
<text text-anchor="middle" x="2166.5" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2177,-2459.5 2177,-2781.5 "/>
<text text-anchor="middle" x="2297.5" y="-2766.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2177,-2758.5 2418,-2758.5 "/>
<text text-anchor="middle" x="2297.5" y="-2743.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2177,-2735.5 2418,-2735.5 "/>
<text text-anchor="middle" x="2297.5" y="-2720.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2177,-2712.5 2418,-2712.5 "/>
<text text-anchor="middle" x="2297.5" y="-2697.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2177,-2689.5 2418,-2689.5 "/>
<text text-anchor="middle" x="2297.5" y="-2674.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2177,-2666.5 2418,-2666.5 "/>
<text text-anchor="middle" x="2297.5" y="-2651.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis_id</text>
<polyline fill="none" stroke="#000000" points="2177,-2643.5 2418,-2643.5 "/>
<text text-anchor="middle" x="2297.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2177,-2620.5 2418,-2620.5 "/>
<text text-anchor="middle" x="2297.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2177,-2597.5 2418,-2597.5 "/>
<text text-anchor="middle" x="2297.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2177,-2574.5 2418,-2574.5 "/>
<text text-anchor="middle" x="2297.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2177,-2551.5 2418,-2551.5 "/>
<text text-anchor="middle" x="2297.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2177,-2528.5 2418,-2528.5 "/>
<text text-anchor="middle" x="2297.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2177,-2505.5 2418,-2505.5 "/>
<text text-anchor="middle" x="2297.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2177,-2482.5 2418,-2482.5 "/>
<text text-anchor="middle" x="2297.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2418,-2459.5 2418,-2781.5 "/>
<text text-anchor="middle" x="2428.5" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge41" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2121.0943,-2459.3134C2118.2947,-2453.2701 2115.7472,-2447.1592 2113.5,-2441 2065.9111,-2310.5684 2094.5,-1955.342 2094.5,-1816.5 2094.5,-1816.5 2094.5,-1816.5 2094.5,-1462.5 2094.5,-1420.5306 2104.7827,-1400.0658 2075.5,-1370 2042.51,-1336.1278 1930.2045,-1313.1778 1838.0695,-1299.5648"/>
<polygon fill="#000000" stroke="#000000" points="1838.4826,-1296.0882 1828.0833,-1298.1139 1837.4761,-1303.0154 1838.4826,-1296.0882"/>
<text text-anchor="middle" x="2121.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node3" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1313,-1934.5C1313,-1934.5 1608,-1934.5 1608,-1934.5 1614,-1934.5 1620,-1940.5 1620,-1946.5 1620,-1946.5 1620,-2336.5 1620,-2336.5 1620,-2342.5 1614,-2348.5 1608,-2348.5 1608,-2348.5 1313,-2348.5 1313,-2348.5 1307,-2348.5 1301,-2342.5 1301,-2336.5 1301,-2336.5 1301,-1946.5 1301,-1946.5 1301,-1940.5 1307,-1934.5 1313,-1934.5"/>
<text text-anchor="middle" x="1335" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1369,-1934.5 1369,-2348.5 "/>
<text text-anchor="middle" x="1379.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1390,-1934.5 1390,-2348.5 "/>
<text text-anchor="middle" x="1494.5" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1390,-2325.5 1599,-2325.5 "/>
<text text-anchor="middle" x="1494.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1390,-2302.5 1599,-2302.5 "/>
<text text-anchor="middle" x="1494.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1390,-2279.5 1599,-2279.5 "/>
<text text-anchor="middle" x="1494.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1390,-2256.5 1599,-2256.5 "/>
<text text-anchor="middle" x="1494.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">molecular_subtype</text>
<polyline fill="none" stroke="#000000" points="1390,-2233.5 1599,-2233.5 "/>
<text text-anchor="middle" x="1494.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1390,-2210.5 1599,-2210.5 "/>
<text text-anchor="middle" x="1494.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1390,-2187.5 1599,-2187.5 "/>
<text text-anchor="middle" x="1494.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_sample_type</text>
<polyline fill="none" stroke="#000000" points="1390,-2164.5 1599,-2164.5 "/>
<text text-anchor="middle" x="1494.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_chronology</text>
<polyline fill="none" stroke="#000000" points="1390,-2141.5 1599,-2141.5 "/>
<text text-anchor="middle" x="1494.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1390,-2118.5 1599,-2118.5 "/>
<text text-anchor="middle" x="1494.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="1390,-2095.5 1599,-2095.5 "/>
<text text-anchor="middle" x="1494.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1390,-2072.5 1599,-2072.5 "/>
<text text-anchor="middle" x="1494.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1390,-2049.5 1599,-2049.5 "/>
<text text-anchor="middle" x="1494.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="1390,-2026.5 1599,-2026.5 "/>
<text text-anchor="middle" x="1494.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="1390,-2003.5 1599,-2003.5 "/>
<text text-anchor="middle" x="1494.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="1390,-1980.5 1599,-1980.5 "/>
<text text-anchor="middle" x="1494.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">volume_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1390,-1957.5 1599,-1957.5 "/>
<text text-anchor="middle" x="1494.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1599,-1934.5 1599,-2348.5 "/>
<text text-anchor="middle" x="1609.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge42" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1561.615,-1934.2662C1610.3109,-1824.2874 1664.1685,-1685.2708 1692.5,-1555 1709.4888,-1476.884 1710.1069,-1383.2587 1708.5924,-1329.0056"/>
<polygon fill="#000000" stroke="#000000" points="1712.0808,-1328.5801 1708.2653,-1318.6962 1705.0843,-1328.8022 1712.0808,-1328.5801"/>
<text text-anchor="middle" x="1714.5" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge20" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1620.2452,-2185.6053C1631.2813,-2175.5025 1638,-2160.8008 1638,-2141.5 1638,-2126.5721 1633.9808,-2114.3953 1627.0535,-2104.9696"/>
<polygon fill="#000000" stroke="#000000" points="1629.5331,-2102.4925 1620.2452,-2097.3947 1624.3269,-2107.1718 1629.5331,-2102.4925"/>
<text text-anchor="middle" x="1654" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit -->
<g id="node28" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1143,-1664C1143,-1664 1318,-1664 1318,-1664 1324,-1664 1330,-1670 1330,-1676 1330,-1676 1330,-1721 1330,-1721 1330,-1727 1324,-1733 1318,-1733 1318,-1733 1143,-1733 1143,-1733 1137,-1733 1131,-1727 1131,-1721 1131,-1721 1131,-1676 1131,-1676 1131,-1670 1137,-1664 1143,-1664"/>
<text text-anchor="middle" x="1154.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1178,-1664 1178,-1733 "/>
<text text-anchor="middle" x="1188.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1199,-1664 1199,-1733 "/>
<text text-anchor="middle" x="1254" y="-1717.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1199,-1710 1309,-1710 "/>
<text text-anchor="middle" x="1254" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_id</text>
<polyline fill="none" stroke="#000000" points="1199,-1687 1309,-1687 "/>
<text text-anchor="middle" x="1254" y="-1671.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1309,-1664 1309,-1733 "/>
<text text-anchor="middle" x="1319.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge13" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1352.9075,-1934.2676C1315.3907,-1862.0069 1276.8182,-1787.7128 1253.2501,-1742.3187"/>
<polygon fill="#000000" stroke="#000000" points="1256.3121,-1740.6206 1248.5979,-1733.3582 1250.0996,-1743.8461 1256.3121,-1740.6206"/>
<text text-anchor="middle" x="1319.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node4" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2862.5,-.5C2862.5,-.5 3170.5,-.5 3170.5,-.5 3176.5,-.5 3182.5,-6.5 3182.5,-12.5 3182.5,-12.5 3182.5,-126.5 3182.5,-126.5 3182.5,-132.5 3176.5,-138.5 3170.5,-138.5 3170.5,-138.5 2862.5,-138.5 2862.5,-138.5 2856.5,-138.5 2850.5,-132.5 2850.5,-126.5 2850.5,-126.5 2850.5,-12.5 2850.5,-12.5 2850.5,-6.5 2856.5,-.5 2862.5,-.5"/>
<text text-anchor="middle" x="2889.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2928.5,-.5 2928.5,-138.5 "/>
<text text-anchor="middle" x="2939" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2949.5,-.5 2949.5,-138.5 "/>
<text text-anchor="middle" x="3055.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2949.5,-115.5 3161.5,-115.5 "/>
<text text-anchor="middle" x="3055.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2949.5,-92.5 3161.5,-92.5 "/>
<text text-anchor="middle" x="3055.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2949.5,-69.5 3161.5,-69.5 "/>
<text text-anchor="middle" x="3055.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2949.5,-46.5 3161.5,-46.5 "/>
<text text-anchor="middle" x="3055.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2949.5,-23.5 3161.5,-23.5 "/>
<text text-anchor="middle" x="3055.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3161.5,-.5 3161.5,-138.5 "/>
<text text-anchor="middle" x="3172" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle -->
<g id="node5" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1348.5,-1428C1348.5,-1428 1576.5,-1428 1576.5,-1428 1582.5,-1428 1588.5,-1434 1588.5,-1440 1588.5,-1440 1588.5,-1485 1588.5,-1485 1588.5,-1491 1582.5,-1497 1576.5,-1497 1576.5,-1497 1348.5,-1497 1348.5,-1497 1342.5,-1497 1336.5,-1491 1336.5,-1485 1336.5,-1485 1336.5,-1440 1336.5,-1440 1336.5,-1434 1342.5,-1428 1348.5,-1428"/>
<text text-anchor="middle" x="1363.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1390.5,-1428 1390.5,-1497 "/>
<text text-anchor="middle" x="1401" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1411.5,-1428 1411.5,-1497 "/>
<text text-anchor="middle" x="1489.5" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1411.5,-1474 1567.5,-1474 "/>
<text text-anchor="middle" x="1489.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1411.5,-1451 1567.5,-1451 "/>
<text text-anchor="middle" x="1489.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1567.5,-1428 1567.5,-1497 "/>
<text text-anchor="middle" x="1578" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge44" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1480.743,-1427.9247C1497.1573,-1399.853 1523.7066,-1361.1009 1556.5,-1337 1563.2984,-1332.0037 1570.61,-1327.4451 1578.2157,-1323.2909"/>
<polygon fill="#000000" stroke="#000000" points="1579.9997,-1326.3085 1587.266,-1318.598 1576.7774,-1320.0942 1579.9997,-1326.3085"/>
<text text-anchor="middle" x="1583.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_surgery -->
<g id="node6" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2134.5,-2072.5C2134.5,-2072.5 2480.5,-2072.5 2480.5,-2072.5 2486.5,-2072.5 2492.5,-2078.5 2492.5,-2084.5 2492.5,-2084.5 2492.5,-2198.5 2492.5,-2198.5 2492.5,-2204.5 2486.5,-2210.5 2480.5,-2210.5 2480.5,-2210.5 2134.5,-2210.5 2134.5,-2210.5 2128.5,-2210.5 2122.5,-2204.5 2122.5,-2198.5 2122.5,-2198.5 2122.5,-2084.5 2122.5,-2084.5 2122.5,-2078.5 2128.5,-2072.5 2134.5,-2072.5"/>
<text text-anchor="middle" x="2180" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2237.5,-2072.5 2237.5,-2210.5 "/>
<text text-anchor="middle" x="2248" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2258.5,-2072.5 2258.5,-2210.5 "/>
<text text-anchor="middle" x="2365" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2258.5,-2187.5 2471.5,-2187.5 "/>
<text text-anchor="middle" x="2365" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2258.5,-2164.5 2471.5,-2164.5 "/>
<text text-anchor="middle" x="2365" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2258.5,-2141.5 2471.5,-2141.5 "/>
<text text-anchor="middle" x="2365" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2258.5,-2118.5 2471.5,-2118.5 "/>
<text text-anchor="middle" x="2365" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2258.5,-2095.5 2471.5,-2095.5 "/>
<text text-anchor="middle" x="2365" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2471.5,-2072.5 2471.5,-2210.5 "/>
<text text-anchor="middle" x="2482" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge21" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2492.613,-2183.5585C2503.7907,-2173.5547 2510.5,-2159.5352 2510.5,-2141.5 2510.5,-2127.5509 2506.4865,-2116.004 2499.4962,-2106.8593"/>
<polygon fill="#000000" stroke="#000000" points="2501.9806,-2104.3911 2492.613,-2099.4415 2496.8494,-2109.1525 2501.9806,-2104.3911"/>
<text text-anchor="middle" x="2526.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node19" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2178.5,-1606.5C2178.5,-1606.5 2500.5,-1606.5 2500.5,-1606.5 2506.5,-1606.5 2512.5,-1612.5 2512.5,-1618.5 2512.5,-1618.5 2512.5,-1778.5 2512.5,-1778.5 2512.5,-1784.5 2506.5,-1790.5 2500.5,-1790.5 2500.5,-1790.5 2178.5,-1790.5 2178.5,-1790.5 2172.5,-1790.5 2166.5,-1784.5 2166.5,-1778.5 2166.5,-1778.5 2166.5,-1618.5 2166.5,-1618.5 2166.5,-1612.5 2172.5,-1606.5 2178.5,-1606.5"/>
<text text-anchor="middle" x="2214" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2261.5,-1606.5 2261.5,-1790.5 "/>
<text text-anchor="middle" x="2272" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2282.5,-1606.5 2282.5,-1790.5 "/>
<text text-anchor="middle" x="2387" y="-1775.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1767.5 2491.5,-1767.5 "/>
<text text-anchor="middle" x="2387" y="-1752.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1744.5 2491.5,-1744.5 "/>
<text text-anchor="middle" x="2387" y="-1729.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_id</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1721.5 2491.5,-1721.5 "/>
<text text-anchor="middle" x="2387" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1698.5 2491.5,-1698.5 "/>
<text text-anchor="middle" x="2387" y="-1683.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1675.5 2491.5,-1675.5 "/>
<text text-anchor="middle" x="2387" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1652.5 2491.5,-1652.5 "/>
<text text-anchor="middle" x="2387" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1629.5 2491.5,-1629.5 "/>
<text text-anchor="middle" x="2387" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2491.5,-1606.5 2491.5,-1790.5 "/>
<text text-anchor="middle" x="2502" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge37" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2312.5,-2072.2813C2317.7617,-1999.4396 2326.0996,-1884.0125 2332.1183,-1800.6905"/>
<polygon fill="#000000" stroke="#000000" points="2335.6108,-1800.9196 2332.8404,-1790.6934 2328.629,-1800.4152 2335.6108,-1800.9196"/>
<text text-anchor="middle" x="2380.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- assay -->
<g id="node7" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1935.5,-2800.5C1935.5,-2800.5 1967.5,-2800.5 1967.5,-2800.5 1973.5,-2800.5 1979.5,-2806.5 1979.5,-2812.5 1979.5,-2812.5 1979.5,-2824.5 1979.5,-2824.5 1979.5,-2830.5 1973.5,-2836.5 1967.5,-2836.5 1967.5,-2836.5 1935.5,-2836.5 1935.5,-2836.5 1929.5,-2836.5 1923.5,-2830.5 1923.5,-2824.5 1923.5,-2824.5 1923.5,-2812.5 1923.5,-2812.5 1923.5,-2806.5 1929.5,-2800.5 1935.5,-2800.5"/>
<text text-anchor="middle" x="1951.5" y="-2814.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge15" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1952.5477,-2800.2789C1954.8888,-2740.4176 1953.4414,-2548.5283 1846.5,-2459 1789.2589,-2411.0793 1744.1582,-2478.313 1679.5,-2441 1642.8283,-2419.8374 1610.5505,-2389.7976 1582.8279,-2356.8342"/>
<polygon fill="#000000" stroke="#000000" points="1585.31,-2354.3428 1576.2484,-2348.853 1579.9087,-2358.7955 1585.31,-2354.3428"/>
<text text-anchor="middle" x="1989" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- physical_exam -->
<g id="node8" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1700.5,-2061C1700.5,-2061 2016.5,-2061 2016.5,-2061 2022.5,-2061 2028.5,-2067 2028.5,-2073 2028.5,-2073 2028.5,-2210 2028.5,-2210 2028.5,-2216 2022.5,-2222 2016.5,-2222 2016.5,-2222 1700.5,-2222 1700.5,-2222 1694.5,-2222 1688.5,-2216 1688.5,-2210 1688.5,-2210 1688.5,-2073 1688.5,-2073 1688.5,-2067 1694.5,-2061 1700.5,-2061"/>
<text text-anchor="middle" x="1749.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1810.5,-2061 1810.5,-2222 "/>
<text text-anchor="middle" x="1821" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1831.5,-2061 1831.5,-2222 "/>
<text text-anchor="middle" x="1919.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1831.5,-2199 2007.5,-2199 "/>
<text text-anchor="middle" x="1919.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1831.5,-2176 2007.5,-2176 "/>
<text text-anchor="middle" x="1919.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1831.5,-2153 2007.5,-2153 "/>
<text text-anchor="middle" x="1919.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1831.5,-2130 2007.5,-2130 "/>
<text text-anchor="middle" x="1919.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1831.5,-2107 2007.5,-2107 "/>
<text text-anchor="middle" x="1919.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1831.5,-2084 2007.5,-2084 "/>
<text text-anchor="middle" x="1919.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="2007.5,-2061 2007.5,-2222 "/>
<text text-anchor="middle" x="2018" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge35" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1916.3693,-2060.993C1964.6562,-1997.1406 2037.6096,-1907.9728 2113.5,-1842 2131.689,-1826.188 2151.7822,-1810.8938 2172.2618,-1796.5565"/>
<polygon fill="#000000" stroke="#000000" points="2174.5135,-1799.2547 2180.7448,-1790.6861 2170.5301,-1793.4986 2174.5135,-1799.2547"/>
<text text-anchor="middle" x="2202.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1829.1676,-2060.7056C1800.7195,-1993.1488 1751.2731,-1898.9465 1679.5,-1842 1580.6427,-1763.5642 1437.9668,-1727.5544 1340.1305,-1711.3186"/>
<polygon fill="#000000" stroke="#000000" points="1340.6431,-1707.8561 1330.2126,-1709.7149 1339.5257,-1714.7664 1340.6431,-1707.8561"/>
<text text-anchor="middle" x="1676.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- disease_extent -->
<g id="node9" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M625.5,-2003.5C625.5,-2003.5 941.5,-2003.5 941.5,-2003.5 947.5,-2003.5 953.5,-2009.5 953.5,-2015.5 953.5,-2015.5 953.5,-2267.5 953.5,-2267.5 953.5,-2273.5 947.5,-2279.5 941.5,-2279.5 941.5,-2279.5 625.5,-2279.5 625.5,-2279.5 619.5,-2279.5 613.5,-2273.5 613.5,-2267.5 613.5,-2267.5 613.5,-2015.5 613.5,-2015.5 613.5,-2009.5 619.5,-2003.5 625.5,-2003.5"/>
<text text-anchor="middle" x="675" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="736.5,-2003.5 736.5,-2279.5 "/>
<text text-anchor="middle" x="747" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="757.5,-2003.5 757.5,-2279.5 "/>
<text text-anchor="middle" x="845" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="757.5,-2256.5 932.5,-2256.5 "/>
<text text-anchor="middle" x="845" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="757.5,-2233.5 932.5,-2233.5 "/>
<text text-anchor="middle" x="845" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="757.5,-2210.5 932.5,-2210.5 "/>
<text text-anchor="middle" x="845" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="757.5,-2187.5 932.5,-2187.5 "/>
<text text-anchor="middle" x="845" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="757.5,-2164.5 932.5,-2164.5 "/>
<text text-anchor="middle" x="845" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="757.5,-2141.5 932.5,-2141.5 "/>
<text text-anchor="middle" x="845" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="757.5,-2118.5 932.5,-2118.5 "/>
<text text-anchor="middle" x="845" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="757.5,-2095.5 932.5,-2095.5 "/>
<text text-anchor="middle" x="845" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="757.5,-2072.5 932.5,-2072.5 "/>
<text text-anchor="middle" x="845" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="757.5,-2049.5 932.5,-2049.5 "/>
<text text-anchor="middle" x="845" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="757.5,-2026.5 932.5,-2026.5 "/>
<text text-anchor="middle" x="845" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="932.5,-2003.5 932.5,-2279.5 "/>
<text text-anchor="middle" x="943" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M845.7278,-2003.3558C875.3643,-1948.3574 914.8349,-1887.4715 962.5,-1842 1010.1514,-1796.5416 1075.0224,-1761.305 1129.0052,-1737.1258"/>
<polygon fill="#000000" stroke="#000000" points="1130.5246,-1740.281 1138.2593,-1733.0405 1127.6976,-1733.8772 1130.5246,-1740.281"/>
<text text-anchor="middle" x="1028.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge2" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2123.4717,-639.4674C2135.3396,-583.6726 2160.6994,-477.0997 2186.5,-449 2274.3338,-353.3394 2638.1977,-315.8459 2853.9122,-301.8269"/>
<polygon fill="#000000" stroke="#000000" points="2854.3145,-305.3084 2864.0706,-301.177 2853.8675,-298.3227 2854.3145,-305.3084"/>
<text text-anchor="middle" x="2227" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge3" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2067.231,-639.4895C2038.3847,-619.2841 2001.3827,-593.366 1969.0307,-570.705"/>
<polygon fill="#000000" stroke="#000000" points="1970.6767,-567.5848 1960.4781,-564.7144 1966.6607,-573.3183 1970.6767,-567.5848"/>
<text text-anchor="middle" x="2078" y="-609.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- registration -->
<g id="node11" class="node">
<title>registration</title>
<path fill="none" stroke="#000000" d="M1784.5,-1439.5C1784.5,-1439.5 2054.5,-1439.5 2054.5,-1439.5 2060.5,-1439.5 2066.5,-1445.5 2066.5,-1451.5 2066.5,-1451.5 2066.5,-1473.5 2066.5,-1473.5 2066.5,-1479.5 2060.5,-1485.5 2054.5,-1485.5 2054.5,-1485.5 1784.5,-1485.5 1784.5,-1485.5 1778.5,-1485.5 1772.5,-1479.5 1772.5,-1473.5 1772.5,-1473.5 1772.5,-1451.5 1772.5,-1451.5 1772.5,-1445.5 1778.5,-1439.5 1784.5,-1439.5"/>
<text text-anchor="middle" x="1823" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration</text>
<polyline fill="none" stroke="#000000" points="1873.5,-1439.5 1873.5,-1485.5 "/>
<text text-anchor="middle" x="1884" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1894.5,-1439.5 1894.5,-1485.5 "/>
<text text-anchor="middle" x="1970" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration_id</text>
<polyline fill="none" stroke="#000000" points="1894.5,-1462.5 2045.5,-1462.5 "/>
<text text-anchor="middle" x="1970" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration_origin</text>
<polyline fill="none" stroke="#000000" points="2045.5,-1439.5 2045.5,-1485.5 "/>
<text text-anchor="middle" x="2056" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge45" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1891.654,-1439.1642C1857.1524,-1410.251 1797.7681,-1360.4852 1755.5597,-1325.1134"/>
<polygon fill="#000000" stroke="#000000" points="1757.8009,-1322.4251 1747.8883,-1318.6845 1753.3047,-1327.7902 1757.8009,-1322.4251"/>
<text text-anchor="middle" x="1807.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge46" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1830.2751,-1197.6294C1825.8964,-1209.3501 1820.3771,-1220.5762 1813.5,-1231 1810.7887,-1235.1096 1807.6595,-1238.9129 1804.2133,-1242.4313"/>
<polygon fill="#000000" stroke="#000000" points="1801.7563,-1239.9351 1796.7267,-1249.26 1806.4736,-1245.1069 1801.7563,-1239.9351"/>
<text text-anchor="middle" x="1846.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge17" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2037.2046,-1009.2517C2048.376,-1001.832 2055,-991.748 2055,-979 2055,-969.6382 2051.4277,-961.7131 2045.1053,-955.2248"/>
<polygon fill="#000000" stroke="#000000" points="2047.1571,-952.3811 2037.2046,-948.7483 2042.7194,-957.7947 2047.1571,-952.3811"/>
<text text-anchor="middle" x="2071" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node31" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1714.5,-651C1714.5,-651 1940.5,-651 1940.5,-651 1946.5,-651 1952.5,-657 1952.5,-663 1952.5,-663 1952.5,-685 1952.5,-685 1952.5,-691 1946.5,-697 1940.5,-697 1940.5,-697 1714.5,-697 1714.5,-697 1708.5,-697 1702.5,-691 1702.5,-685 1702.5,-685 1702.5,-663 1702.5,-663 1702.5,-657 1708.5,-651 1714.5,-651"/>
<text text-anchor="middle" x="1731" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1759.5,-651 1759.5,-697 "/>
<text text-anchor="middle" x="1770" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1780.5,-651 1780.5,-697 "/>
<text text-anchor="middle" x="1856" y="-681.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1780.5,-674 1931.5,-674 "/>
<text text-anchor="middle" x="1856" y="-658.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1931.5,-651 1931.5,-697 "/>
<text text-anchor="middle" x="1942" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge39" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1827.5,-760.1778C1827.5,-740.02 1827.5,-721.7823 1827.5,-707.3298"/>
<polygon fill="#000000" stroke="#000000" points="1831.0001,-707.0466 1827.5,-697.0467 1824.0001,-707.0467 1831.0001,-707.0466"/>
<text text-anchor="middle" x="1858.5" y="-730.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- file -->
<g id="node14" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1964,-2888.5C1964,-2888.5 2149,-2888.5 2149,-2888.5 2155,-2888.5 2161,-2894.5 2161,-2900.5 2161,-2900.5 2161,-3083.5 2161,-3083.5 2161,-3089.5 2155,-3095.5 2149,-3095.5 2149,-3095.5 1964,-3095.5 1964,-3095.5 1958,-3095.5 1952,-3089.5 1952,-3083.5 1952,-3083.5 1952,-2900.5 1952,-2900.5 1952,-2894.5 1958,-2888.5 1964,-2888.5"/>
<text text-anchor="middle" x="1971.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1991,-2888.5 1991,-3095.5 "/>
<text text-anchor="middle" x="2001.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2012,-2888.5 2012,-3095.5 "/>
<text text-anchor="middle" x="2076" y="-3080.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2012,-3072.5 2140,-3072.5 "/>
<text text-anchor="middle" x="2076" y="-3057.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2012,-3049.5 2140,-3049.5 "/>
<text text-anchor="middle" x="2076" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2012,-3026.5 2140,-3026.5 "/>
<text text-anchor="middle" x="2076" y="-3011.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2012,-3003.5 2140,-3003.5 "/>
<text text-anchor="middle" x="2076" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2012,-2980.5 2140,-2980.5 "/>
<text text-anchor="middle" x="2076" y="-2965.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2012,-2957.5 2140,-2957.5 "/>
<text text-anchor="middle" x="2076" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2012,-2934.5 2140,-2934.5 "/>
<text text-anchor="middle" x="2076" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2012,-2911.5 2140,-2911.5 "/>
<text text-anchor="middle" x="2076" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2140,-2888.5 2140,-3095.5 "/>
<text text-anchor="middle" x="2150.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;case -->
<g id="edge47" class="edge">
<title>file&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2059.0762,-2888.4169C2065.0519,-2623.8134 2076.5373,-1937.1376 2037.5,-1842 1970.5548,-1678.848 1844.0063,-1711.9044 1763.5,-1555 1718.4941,-1467.2847 1745.8909,-1432.7725 1722.5,-1337 1721.8159,-1334.1989 1721.0724,-1331.3264 1720.2928,-1328.4378"/>
<polygon fill="#000000" stroke="#000000" points="1723.6127,-1327.3144 1717.5371,-1318.6347 1716.8739,-1329.2087 1723.6127,-1327.3144"/>
<text text-anchor="middle" x="2055.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge27" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2112.1972,-2888.0225C2128.3992,-2857.776 2146.5372,-2823.9154 2164.3184,-2790.7208"/>
<polygon fill="#000000" stroke="#000000" points="2167.4385,-2792.3085 2169.0751,-2781.8409 2161.268,-2789.0032 2167.4385,-2792.3085"/>
<text text-anchor="middle" x="2181" y="-2858.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge14" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1951.8093,-2930.3299C1914.0145,-2904.7016 1872.9583,-2872.6039 1841.5,-2837 1715.8369,-2694.7769 1615.0344,-2504.0593 1548.7552,-2358.3104"/>
<polygon fill="#000000" stroke="#000000" points="1551.7519,-2356.4431 1544.4396,-2348.7762 1545.3748,-2359.3297 1551.7519,-2356.4431"/>
<text text-anchor="middle" x="1878" y="-2814.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge33" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1992.5031,-2888.2737C1988.7656,-2882.0996 1985.0752,-2875.9734 1981.5,-2870 1976.7639,-2862.087 1971.6893,-2853.4417 1967.086,-2845.5331"/>
<polygon fill="#000000" stroke="#000000" points="1969.9928,-2843.5688 1961.9471,-2836.6755 1963.938,-2847.0816 1969.9928,-2843.5688"/>
<text text-anchor="middle" x="2012" y="-2858.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge23" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2161.0006,-2892.4985C2164.1327,-2890.8817 2167.3009,-2889.3766 2170.5,-2888 2267.5148,-2846.2524 3118.5,-2924.116 3118.5,-2818.5 3118.5,-2818.5 3118.5,-2818.5 3118.5,-518.5 3118.5,-480.1843 3106.0323,-441.2191 3089.8148,-406.742"/>
<polygon fill="#000000" stroke="#000000" points="3092.8982,-405.079 3085.3835,-397.6104 3086.6005,-408.1351 3092.8982,-405.079"/>
<text text-anchor="middle" x="3149" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- follow_up -->
<g id="node15" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M596.5,-1370.5C596.5,-1370.5 928.5,-1370.5 928.5,-1370.5 934.5,-1370.5 940.5,-1376.5 940.5,-1382.5 940.5,-1382.5 940.5,-1542.5 940.5,-1542.5 940.5,-1548.5 934.5,-1554.5 928.5,-1554.5 928.5,-1554.5 596.5,-1554.5 596.5,-1554.5 590.5,-1554.5 584.5,-1548.5 584.5,-1542.5 584.5,-1542.5 584.5,-1382.5 584.5,-1382.5 584.5,-1376.5 590.5,-1370.5 596.5,-1370.5"/>
<text text-anchor="middle" x="627" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="669.5,-1370.5 669.5,-1554.5 "/>
<text text-anchor="middle" x="680" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="690.5,-1370.5 690.5,-1554.5 "/>
<text text-anchor="middle" x="805" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="690.5,-1531.5 919.5,-1531.5 "/>
<text text-anchor="middle" x="805" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="690.5,-1508.5 919.5,-1508.5 "/>
<text text-anchor="middle" x="805" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="690.5,-1485.5 919.5,-1485.5 "/>
<text text-anchor="middle" x="805" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="690.5,-1462.5 919.5,-1462.5 "/>
<text text-anchor="middle" x="805" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="690.5,-1439.5 919.5,-1439.5 "/>
<text text-anchor="middle" x="805" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="690.5,-1416.5 919.5,-1416.5 "/>
<text text-anchor="middle" x="805" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="690.5,-1393.5 919.5,-1393.5 "/>
<text text-anchor="middle" x="805" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="919.5,-1370.5 919.5,-1554.5 "/>
<text text-anchor="middle" x="930" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge48" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M940.6135,-1372.7367C943.5831,-1371.7828 946.5466,-1370.8693 949.5,-1370 1063.4264,-1336.4688 1389.9935,-1307.6638 1574.8324,-1293.453"/>
<polygon fill="#000000" stroke="#000000" points="1575.1849,-1296.9363 1584.8887,-1292.6835 1574.6507,-1289.9567 1575.1849,-1296.9363"/>
<text text-anchor="middle" x="1153.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node16" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2572.5,-1842.5C2572.5,-1842.5 3028.5,-1842.5 3028.5,-1842.5 3034.5,-1842.5 3040.5,-1848.5 3040.5,-1854.5 3040.5,-1854.5 3040.5,-2428.5 3040.5,-2428.5 3040.5,-2434.5 3034.5,-2440.5 3028.5,-2440.5 3028.5,-2440.5 2572.5,-2440.5 2572.5,-2440.5 2566.5,-2440.5 2560.5,-2434.5 2560.5,-2428.5 2560.5,-2428.5 2560.5,-1854.5 2560.5,-1854.5 2560.5,-1848.5 2566.5,-1842.5 2572.5,-1842.5"/>
<text text-anchor="middle" x="2618" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2675.5,-1842.5 2675.5,-2440.5 "/>
<text text-anchor="middle" x="2686" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2696.5,-1842.5 2696.5,-2440.5 "/>
<text text-anchor="middle" x="2858" y="-2425.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2417.5 3019.5,-2417.5 "/>
<text text-anchor="middle" x="2858" y="-2402.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2394.5 3019.5,-2394.5 "/>
<text text-anchor="middle" x="2858" y="-2379.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2371.5 3019.5,-2371.5 "/>
<text text-anchor="middle" x="2858" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response_to_prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2348.5 3019.5,-2348.5 "/>
<text text-anchor="middle" x="2858" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2325.5 3019.5,-2325.5 "/>
<text text-anchor="middle" x="2858" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2302.5 3019.5,-2302.5 "/>
<text text-anchor="middle" x="2858" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2279.5 3019.5,-2279.5 "/>
<text text-anchor="middle" x="2858" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2256.5 3019.5,-2256.5 "/>
<text text-anchor="middle" x="2858" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2233.5 3019.5,-2233.5 "/>
<text text-anchor="middle" x="2858" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2210.5 3019.5,-2210.5 "/>
<text text-anchor="middle" x="2858" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2187.5 3019.5,-2187.5 "/>
<text text-anchor="middle" x="2858" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2164.5 3019.5,-2164.5 "/>
<text text-anchor="middle" x="2858" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2141.5 3019.5,-2141.5 "/>
<text text-anchor="middle" x="2858" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2118.5 3019.5,-2118.5 "/>
<text text-anchor="middle" x="2858" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2095.5 3019.5,-2095.5 "/>
<text text-anchor="middle" x="2858" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2072.5 3019.5,-2072.5 "/>
<text text-anchor="middle" x="2858" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2049.5 3019.5,-2049.5 "/>
<text text-anchor="middle" x="2858" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2026.5 3019.5,-2026.5 "/>
<text text-anchor="middle" x="2858" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2696.5,-2003.5 3019.5,-2003.5 "/>
<text text-anchor="middle" x="2858" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2696.5,-1980.5 3019.5,-1980.5 "/>
<text text-anchor="middle" x="2858" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2696.5,-1957.5 3019.5,-1957.5 "/>
<text text-anchor="middle" x="2858" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2696.5,-1934.5 3019.5,-1934.5 "/>
<text text-anchor="middle" x="2858" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2696.5,-1911.5 3019.5,-1911.5 "/>
<text text-anchor="middle" x="2858" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2696.5,-1888.5 3019.5,-1888.5 "/>
<text text-anchor="middle" x="2858" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2696.5,-1865.5 3019.5,-1865.5 "/>
<text text-anchor="middle" x="2858" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="3019.5,-1842.5 3019.5,-2440.5 "/>
<text text-anchor="middle" x="3030" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge18" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3040.7384,-2179.6912C3051.9387,-2170.0507 3058.5,-2157.3203 3058.5,-2141.5 3058.5,-2129.3876 3054.6539,-2119.0864 3047.8244,-2110.5965"/>
<polygon fill="#000000" stroke="#000000" points="3050.219,-2108.0385 3040.7384,-2103.3088 3045.2002,-2112.9183 3050.219,-2108.0385"/>
<text text-anchor="middle" x="3074.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge36" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2560.1314,-1849.9304C2557.259,-1847.255 2554.3814,-1844.6106 2551.5,-1842 2534.131,-1826.2635 2514.922,-1810.9211 2495.368,-1796.4781"/>
<polygon fill="#000000" stroke="#000000" points="2497.409,-1793.6347 2487.2699,-1790.5608 2493.2792,-1799.2866 2497.409,-1793.6347"/>
<text text-anchor="middle" x="2580.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- biospecimen_source -->
<g id="node17" class="node">
<title>biospecimen_source</title>
<path fill="none" stroke="#000000" d="M2191,-2969C2191,-2969 2636,-2969 2636,-2969 2642,-2969 2648,-2975 2648,-2981 2648,-2981 2648,-3003 2648,-3003 2648,-3009 2642,-3015 2636,-3015 2636,-3015 2191,-3015 2191,-3015 2185,-3015 2179,-3009 2179,-3003 2179,-3003 2179,-2981 2179,-2981 2179,-2975 2185,-2969 2191,-2969"/>
<text text-anchor="middle" x="2260" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_source</text>
<polyline fill="none" stroke="#000000" points="2341,-2969 2341,-3015 "/>
<text text-anchor="middle" x="2351.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2362,-2969 2362,-3015 "/>
<text text-anchor="middle" x="2494.5" y="-2999.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_repository_acronym</text>
<polyline fill="none" stroke="#000000" points="2362,-2992 2627,-2992 "/>
<text text-anchor="middle" x="2494.5" y="-2976.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_repository_full_name</text>
<polyline fill="none" stroke="#000000" points="2627,-2969 2627,-3015 "/>
<text text-anchor="middle" x="2637.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator -->
<g id="node18" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M2751,-484C2751,-484 3078,-484 3078,-484 3084,-484 3090,-490 3090,-496 3090,-496 3090,-541 3090,-541 3090,-547 3084,-553 3078,-553 3078,-553 2751,-553 2751,-553 2745,-553 2739,-547 2739,-541 2739,-541 2739,-496 2739,-496 2739,-490 2745,-484 2751,-484"/>
<text text-anchor="middle" x="2826" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="2913,-484 2913,-553 "/>
<text text-anchor="middle" x="2923.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2934,-484 2934,-553 "/>
<text text-anchor="middle" x="3001.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="2934,-530 3069,-530 "/>
<text text-anchor="middle" x="3001.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="2934,-507 3069,-507 "/>
<text text-anchor="middle" x="3001.5" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3069,-484 3069,-553 "/>
<text text-anchor="middle" x="3079.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge22" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2930.214,-483.9139C2939.7443,-462.9377 2952.4992,-434.8646 2965.273,-406.7497"/>
<polygon fill="#000000" stroke="#000000" points="2968.4669,-408.1811 2969.4169,-397.6289 2962.0938,-405.2855 2968.4669,-408.1811"/>
<text text-anchor="middle" x="2989" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge40" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2306.8435,-1606.2875C2271.6878,-1521.5134 2207.1576,-1399.7694 2108.5,-1337 2064.7161,-1309.1432 1938.0259,-1295.7937 1838.4474,-1289.4811"/>
<polygon fill="#000000" stroke="#000000" points="1838.4845,-1285.9768 1828.2882,-1288.8553 1838.0541,-1292.9636 1838.4845,-1285.9768"/>
<text text-anchor="middle" x="2308.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge7" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3016.5,-190.2929C3016.5,-176.377 3016.5,-162.285 3016.5,-148.8791"/>
<polygon fill="#000000" stroke="#000000" points="3020.0001,-148.7754 3016.5,-138.7754 3013.0001,-148.7755 3020.0001,-148.7754"/>
<text text-anchor="middle" x="3057" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- demographic -->
<g id="node21" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M970.5,-1370.5C970.5,-1370.5 1306.5,-1370.5 1306.5,-1370.5 1312.5,-1370.5 1318.5,-1376.5 1318.5,-1382.5 1318.5,-1382.5 1318.5,-1542.5 1318.5,-1542.5 1318.5,-1548.5 1312.5,-1554.5 1306.5,-1554.5 1306.5,-1554.5 970.5,-1554.5 970.5,-1554.5 964.5,-1554.5 958.5,-1548.5 958.5,-1542.5 958.5,-1542.5 958.5,-1382.5 958.5,-1382.5 958.5,-1376.5 964.5,-1370.5 970.5,-1370.5"/>
<text text-anchor="middle" x="1013.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1068.5,-1370.5 1068.5,-1554.5 "/>
<text text-anchor="middle" x="1079" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1089.5,-1370.5 1089.5,-1554.5 "/>
<text text-anchor="middle" x="1193.5" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">additional_breed_detail</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1531.5 1297.5,-1531.5 "/>
<text text-anchor="middle" x="1193.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1508.5 1297.5,-1508.5 "/>
<text text-anchor="middle" x="1193.5" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1485.5 1297.5,-1485.5 "/>
<text text-anchor="middle" x="1193.5" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic_id</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1462.5 1297.5,-1462.5 "/>
<text text-anchor="middle" x="1193.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1439.5 1297.5,-1439.5 "/>
<text text-anchor="middle" x="1193.5" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1416.5 1297.5,-1416.5 "/>
<text text-anchor="middle" x="1193.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1089.5,-1393.5 1297.5,-1393.5 "/>
<text text-anchor="middle" x="1193.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1297.5,-1370.5 1297.5,-1554.5 "/>
<text text-anchor="middle" x="1308" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge43" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1318.6775,-1373.1958C1321.6295,-1372.0994 1324.5717,-1371.033 1327.5,-1370 1407.8803,-1341.6442 1501.2212,-1320.3318 1575.1578,-1306.0164"/>
<polygon fill="#000000" stroke="#000000" points="1575.8341,-1309.4506 1584.9964,-1304.1305 1574.5163,-1302.5758 1575.8341,-1309.4506"/>
<text text-anchor="middle" x="1455.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge6" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1955.9405,-472.3674C1986.4473,-451.7848 2024.7803,-429.2372 2062.5,-416 2204.7438,-366.0814 2620.9408,-325.8868 2853.8677,-306.5332"/>
<polygon fill="#000000" stroke="#000000" points="2854.4556,-309.9966 2864.1329,-305.6839 2853.8783,-303.0204 2854.4556,-309.9966"/>
<text text-anchor="middle" x="2103" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- vital_signs -->
<g id="node24" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M984,-1992C984,-1992 1271,-1992 1271,-1992 1277,-1992 1283,-1998 1283,-2004 1283,-2004 1283,-2279 1283,-2279 1283,-2285 1277,-2291 1271,-2291 1271,-2291 984,-2291 984,-2291 978,-2291 972,-2285 972,-2279 972,-2279 972,-2004 972,-2004 972,-1998 978,-1992 984,-1992"/>
<text text-anchor="middle" x="1018.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1065,-1992 1065,-2291 "/>
<text text-anchor="middle" x="1075.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1086,-1992 1086,-2291 "/>
<text text-anchor="middle" x="1174" y="-2275.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1086,-2268 1262,-2268 "/>
<text text-anchor="middle" x="1174" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1086,-2245 1262,-2245 "/>
<text text-anchor="middle" x="1174" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1086,-2222 1262,-2222 "/>
<text text-anchor="middle" x="1174" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1086,-2199 1262,-2199 "/>
<text text-anchor="middle" x="1174" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1086,-2176 1262,-2176 "/>
<text text-anchor="middle" x="1174" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1086,-2153 1262,-2153 "/>
<text text-anchor="middle" x="1174" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1086,-2130 1262,-2130 "/>
<text text-anchor="middle" x="1174" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1086,-2107 1262,-2107 "/>
<text text-anchor="middle" x="1174" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1086,-2084 1262,-2084 "/>
<text text-anchor="middle" x="1174" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1086,-2061 1262,-2061 "/>
<text text-anchor="middle" x="1174" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1086,-2038 1262,-2038 "/>
<text text-anchor="middle" x="1174" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1086,-2015 1262,-2015 "/>
<text text-anchor="middle" x="1174" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1262,-1992 1262,-2291 "/>
<text text-anchor="middle" x="1272.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1162.2993,-1991.8293C1182.567,-1904.6586 1206.7045,-1800.8437 1220.1463,-1743.0312"/>
<polygon fill="#000000" stroke="#000000" points="1223.593,-1743.6617 1222.4486,-1733.1288 1216.7748,-1742.0763 1223.593,-1743.6617"/>
<text text-anchor="middle" x="1230.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_site -->
<g id="node25" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3159,-484C3159,-484 3476,-484 3476,-484 3482,-484 3488,-490 3488,-496 3488,-496 3488,-541 3488,-541 3488,-547 3482,-553 3476,-553 3476,-553 3159,-553 3159,-553 3153,-553 3147,-547 3147,-541 3147,-541 3147,-496 3147,-496 3147,-490 3153,-484 3159,-484"/>
<text text-anchor="middle" x="3192" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3237,-484 3237,-553 "/>
<text text-anchor="middle" x="3247.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3258,-484 3258,-553 "/>
<text text-anchor="middle" x="3362.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3258,-530 3467,-530 "/>
<text text-anchor="middle" x="3362.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3258,-507 3467,-507 "/>
<text text-anchor="middle" x="3362.5" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3467,-484 3467,-553 "/>
<text text-anchor="middle" x="3477.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge26" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3271.1284,-483.9139C3242.0305,-462.2113 3202.7468,-432.9116 3163.7537,-403.8288"/>
<polygon fill="#000000" stroke="#000000" points="3165.5497,-400.802 3155.4412,-397.6289 3161.3646,-406.4132 3165.5497,-400.802"/>
<text text-anchor="middle" x="3224" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- publication -->
<g id="node26" class="node">
<title>publication</title>
<path fill="none" stroke="#000000" d="M3518.5,-449.5C3518.5,-449.5 3790.5,-449.5 3790.5,-449.5 3796.5,-449.5 3802.5,-455.5 3802.5,-461.5 3802.5,-461.5 3802.5,-575.5 3802.5,-575.5 3802.5,-581.5 3796.5,-587.5 3790.5,-587.5 3790.5,-587.5 3518.5,-587.5 3518.5,-587.5 3512.5,-587.5 3506.5,-581.5 3506.5,-575.5 3506.5,-575.5 3506.5,-461.5 3506.5,-461.5 3506.5,-455.5 3512.5,-449.5 3518.5,-449.5"/>
<text text-anchor="middle" x="3555" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">publication</text>
<polyline fill="none" stroke="#000000" points="3603.5,-449.5 3603.5,-587.5 "/>
<text text-anchor="middle" x="3614" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3624.5,-449.5 3624.5,-587.5 "/>
<text text-anchor="middle" x="3703" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">authorship</text>
<polyline fill="none" stroke="#000000" points="3624.5,-564.5 3781.5,-564.5 "/>
<text text-anchor="middle" x="3703" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">digital_object_id</text>
<polyline fill="none" stroke="#000000" points="3624.5,-541.5 3781.5,-541.5 "/>
<text text-anchor="middle" x="3703" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">journal_citation</text>
<polyline fill="none" stroke="#000000" points="3624.5,-518.5 3781.5,-518.5 "/>
<text text-anchor="middle" x="3703" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">publication_title</text>
<polyline fill="none" stroke="#000000" points="3624.5,-495.5 3781.5,-495.5 "/>
<text text-anchor="middle" x="3703" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">pubmed_id</text>
<polyline fill="none" stroke="#000000" points="3624.5,-472.5 3781.5,-472.5 "/>
<text text-anchor="middle" x="3703" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">year_of_publication</text>
<polyline fill="none" stroke="#000000" points="3781.5,-449.5 3781.5,-587.5 "/>
<text text-anchor="middle" x="3792" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- publication&#45;&gt;study -->
<g id="edge24" class="edge">
<title>publication&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3506.3393,-452.4174C3503.3733,-451.2554 3500.4245,-450.115 3497.5,-449 3392.5826,-408.9999 3272.3541,-370.2558 3178.3442,-341.5088"/>
<polygon fill="#000000" stroke="#000000" points="3179.3389,-338.1531 3168.7528,-338.5827 3177.2963,-344.8484 3179.3389,-338.1531"/>
<text text-anchor="middle" x="3476" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge49" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1330.3368,-1685.6436C1413.9352,-1669.5329 1530.0914,-1633.7302 1597.5,-1555 1652.273,-1491.0276 1602.3568,-1446.0671 1638.5,-1370 1645.7383,-1354.7663 1656.1126,-1339.7749 1666.5848,-1326.6833"/>
<polygon fill="#000000" stroke="#000000" points="1669.4299,-1328.7344 1673.0908,-1318.7922 1664.0288,-1324.2815 1669.4299,-1328.7344"/>
<text text-anchor="middle" x="1665.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge28" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1264.4833,-1663.9308C1306.092,-1621.6047 1376.5251,-1549.9572 1421.2115,-1504.5003"/>
<polygon fill="#000000" stroke="#000000" points="1423.9114,-1506.7466 1428.4258,-1497.1617 1418.9195,-1501.8393 1423.9114,-1506.7466"/>
<text text-anchor="middle" x="1382" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge19" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1330.3627,-1716.9735C1341.0961,-1713.4156 1348,-1707.2578 1348,-1698.5 1348,-1692.6158 1344.8835,-1687.9054 1339.5829,-1684.3685"/>
<polygon fill="#000000" stroke="#000000" points="1340.9009,-1681.1206 1330.3627,-1680.0265 1337.9185,-1687.4535 1340.9009,-1681.1206"/>
<text text-anchor="middle" x="1364" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- lab_exam -->
<g id="node29" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M523.5,-2123.5C523.5,-2123.5 583.5,-2123.5 583.5,-2123.5 589.5,-2123.5 595.5,-2129.5 595.5,-2135.5 595.5,-2135.5 595.5,-2147.5 595.5,-2147.5 595.5,-2153.5 589.5,-2159.5 583.5,-2159.5 583.5,-2159.5 523.5,-2159.5 523.5,-2159.5 517.5,-2159.5 511.5,-2153.5 511.5,-2147.5 511.5,-2147.5 511.5,-2135.5 511.5,-2135.5 511.5,-2129.5 517.5,-2123.5 523.5,-2123.5"/>
<text text-anchor="middle" x="553.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M550.425,-2123.3952C542.775,-2071.7569 528.6094,-1922.3183 604.5,-1842 622.3406,-1823.1185 946.0226,-1755.6665 1120.7512,-1720.3763"/>
<polygon fill="#000000" stroke="#000000" points="1121.645,-1723.7666 1130.7553,-1718.358 1120.2606,-1716.9048 1121.645,-1723.7666"/>
<text text-anchor="middle" x="734.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- image_collection -->
<g id="node30" class="node">
<title>image_collection</title>
<path fill="none" stroke="#000000" d="M3833,-461C3833,-461 4172,-461 4172,-461 4178,-461 4184,-467 4184,-473 4184,-473 4184,-564 4184,-564 4184,-570 4178,-576 4172,-576 4172,-576 3833,-576 3833,-576 3827,-576 3821,-570 3821,-564 3821,-564 3821,-473 3821,-473 3821,-467 3827,-461 3833,-461"/>
<text text-anchor="middle" x="3889.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection</text>
<polyline fill="none" stroke="#000000" points="3958,-461 3958,-576 "/>
<text text-anchor="middle" x="3968.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3979,-461 3979,-576 "/>
<text text-anchor="middle" x="4071" y="-560.8" font-family="Times,serif" font-size="14.00" fill="#000000">collection_access</text>
<polyline fill="none" stroke="#000000" points="3979,-553 4163,-553 "/>
<text text-anchor="middle" x="4071" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_name</text>
<polyline fill="none" stroke="#000000" points="3979,-530 4163,-530 "/>
<text text-anchor="middle" x="4071" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_url</text>
<polyline fill="none" stroke="#000000" points="3979,-507 4163,-507 "/>
<text text-anchor="middle" x="4071" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_type_included</text>
<polyline fill="none" stroke="#000000" points="3979,-484 4163,-484 "/>
<text text-anchor="middle" x="4071" y="-468.8" font-family="Times,serif" font-size="14.00" fill="#000000">repository_name</text>
<polyline fill="none" stroke="#000000" points="4163,-461 4163,-576 "/>
<text text-anchor="middle" x="4173.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- image_collection&#45;&gt;study -->
<g id="edge25" class="edge">
<title>image_collection&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3850.984,-460.9418C3837.7135,-456.6396 3824.4204,-452.5865 3811.5,-449 3595.668,-389.0885 3340.6321,-343.7233 3178.7424,-317.998"/>
<polygon fill="#000000" stroke="#000000" points="3179.1218,-314.5145 3168.6976,-316.408 3178.0274,-321.4285 3179.1218,-314.5145"/>
<text text-anchor="middle" x="3757" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge30" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1837.5306,-650.7201C1846.2114,-630.5727 1859.1176,-600.6188 1870.4517,-574.3135"/>
<polygon fill="#000000" stroke="#000000" points="1873.8028,-575.3809 1874.5456,-564.8122 1867.3742,-572.611 1873.8028,-575.3809"/>
<text text-anchor="middle" x="1903" y="-609.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- image -->
<g id="node32" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1738.5,-2974C1738.5,-2974 1774.5,-2974 1774.5,-2974 1780.5,-2974 1786.5,-2980 1786.5,-2986 1786.5,-2986 1786.5,-2998 1786.5,-2998 1786.5,-3004 1780.5,-3010 1774.5,-3010 1774.5,-3010 1738.5,-3010 1738.5,-3010 1732.5,-3010 1726.5,-3004 1726.5,-2998 1726.5,-2998 1726.5,-2986 1726.5,-2986 1726.5,-2980 1732.5,-2974 1738.5,-2974"/>
<text text-anchor="middle" x="1756.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge32" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1775.7988,-2973.9864C1804.2739,-2947.5235 1859.3753,-2896.7562 1907.5,-2855 1912.0143,-2851.083 1916.8395,-2846.9892 1921.5795,-2843.0184"/>
<polygon fill="#000000" stroke="#000000" points="1923.9586,-2845.5921 1929.4062,-2836.5051 1919.4808,-2840.2115 1923.9586,-2845.5921"/>
<text text-anchor="middle" x="1938" y="-2858.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- agent_administration -->
<g id="node33" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1911.5C12,-1911.5 481,-1911.5 481,-1911.5 487,-1911.5 493,-1917.5 493,-1923.5 493,-1923.5 493,-2359.5 493,-2359.5 493,-2365.5 487,-2371.5 481,-2371.5 481,-2371.5 12,-2371.5 12,-2371.5 6,-2371.5 0,-2365.5 0,-2359.5 0,-2359.5 0,-1923.5 0,-1923.5 0,-1917.5 6,-1911.5 12,-1911.5"/>
<text text-anchor="middle" x="85" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1911.5 170,-2371.5 "/>
<text text-anchor="middle" x="180.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1911.5 191,-2371.5 "/>
<text text-anchor="middle" x="331.5" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-2348.5 472,-2348.5 "/>
<text text-anchor="middle" x="331.5" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2325.5 472,-2325.5 "/>
<text text-anchor="middle" x="331.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-2302.5 472,-2302.5 "/>
<text text-anchor="middle" x="331.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="191,-2279.5 472,-2279.5 "/>
<text text-anchor="middle" x="331.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2256.5 472,-2256.5 "/>
<text text-anchor="middle" x="331.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="191,-2233.5 472,-2233.5 "/>
<text text-anchor="middle" x="331.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2210.5 472,-2210.5 "/>
<text text-anchor="middle" x="331.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2187.5 472,-2187.5 "/>
<text text-anchor="middle" x="331.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-2164.5 472,-2164.5 "/>
<text text-anchor="middle" x="331.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-2141.5 472,-2141.5 "/>
<text text-anchor="middle" x="331.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="191,-2118.5 472,-2118.5 "/>
<text text-anchor="middle" x="331.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2095.5 472,-2095.5 "/>
<text text-anchor="middle" x="331.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2072.5 472,-2072.5 "/>
<text text-anchor="middle" x="331.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-2049.5 472,-2049.5 "/>
<text text-anchor="middle" x="331.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-2026.5 472,-2026.5 "/>
<text text-anchor="middle" x="331.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2003.5 472,-2003.5 "/>
<text text-anchor="middle" x="331.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-1980.5 472,-1980.5 "/>
<text text-anchor="middle" x="331.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-1957.5 472,-1957.5 "/>
<text text-anchor="middle" x="331.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-1934.5 472,-1934.5 "/>
<text text-anchor="middle" x="331.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="472,-1911.5 472,-2371.5 "/>
<text text-anchor="middle" x="482.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M417.1862,-1911.178C443.5694,-1885.2541 472.2052,-1861.2837 502.5,-1842 527.7878,-1825.9035 539.5933,-1834.9445 567.5,-1824 581.0092,-1818.7019 582.7485,-1813.6328 596.5,-1809 774.5876,-1749.0035 992.3392,-1720.1449 1120.7613,-1707.4066"/>
<polygon fill="#000000" stroke="#000000" points="1121.3834,-1710.8626 1130.9957,-1706.4069 1120.7028,-1703.8957 1121.3834,-1710.8626"/>
<text text-anchor="middle" x="624.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge38" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M443.706,-1911.2188C504.8448,-1830.369 556.5,-1747.5472 556.5,-1698.5 556.5,-1698.5 556.5,-1698.5 556.5,-1284 556.5,-1046.3938 484.2496,-917.1098 662.5,-760 738.2681,-693.218 1401.5074,-678.2943 1692.0877,-674.9595"/>
<polygon fill="#000000" stroke="#000000" points="1692.3055,-678.4574 1702.2658,-674.8457 1692.2272,-671.4579 1692.3055,-678.4574"/>
<text text-anchor="middle" x="587.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
</g>
</svg>
</div>
