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
<svg width="3300pt" height="2966pt"
 viewBox="0.00 0.00 3299.50 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3295.5,-2962 3295.5,4 -4,4"/>
<!-- cohort -->
<g id="node1" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M606,-795C606,-795 839,-795 839,-795 845,-795 851,-801 851,-807 851,-807 851,-829 851,-829 851,-835 845,-841 839,-841 839,-841 606,-841 606,-841 600,-841 594,-835 594,-829 594,-829 594,-807 594,-807 594,-801 600,-795 606,-795"/>
<text text-anchor="middle" x="625.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="657,-795 657,-841 "/>
<text text-anchor="middle" x="667.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="678,-795 678,-841 "/>
<text text-anchor="middle" x="754" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="678,-818 830,-818 "/>
<text text-anchor="middle" x="754" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="830,-795 830,-841 "/>
<text text-anchor="middle" x="840.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm -->
<g id="node25" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1274,-403.5C1274,-403.5 1643,-403.5 1643,-403.5 1649,-403.5 1655,-409.5 1655,-415.5 1655,-415.5 1655,-460.5 1655,-460.5 1655,-466.5 1649,-472.5 1643,-472.5 1643,-472.5 1274,-472.5 1274,-472.5 1268,-472.5 1262,-466.5 1262,-460.5 1262,-460.5 1262,-415.5 1262,-415.5 1262,-409.5 1268,-403.5 1274,-403.5"/>
<text text-anchor="middle" x="1308" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1354,-403.5 1354,-472.5 "/>
<text text-anchor="middle" x="1364.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1375,-403.5 1375,-472.5 "/>
<text text-anchor="middle" x="1504.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="1375,-449.5 1634,-449.5 "/>
<text text-anchor="middle" x="1504.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1375,-426.5 1634,-426.5 "/>
<text text-anchor="middle" x="1504.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1634,-403.5 1634,-472.5 "/>
<text text-anchor="middle" x="1644.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge33" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M730.8763,-794.6962C747.691,-751.7732 790.0071,-661.0464 859.5,-622 914.8245,-590.9145 1083.1319,-620.1574 1144.5,-604 1241.1206,-578.5611 1341.2225,-518.8239 1401.692,-478.3965"/>
<polygon fill="#000000" stroke="#000000" points="1403.9864,-481.0709 1410.321,-472.5783 1400.073,-475.2669 1403.9864,-481.0709"/>
<text text-anchor="middle" x="1365" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study -->
<g id="node26" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1046.5,-190.5C1046.5,-190.5 1326.5,-190.5 1326.5,-190.5 1332.5,-190.5 1338.5,-196.5 1338.5,-202.5 1338.5,-202.5 1338.5,-339.5 1338.5,-339.5 1338.5,-345.5 1332.5,-351.5 1326.5,-351.5 1326.5,-351.5 1046.5,-351.5 1046.5,-351.5 1040.5,-351.5 1034.5,-345.5 1034.5,-339.5 1034.5,-339.5 1034.5,-202.5 1034.5,-202.5 1034.5,-196.5 1040.5,-190.5 1046.5,-190.5"/>
<text text-anchor="middle" x="1062.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1090.5,-190.5 1090.5,-351.5 "/>
<text text-anchor="middle" x="1101" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1111.5,-190.5 1111.5,-351.5 "/>
<text text-anchor="middle" x="1214.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1111.5,-328.5 1317.5,-328.5 "/>
<text text-anchor="middle" x="1214.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1111.5,-305.5 1317.5,-305.5 "/>
<text text-anchor="middle" x="1214.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1111.5,-282.5 1317.5,-282.5 "/>
<text text-anchor="middle" x="1214.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1111.5,-259.5 1317.5,-259.5 "/>
<text text-anchor="middle" x="1214.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1111.5,-236.5 1317.5,-236.5 "/>
<text text-anchor="middle" x="1214.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1111.5,-213.5 1317.5,-213.5 "/>
<text text-anchor="middle" x="1214.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1317.5,-190.5 1317.5,-351.5 "/>
<text text-anchor="middle" x="1328" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge34" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M695.049,-794.9345C619.049,-728.3712 418.3067,-532.4583 524.5,-403 586.5191,-327.3937 849.0071,-294.2665 1024.2382,-280.3647"/>
<polygon fill="#000000" stroke="#000000" points="1024.645,-283.8437 1034.3425,-279.5767 1024.1006,-276.8649 1024.645,-283.8437"/>
<text text-anchor="middle" x="536" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node2" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M546,-403.5C546,-403.5 863,-403.5 863,-403.5 869,-403.5 875,-409.5 875,-415.5 875,-415.5 875,-460.5 875,-460.5 875,-466.5 869,-472.5 863,-472.5 863,-472.5 546,-472.5 546,-472.5 540,-472.5 534,-466.5 534,-460.5 534,-460.5 534,-415.5 534,-415.5 534,-409.5 540,-403.5 546,-403.5"/>
<text text-anchor="middle" x="579" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="624,-403.5 624,-472.5 "/>
<text text-anchor="middle" x="634.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="645,-403.5 645,-472.5 "/>
<text text-anchor="middle" x="749.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="645,-449.5 854,-449.5 "/>
<text text-anchor="middle" x="749.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="645,-426.5 854,-426.5 "/>
<text text-anchor="middle" x="749.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="854,-403.5 854,-472.5 "/>
<text text-anchor="middle" x="864.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge14" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M804.0784,-403.4988C867.6589,-381.4699 951.561,-352.4 1024.5736,-327.1031"/>
<polygon fill="#000000" stroke="#000000" points="1026.0361,-330.3006 1034.3392,-323.7196 1023.7444,-323.6863 1026.0361,-330.3006"/>
<text text-anchor="middle" x="919" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- diagnosis -->
<g id="node3" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2678,-2344.5C2678,-2344.5 3021,-2344.5 3021,-2344.5 3027,-2344.5 3033,-2350.5 3033,-2356.5 3033,-2356.5 3033,-2631.5 3033,-2631.5 3033,-2637.5 3027,-2643.5 3021,-2643.5 3021,-2643.5 2678,-2643.5 2678,-2643.5 2672,-2643.5 2666,-2637.5 2666,-2631.5 2666,-2631.5 2666,-2356.5 2666,-2356.5 2666,-2350.5 2672,-2344.5 2678,-2344.5"/>
<text text-anchor="middle" x="2708" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2750,-2344.5 2750,-2643.5 "/>
<text text-anchor="middle" x="2760.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2771,-2344.5 2771,-2643.5 "/>
<text text-anchor="middle" x="2891.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2771,-2620.5 3012,-2620.5 "/>
<text text-anchor="middle" x="2891.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2771,-2597.5 3012,-2597.5 "/>
<text text-anchor="middle" x="2891.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2771,-2574.5 3012,-2574.5 "/>
<text text-anchor="middle" x="2891.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2771,-2551.5 3012,-2551.5 "/>
<text text-anchor="middle" x="2891.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2771,-2528.5 3012,-2528.5 "/>
<text text-anchor="middle" x="2891.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2771,-2505.5 3012,-2505.5 "/>
<text text-anchor="middle" x="2891.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2771,-2482.5 3012,-2482.5 "/>
<text text-anchor="middle" x="2891.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2771,-2459.5 3012,-2459.5 "/>
<text text-anchor="middle" x="2891.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2771,-2436.5 3012,-2436.5 "/>
<text text-anchor="middle" x="2891.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2771,-2413.5 3012,-2413.5 "/>
<text text-anchor="middle" x="2891.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2771,-2390.5 3012,-2390.5 "/>
<text text-anchor="middle" x="2891.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2771,-2367.5 3012,-2367.5 "/>
<text text-anchor="middle" x="2891.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="3012,-2344.5 3012,-2643.5 "/>
<text text-anchor="middle" x="3022.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node11" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1466,-1065.5C1466,-1065.5 1685,-1065.5 1685,-1065.5 1691,-1065.5 1697,-1071.5 1697,-1077.5 1697,-1077.5 1697,-1145.5 1697,-1145.5 1697,-1151.5 1691,-1157.5 1685,-1157.5 1685,-1157.5 1466,-1157.5 1466,-1157.5 1460,-1157.5 1454,-1151.5 1454,-1145.5 1454,-1145.5 1454,-1077.5 1454,-1077.5 1454,-1071.5 1460,-1065.5 1466,-1065.5"/>
<text text-anchor="middle" x="1478.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1503,-1065.5 1503,-1157.5 "/>
<text text-anchor="middle" x="1513.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1524,-1065.5 1524,-1157.5 "/>
<text text-anchor="middle" x="1600" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1524,-1134.5 1676,-1134.5 "/>
<text text-anchor="middle" x="1600" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1524,-1111.5 1676,-1111.5 "/>
<text text-anchor="middle" x="1600" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1524,-1088.5 1676,-1088.5 "/>
<text text-anchor="middle" x="1600" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1676,-1065.5 1676,-1157.5 "/>
<text text-anchor="middle" x="1686.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge21" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M3033.2165,-2431.3484C3079.9369,-2406.1662 3124.5096,-2371.9 3151.5,-2326 3218.9721,-2211.2564 3222.8872,-1839.3496 3151.5,-1727 2860.8307,-1269.5425 2561.7728,-1380.1127 2047.5,-1209 1935.3536,-1171.6858 1803.267,-1145.8657 1707.3867,-1130.2156"/>
<polygon fill="#000000" stroke="#000000" points="1707.7763,-1126.7332 1697.3459,-1128.5922 1706.659,-1133.6435 1707.7763,-1126.7332"/>
<text text-anchor="middle" x="3143.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent_administration -->
<g id="node4" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1785C12,-1785 481,-1785 481,-1785 487,-1785 493,-1791 493,-1797 493,-1797 493,-2256 493,-2256 493,-2262 487,-2268 481,-2268 481,-2268 12,-2268 12,-2268 6,-2268 0,-2262 0,-2256 0,-2256 0,-1797 0,-1797 0,-1791 6,-1785 12,-1785"/>
<text text-anchor="middle" x="85" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1785 170,-2268 "/>
<text text-anchor="middle" x="180.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1785 191,-2268 "/>
<text text-anchor="middle" x="331.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-2245 472,-2245 "/>
<text text-anchor="middle" x="331.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2222 472,-2222 "/>
<text text-anchor="middle" x="331.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2199 472,-2199 "/>
<text text-anchor="middle" x="331.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="191,-2176 472,-2176 "/>
<text text-anchor="middle" x="331.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="191,-2153 472,-2153 "/>
<text text-anchor="middle" x="331.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2130 472,-2130 "/>
<text text-anchor="middle" x="331.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2107 472,-2107 "/>
<text text-anchor="middle" x="331.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-2084 472,-2084 "/>
<text text-anchor="middle" x="331.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-2061 472,-2061 "/>
<text text-anchor="middle" x="331.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-2038 472,-2038 "/>
<text text-anchor="middle" x="331.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2015 472,-2015 "/>
<text text-anchor="middle" x="331.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-1992 472,-1992 "/>
<text text-anchor="middle" x="331.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="191,-1969 472,-1969 "/>
<text text-anchor="middle" x="331.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1946 472,-1946 "/>
<text text-anchor="middle" x="331.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="191,-1923 472,-1923 "/>
<text text-anchor="middle" x="331.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-1900 472,-1900 "/>
<text text-anchor="middle" x="331.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-1877 472,-1877 "/>
<text text-anchor="middle" x="331.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1854 472,-1854 "/>
<text text-anchor="middle" x="331.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-1831 472,-1831 "/>
<text text-anchor="middle" x="331.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-1808 472,-1808 "/>
<text text-anchor="middle" x="331.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="472,-1785 472,-2268 "/>
<text text-anchor="middle" x="482.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node6" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1031,-1549C1031,-1549 1206,-1549 1206,-1549 1212,-1549 1218,-1555 1218,-1561 1218,-1561 1218,-1583 1218,-1583 1218,-1589 1212,-1595 1206,-1595 1206,-1595 1031,-1595 1031,-1595 1025,-1595 1019,-1589 1019,-1583 1019,-1583 1019,-1561 1019,-1561 1019,-1555 1025,-1549 1031,-1549"/>
<text text-anchor="middle" x="1042.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1066,-1549 1066,-1595 "/>
<text text-anchor="middle" x="1076.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1087,-1549 1087,-1595 "/>
<text text-anchor="middle" x="1142" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1087,-1572 1197,-1572 "/>
<text text-anchor="middle" x="1142" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1197,-1549 1197,-1595 "/>
<text text-anchor="middle" x="1207.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M436.0696,-1784.8909C457.3135,-1764.0522 479.594,-1744.3402 502.5,-1727 517.7209,-1715.4775 524.3508,-1717.3874 541.5,-1709 554.5354,-1702.6246 556.8599,-1698.9512 570.5,-1694 717.9093,-1640.4919 896.4888,-1606.0523 1008.831,-1587.8483"/>
<polygon fill="#000000" stroke="#000000" points="1009.5006,-1591.2857 1018.8191,-1586.2443 1008.3906,-1584.3742 1009.5006,-1591.2857"/>
<text text-anchor="middle" x="598.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent -->
<g id="node27" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M965.5,-524.5C965.5,-524.5 1191.5,-524.5 1191.5,-524.5 1197.5,-524.5 1203.5,-530.5 1203.5,-536.5 1203.5,-536.5 1203.5,-558.5 1203.5,-558.5 1203.5,-564.5 1197.5,-570.5 1191.5,-570.5 1191.5,-570.5 965.5,-570.5 965.5,-570.5 959.5,-570.5 953.5,-564.5 953.5,-558.5 953.5,-558.5 953.5,-536.5 953.5,-536.5 953.5,-530.5 959.5,-524.5 965.5,-524.5"/>
<text text-anchor="middle" x="982" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1010.5,-524.5 1010.5,-570.5 "/>
<text text-anchor="middle" x="1021" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1031.5,-524.5 1031.5,-570.5 "/>
<text text-anchor="middle" x="1107" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1031.5,-547.5 1182.5,-547.5 "/>
<text text-anchor="middle" x="1107" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1182.5,-524.5 1182.5,-570.5 "/>
<text text-anchor="middle" x="1193" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge27" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M463.5556,-1784.7652C502.2432,-1720.0889 530.5,-1647.1332 530.5,-1572 530.5,-1572 530.5,-1572 530.5,-818 530.5,-727.6432 516.9171,-681.9741 584.5,-622 636.2538,-576.0729 815.3903,-558.4551 943.0211,-551.699"/>
<polygon fill="#000000" stroke="#000000" points="943.4656,-555.1809 953.2734,-551.1737 943.1073,-548.1901 943.4656,-555.1809"/>
<text text-anchor="middle" x="561.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- prior_surgery -->
<g id="node5" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2186.5,-1946C2186.5,-1946 2532.5,-1946 2532.5,-1946 2538.5,-1946 2544.5,-1952 2544.5,-1958 2544.5,-1958 2544.5,-2095 2544.5,-2095 2544.5,-2101 2538.5,-2107 2532.5,-2107 2532.5,-2107 2186.5,-2107 2186.5,-2107 2180.5,-2107 2174.5,-2101 2174.5,-2095 2174.5,-2095 2174.5,-1958 2174.5,-1958 2174.5,-1952 2180.5,-1946 2186.5,-1946"/>
<text text-anchor="middle" x="2232" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2289.5,-1946 2289.5,-2107 "/>
<text text-anchor="middle" x="2300" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2310.5,-1946 2310.5,-2107 "/>
<text text-anchor="middle" x="2417" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2084 2523.5,-2084 "/>
<text text-anchor="middle" x="2417" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2061 2523.5,-2061 "/>
<text text-anchor="middle" x="2417" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2038 2523.5,-2038 "/>
<text text-anchor="middle" x="2417" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2015 2523.5,-2015 "/>
<text text-anchor="middle" x="2417" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1992 2523.5,-1992 "/>
<text text-anchor="middle" x="2417" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1969 2523.5,-1969 "/>
<text text-anchor="middle" x="2417" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2523.5,-1946 2523.5,-2107 "/>
<text text-anchor="middle" x="2534" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge6" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2544.613,-2068.5585C2555.7907,-2058.5547 2562.5,-2044.5352 2562.5,-2026.5 2562.5,-2012.5509 2558.4865,-2001.004 2551.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2553.9806,-1989.3911 2544.613,-1984.4415 2548.8494,-1994.1525 2553.9806,-1989.3911"/>
<text text-anchor="middle" x="2578.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node17" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2041,-1468.5C2041,-1468.5 2390,-1468.5 2390,-1468.5 2396,-1468.5 2402,-1474.5 2402,-1480.5 2402,-1480.5 2402,-1663.5 2402,-1663.5 2402,-1669.5 2396,-1675.5 2390,-1675.5 2390,-1675.5 2041,-1675.5 2041,-1675.5 2035,-1675.5 2029,-1669.5 2029,-1663.5 2029,-1663.5 2029,-1480.5 2029,-1480.5 2029,-1474.5 2035,-1468.5 2041,-1468.5"/>
<text text-anchor="middle" x="2076.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2124,-1468.5 2124,-1675.5 "/>
<text text-anchor="middle" x="2134.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2145,-1468.5 2145,-1675.5 "/>
<text text-anchor="middle" x="2263" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2145,-1652.5 2381,-1652.5 "/>
<text text-anchor="middle" x="2263" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2145,-1629.5 2381,-1629.5 "/>
<text text-anchor="middle" x="2263" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2145,-1606.5 2381,-1606.5 "/>
<text text-anchor="middle" x="2263" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2145,-1583.5 2381,-1583.5 "/>
<text text-anchor="middle" x="2263" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2145,-1560.5 2381,-1560.5 "/>
<text text-anchor="middle" x="2263" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2145,-1537.5 2381,-1537.5 "/>
<text text-anchor="middle" x="2263" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2145,-1514.5 2381,-1514.5 "/>
<text text-anchor="middle" x="2263" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2145,-1491.5 2381,-1491.5 "/>
<text text-anchor="middle" x="2263" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2381,-1468.5 2381,-1675.5 "/>
<text text-anchor="middle" x="2391.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge31" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2333.9216,-1945.7682C2310.9722,-1873.3341 2277.0537,-1766.2789 2251.392,-1685.2842"/>
<polygon fill="#000000" stroke="#000000" points="2254.6617,-1684.0159 2248.3048,-1675.5401 2247.9886,-1686.1302 2254.6617,-1684.0159"/>
<text text-anchor="middle" x="2307.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge4" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1176.5376,-1595.0098C1207.6529,-1598.9199 1236,-1591.25 1236,-1572 1236,-1554.8555 1213.5147,-1546.8964 1186.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1186.2006,-1544.6454 1176.5376,-1548.9902 1186.801,-1551.6196 1186.2006,-1544.6454"/>
<text text-anchor="middle" x="1252" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge23" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1218.2657,-1558.3589C1305.9539,-1540.9575 1430.2293,-1502.1457 1500.5,-1417 1560.475,-1344.3293 1516.8151,-1299.9323 1541.5,-1209 1545.2036,-1195.3568 1549.8518,-1180.8672 1554.5112,-1167.3471"/>
<polygon fill="#000000" stroke="#000000" points="1557.8878,-1168.2946 1557.8925,-1157.6998 1551.2818,-1165.9792 1557.8878,-1168.2946"/>
<text text-anchor="middle" x="1568.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle -->
<g id="node24" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M877.5,-1278.5C877.5,-1278.5 1105.5,-1278.5 1105.5,-1278.5 1111.5,-1278.5 1117.5,-1284.5 1117.5,-1290.5 1117.5,-1290.5 1117.5,-1335.5 1117.5,-1335.5 1117.5,-1341.5 1111.5,-1347.5 1105.5,-1347.5 1105.5,-1347.5 877.5,-1347.5 877.5,-1347.5 871.5,-1347.5 865.5,-1341.5 865.5,-1335.5 865.5,-1335.5 865.5,-1290.5 865.5,-1290.5 865.5,-1284.5 871.5,-1278.5 877.5,-1278.5"/>
<text text-anchor="middle" x="892.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="919.5,-1278.5 919.5,-1347.5 "/>
<text text-anchor="middle" x="930" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="940.5,-1278.5 940.5,-1347.5 "/>
<text text-anchor="middle" x="1018.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="940.5,-1324.5 1096.5,-1324.5 "/>
<text text-anchor="middle" x="1018.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="940.5,-1301.5 1096.5,-1301.5 "/>
<text text-anchor="middle" x="1018.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1096.5,-1278.5 1096.5,-1347.5 "/>
<text text-anchor="middle" x="1107" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge39" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1107.0056,-1548.5587C1085.7647,-1505.2406 1040.0654,-1412.0428 1012.9496,-1356.7437"/>
<polygon fill="#000000" stroke="#000000" points="1015.9837,-1354.9815 1008.4385,-1347.5438 1009.6987,-1358.0635 1015.9837,-1354.9815"/>
<text text-anchor="middle" x="1085" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- image -->
<g id="node7" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1972.5,-2836C1972.5,-2836 2008.5,-2836 2008.5,-2836 2014.5,-2836 2020.5,-2842 2020.5,-2848 2020.5,-2848 2020.5,-2860 2020.5,-2860 2020.5,-2866 2014.5,-2872 2008.5,-2872 2008.5,-2872 1972.5,-2872 1972.5,-2872 1966.5,-2872 1960.5,-2866 1960.5,-2860 1960.5,-2860 1960.5,-2848 1960.5,-2848 1960.5,-2842 1966.5,-2836 1972.5,-2836"/>
<text text-anchor="middle" x="1990.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node15" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1974.5,-2662.5C1974.5,-2662.5 2006.5,-2662.5 2006.5,-2662.5 2012.5,-2662.5 2018.5,-2668.5 2018.5,-2674.5 2018.5,-2674.5 2018.5,-2686.5 2018.5,-2686.5 2018.5,-2692.5 2012.5,-2698.5 2006.5,-2698.5 2006.5,-2698.5 1974.5,-2698.5 1974.5,-2698.5 1968.5,-2698.5 1962.5,-2692.5 1962.5,-2686.5 1962.5,-2686.5 1962.5,-2674.5 1962.5,-2674.5 1962.5,-2668.5 1968.5,-2662.5 1974.5,-2662.5"/>
<text text-anchor="middle" x="1990.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge42" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1990.5,-2835.7604C1990.5,-2805.5622 1990.5,-2744.9545 1990.5,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1994.0001,-2708.7555 1990.5,-2698.7556 1987.0001,-2708.7556 1994.0001,-2708.7555"/>
<text text-anchor="middle" x="2021" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- physical_exam -->
<g id="node8" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1828.5,-1934.5C1828.5,-1934.5 2144.5,-1934.5 2144.5,-1934.5 2150.5,-1934.5 2156.5,-1940.5 2156.5,-1946.5 2156.5,-1946.5 2156.5,-2106.5 2156.5,-2106.5 2156.5,-2112.5 2150.5,-2118.5 2144.5,-2118.5 2144.5,-2118.5 1828.5,-2118.5 1828.5,-2118.5 1822.5,-2118.5 1816.5,-2112.5 1816.5,-2106.5 1816.5,-2106.5 1816.5,-1946.5 1816.5,-1946.5 1816.5,-1940.5 1822.5,-1934.5 1828.5,-1934.5"/>
<text text-anchor="middle" x="1877.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1938.5,-1934.5 1938.5,-2118.5 "/>
<text text-anchor="middle" x="1949" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1959.5,-1934.5 1959.5,-2118.5 "/>
<text text-anchor="middle" x="2047.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2095.5 2135.5,-2095.5 "/>
<text text-anchor="middle" x="2047.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2072.5 2135.5,-2072.5 "/>
<text text-anchor="middle" x="2047.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2049.5 2135.5,-2049.5 "/>
<text text-anchor="middle" x="2047.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2026.5 2135.5,-2026.5 "/>
<text text-anchor="middle" x="2047.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2003.5 2135.5,-2003.5 "/>
<text text-anchor="middle" x="2047.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1980.5 2135.5,-1980.5 "/>
<text text-anchor="middle" x="2047.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1957.5 2135.5,-1957.5 "/>
<text text-anchor="middle" x="2047.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2135.5,-1934.5 2135.5,-2118.5 "/>
<text text-anchor="middle" x="2146" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1954.4113,-1934.4085C1926.1239,-1866.8326 1878.2756,-1778.2454 1807.5,-1727 1715.8511,-1660.6412 1398.1982,-1609.3974 1228.0756,-1585.9681"/>
<polygon fill="#000000" stroke="#000000" points="1228.4698,-1582.4895 1218.0875,-1584.6012 1227.5206,-1589.4249 1228.4698,-1582.4895"/>
<text text-anchor="middle" x="1796.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge29" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2032.6361,-1934.3506C2066.1025,-1867.5784 2112.5001,-1775.1521 2153.5,-1694 2154.9999,-1691.0312 2156.5212,-1688.0222 2158.0571,-1684.9863"/>
<polygon fill="#000000" stroke="#000000" points="2161.3078,-1686.3141 2162.7014,-1675.8113 2155.0623,-1683.1527 2161.3078,-1686.3141"/>
<text text-anchor="middle" x="2203.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- principal_investigator -->
<g id="node9" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M905,-403.5C905,-403.5 1232,-403.5 1232,-403.5 1238,-403.5 1244,-409.5 1244,-415.5 1244,-415.5 1244,-460.5 1244,-460.5 1244,-466.5 1238,-472.5 1232,-472.5 1232,-472.5 905,-472.5 905,-472.5 899,-472.5 893,-466.5 893,-460.5 893,-460.5 893,-415.5 893,-415.5 893,-409.5 899,-403.5 905,-403.5"/>
<text text-anchor="middle" x="980" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1067,-403.5 1067,-472.5 "/>
<text text-anchor="middle" x="1077.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1088,-403.5 1088,-472.5 "/>
<text text-anchor="middle" x="1155.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1088,-449.5 1223,-449.5 "/>
<text text-anchor="middle" x="1155.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1088,-426.5 1223,-426.5 "/>
<text text-anchor="middle" x="1155.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1223,-403.5 1223,-472.5 "/>
<text text-anchor="middle" x="1233.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge15" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1092.9497,-403.3975C1101.949,-390.6611 1112.6043,-375.5813 1123.4429,-360.2418"/>
<polygon fill="#000000" stroke="#000000" points="1126.5617,-361.8931 1129.474,-351.7063 1120.8448,-357.8536 1126.5617,-361.8931"/>
<text text-anchor="middle" x="1144" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- program -->
<g id="node10" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1032.5,-.5C1032.5,-.5 1340.5,-.5 1340.5,-.5 1346.5,-.5 1352.5,-6.5 1352.5,-12.5 1352.5,-12.5 1352.5,-126.5 1352.5,-126.5 1352.5,-132.5 1346.5,-138.5 1340.5,-138.5 1340.5,-138.5 1032.5,-138.5 1032.5,-138.5 1026.5,-138.5 1020.5,-132.5 1020.5,-126.5 1020.5,-126.5 1020.5,-12.5 1020.5,-12.5 1020.5,-6.5 1026.5,-.5 1032.5,-.5"/>
<text text-anchor="middle" x="1059.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1098.5,-.5 1098.5,-138.5 "/>
<text text-anchor="middle" x="1109" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1119.5,-.5 1119.5,-138.5 "/>
<text text-anchor="middle" x="1225.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1119.5,-115.5 1331.5,-115.5 "/>
<text text-anchor="middle" x="1225.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1119.5,-92.5 1331.5,-92.5 "/>
<text text-anchor="middle" x="1225.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1119.5,-69.5 1331.5,-69.5 "/>
<text text-anchor="middle" x="1225.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1119.5,-46.5 1331.5,-46.5 "/>
<text text-anchor="middle" x="1225.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1119.5,-23.5 1331.5,-23.5 "/>
<text text-anchor="middle" x="1225.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1331.5,-.5 1331.5,-138.5 "/>
<text text-anchor="middle" x="1342" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge37" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1453.9349,-1106.6237C1276.4022,-1097.5672 956.7414,-1073.3584 859.5,-1014 796.279,-975.4085 754.638,-895.4124 735.2038,-850.4657"/>
<polygon fill="#000000" stroke="#000000" points="738.3942,-849.0235 731.2848,-841.1681 731.9438,-851.7424 738.3942,-849.0235"/>
<text text-anchor="middle" x="981" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node14" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1368,-714.5C1368,-714.5 1783,-714.5 1783,-714.5 1789,-714.5 1795,-720.5 1795,-726.5 1795,-726.5 1795,-909.5 1795,-909.5 1795,-915.5 1789,-921.5 1783,-921.5 1783,-921.5 1368,-921.5 1368,-921.5 1362,-921.5 1356,-915.5 1356,-909.5 1356,-909.5 1356,-726.5 1356,-726.5 1356,-720.5 1362,-714.5 1368,-714.5"/>
<text text-anchor="middle" x="1397.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1439,-714.5 1439,-921.5 "/>
<text text-anchor="middle" x="1449.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1460,-714.5 1460,-921.5 "/>
<text text-anchor="middle" x="1617" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1460,-898.5 1774,-898.5 "/>
<text text-anchor="middle" x="1617" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1460,-875.5 1774,-875.5 "/>
<text text-anchor="middle" x="1617" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1460,-852.5 1774,-852.5 "/>
<text text-anchor="middle" x="1617" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1460,-829.5 1774,-829.5 "/>
<text text-anchor="middle" x="1617" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1460,-806.5 1774,-806.5 "/>
<text text-anchor="middle" x="1617" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1460,-783.5 1774,-783.5 "/>
<text text-anchor="middle" x="1617" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1460,-760.5 1774,-760.5 "/>
<text text-anchor="middle" x="1617" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1460,-737.5 1774,-737.5 "/>
<text text-anchor="middle" x="1617" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1774,-714.5 1774,-921.5 "/>
<text text-anchor="middle" x="1784.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge26" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1575.5,-1065.3178C1575.5,-1029.5232 1575.5,-978.3477 1575.5,-931.8265"/>
<polygon fill="#000000" stroke="#000000" points="1579.0001,-931.669 1575.5,-921.6691 1572.0001,-931.6691 1579.0001,-931.669"/>
<text text-anchor="middle" x="1630" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node22" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1825,-726C1825,-726 2272,-726 2272,-726 2278,-726 2284,-732 2284,-738 2284,-738 2284,-898 2284,-898 2284,-904 2278,-910 2272,-910 2272,-910 1825,-910 1825,-910 1819,-910 1813,-904 1813,-898 1813,-898 1813,-738 1813,-738 1813,-732 1819,-726 1825,-726"/>
<text text-anchor="middle" x="1870.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1928,-726 1928,-910 "/>
<text text-anchor="middle" x="1938.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1949,-726 1949,-910 "/>
<text text-anchor="middle" x="2106" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1949,-887 2263,-887 "/>
<text text-anchor="middle" x="2106" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1949,-864 2263,-864 "/>
<text text-anchor="middle" x="2106" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1949,-841 2263,-841 "/>
<text text-anchor="middle" x="2106" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1949,-818 2263,-818 "/>
<text text-anchor="middle" x="2106" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1949,-795 2263,-795 "/>
<text text-anchor="middle" x="2106" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1949,-772 2263,-772 "/>
<text text-anchor="middle" x="2106" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1949,-749 2263,-749 "/>
<text text-anchor="middle" x="2106" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2263,-726 2263,-910 "/>
<text text-anchor="middle" x="2273.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1697.1096,-1067.0086C1732.7163,-1052.0647 1771.0441,-1034.0375 1804.5,-1014 1851.1386,-986.0671 1898.592,-950.0298 1939.0993,-916.4897"/>
<polygon fill="#000000" stroke="#000000" points="1941.3998,-919.1287 1946.8427,-910.0388 1936.9193,-913.7505 1941.3998,-919.1287"/>
<text text-anchor="middle" x="1839.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge38" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1697.3118,-1103.1295C1891.3202,-1088.6061 2252.8832,-1056.2043 2293.5,-1014 2354.1882,-950.9398 2312.5,-905.5195 2312.5,-818 2312.5,-818 2312.5,-818 2312.5,-438 2312.5,-341.7461 1660.3699,-295.276 1348.682,-278.5625"/>
<polygon fill="#000000" stroke="#000000" points="1348.8219,-275.0651 1338.65,-278.0285 1348.4498,-282.0552 1348.8219,-275.0651"/>
<text text-anchor="middle" x="2353" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node28" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M881,-622.5C881,-622.5 1276,-622.5 1276,-622.5 1282,-622.5 1288,-628.5 1288,-634.5 1288,-634.5 1288,-1001.5 1288,-1001.5 1288,-1007.5 1282,-1013.5 1276,-1013.5 1276,-1013.5 881,-1013.5 881,-1013.5 875,-1013.5 869,-1007.5 869,-1001.5 869,-1001.5 869,-634.5 869,-634.5 869,-628.5 875,-622.5 881,-622.5"/>
<text text-anchor="middle" x="929" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="989,-622.5 989,-1013.5 "/>
<text text-anchor="middle" x="999.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1010,-622.5 1010,-1013.5 "/>
<text text-anchor="middle" x="1138.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1010,-990.5 1267,-990.5 "/>
<text text-anchor="middle" x="1138.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1010,-967.5 1267,-967.5 "/>
<text text-anchor="middle" x="1138.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1010,-944.5 1267,-944.5 "/>
<text text-anchor="middle" x="1138.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1010,-921.5 1267,-921.5 "/>
<text text-anchor="middle" x="1138.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1010,-898.5 1267,-898.5 "/>
<text text-anchor="middle" x="1138.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1010,-875.5 1267,-875.5 "/>
<text text-anchor="middle" x="1138.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1010,-852.5 1267,-852.5 "/>
<text text-anchor="middle" x="1138.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1010,-829.5 1267,-829.5 "/>
<text text-anchor="middle" x="1138.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1010,-806.5 1267,-806.5 "/>
<text text-anchor="middle" x="1138.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1010,-783.5 1267,-783.5 "/>
<text text-anchor="middle" x="1138.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1010,-760.5 1267,-760.5 "/>
<text text-anchor="middle" x="1138.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1010,-737.5 1267,-737.5 "/>
<text text-anchor="middle" x="1138.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1010,-714.5 1267,-714.5 "/>
<text text-anchor="middle" x="1138.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1010,-691.5 1267,-691.5 "/>
<text text-anchor="middle" x="1138.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1010,-668.5 1267,-668.5 "/>
<text text-anchor="middle" x="1138.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1010,-645.5 1267,-645.5 "/>
<text text-anchor="middle" x="1138.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1267,-622.5 1267,-1013.5 "/>
<text text-anchor="middle" x="1277.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge43" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1453.813,-1097.7271C1372.9608,-1086.7723 1275.4697,-1069.5458 1240.5,-1047 1228.528,-1039.2813 1217.1768,-1030.3369 1206.461,-1020.5477"/>
<polygon fill="#000000" stroke="#000000" points="1208.8183,-1017.9598 1199.144,-1013.6402 1204.013,-1023.05 1208.8183,-1017.9598"/>
<text text-anchor="middle" x="1309.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- disease_extent -->
<g id="node12" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M625.5,-1877C625.5,-1877 941.5,-1877 941.5,-1877 947.5,-1877 953.5,-1883 953.5,-1889 953.5,-1889 953.5,-2164 953.5,-2164 953.5,-2170 947.5,-2176 941.5,-2176 941.5,-2176 625.5,-2176 625.5,-2176 619.5,-2176 613.5,-2170 613.5,-2164 613.5,-2164 613.5,-1889 613.5,-1889 613.5,-1883 619.5,-1877 625.5,-1877"/>
<text text-anchor="middle" x="675" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="736.5,-1877 736.5,-2176 "/>
<text text-anchor="middle" x="747" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="757.5,-1877 757.5,-2176 "/>
<text text-anchor="middle" x="845" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="757.5,-2153 932.5,-2153 "/>
<text text-anchor="middle" x="845" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="757.5,-2130 932.5,-2130 "/>
<text text-anchor="middle" x="845" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="757.5,-2107 932.5,-2107 "/>
<text text-anchor="middle" x="845" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="757.5,-2084 932.5,-2084 "/>
<text text-anchor="middle" x="845" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="757.5,-2061 932.5,-2061 "/>
<text text-anchor="middle" x="845" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="757.5,-2038 932.5,-2038 "/>
<text text-anchor="middle" x="845" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="757.5,-2015 932.5,-2015 "/>
<text text-anchor="middle" x="845" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="757.5,-1992 932.5,-1992 "/>
<text text-anchor="middle" x="845" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="757.5,-1969 932.5,-1969 "/>
<text text-anchor="middle" x="845" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="757.5,-1946 932.5,-1946 "/>
<text text-anchor="middle" x="845" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="757.5,-1923 932.5,-1923 "/>
<text text-anchor="middle" x="845" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="757.5,-1900 932.5,-1900 "/>
<text text-anchor="middle" x="845" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="932.5,-1877 932.5,-2176 "/>
<text text-anchor="middle" x="943" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M862.9904,-1876.9783C891.8399,-1827.4956 926.3049,-1773.2865 962.5,-1727 999.6227,-1679.5273 1050.2744,-1631.6691 1083.6584,-1601.9488"/>
<polygon fill="#000000" stroke="#000000" points="1086.164,-1604.4054 1091.3386,-1595.1601 1081.528,-1599.1605 1086.164,-1604.4054"/>
<text text-anchor="middle" x="1018.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- demographic -->
<g id="node13" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2854.5,-1232.5C2854.5,-1232.5 3190.5,-1232.5 3190.5,-1232.5 3196.5,-1232.5 3202.5,-1238.5 3202.5,-1244.5 3202.5,-1244.5 3202.5,-1381.5 3202.5,-1381.5 3202.5,-1387.5 3196.5,-1393.5 3190.5,-1393.5 3190.5,-1393.5 2854.5,-1393.5 2854.5,-1393.5 2848.5,-1393.5 2842.5,-1387.5 2842.5,-1381.5 2842.5,-1381.5 2842.5,-1244.5 2842.5,-1244.5 2842.5,-1238.5 2848.5,-1232.5 2854.5,-1232.5"/>
<text text-anchor="middle" x="2897.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2952.5,-1232.5 2952.5,-1393.5 "/>
<text text-anchor="middle" x="2963" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2973.5,-1232.5 2973.5,-1393.5 "/>
<text text-anchor="middle" x="3077.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2973.5,-1370.5 3181.5,-1370.5 "/>
<text text-anchor="middle" x="3077.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2973.5,-1347.5 3181.5,-1347.5 "/>
<text text-anchor="middle" x="3077.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2973.5,-1324.5 3181.5,-1324.5 "/>
<text text-anchor="middle" x="3077.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2973.5,-1301.5 3181.5,-1301.5 "/>
<text text-anchor="middle" x="3077.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2973.5,-1278.5 3181.5,-1278.5 "/>
<text text-anchor="middle" x="3077.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2973.5,-1255.5 3181.5,-1255.5 "/>
<text text-anchor="middle" x="3077.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="3181.5,-1232.5 3181.5,-1393.5 "/>
<text text-anchor="middle" x="3192" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge17" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2930.7797,-1232.3559C2900.2491,-1210.0491 2864.7376,-1188.5399 2828.5,-1176 2724.761,-1140.1015 2007.4559,-1120.7448 1707.2064,-1114.1378"/>
<polygon fill="#000000" stroke="#000000" points="1707.2127,-1110.6372 1697.1386,-1113.9177 1707.0596,-1117.6356 1707.2127,-1110.6372"/>
<text text-anchor="middle" x="2884.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node20" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M984,-1750.5C984,-1750.5 1407,-1750.5 1407,-1750.5 1413,-1750.5 1419,-1756.5 1419,-1762.5 1419,-1762.5 1419,-2290.5 1419,-2290.5 1419,-2296.5 1413,-2302.5 1407,-2302.5 1407,-2302.5 984,-2302.5 984,-2302.5 978,-2302.5 972,-2296.5 972,-2290.5 972,-2290.5 972,-1762.5 972,-1762.5 972,-1756.5 978,-1750.5 984,-1750.5"/>
<text text-anchor="middle" x="1006" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1040,-1750.5 1040,-2302.5 "/>
<text text-anchor="middle" x="1050.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1061,-1750.5 1061,-2302.5 "/>
<text text-anchor="middle" x="1229.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1061,-2279.5 1398,-2279.5 "/>
<text text-anchor="middle" x="1229.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1061,-2256.5 1398,-2256.5 "/>
<text text-anchor="middle" x="1229.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1061,-2233.5 1398,-2233.5 "/>
<text text-anchor="middle" x="1229.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1061,-2210.5 1398,-2210.5 "/>
<text text-anchor="middle" x="1229.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1061,-2187.5 1398,-2187.5 "/>
<text text-anchor="middle" x="1229.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1061,-2164.5 1398,-2164.5 "/>
<text text-anchor="middle" x="1229.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1061,-2141.5 1398,-2141.5 "/>
<text text-anchor="middle" x="1229.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1061,-2118.5 1398,-2118.5 "/>
<text text-anchor="middle" x="1229.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1061,-2095.5 1398,-2095.5 "/>
<text text-anchor="middle" x="1229.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1061,-2072.5 1398,-2072.5 "/>
<text text-anchor="middle" x="1229.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1061,-2049.5 1398,-2049.5 "/>
<text text-anchor="middle" x="1229.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="1061,-2026.5 1398,-2026.5 "/>
<text text-anchor="middle" x="1229.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="1061,-2003.5 1398,-2003.5 "/>
<text text-anchor="middle" x="1229.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1061,-1980.5 1398,-1980.5 "/>
<text text-anchor="middle" x="1229.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="1061,-1957.5 1398,-1957.5 "/>
<text text-anchor="middle" x="1229.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1061,-1934.5 1398,-1934.5 "/>
<text text-anchor="middle" x="1229.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1061,-1911.5 1398,-1911.5 "/>
<text text-anchor="middle" x="1229.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="1061,-1888.5 1398,-1888.5 "/>
<text text-anchor="middle" x="1229.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1061,-1865.5 1398,-1865.5 "/>
<text text-anchor="middle" x="1229.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1061,-1842.5 1398,-1842.5 "/>
<text text-anchor="middle" x="1229.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1061,-1819.5 1398,-1819.5 "/>
<text text-anchor="middle" x="1229.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1061,-1796.5 1398,-1796.5 "/>
<text text-anchor="middle" x="1229.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1061,-1773.5 1398,-1773.5 "/>
<text text-anchor="middle" x="1229.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1398,-1750.5 1398,-2302.5 "/>
<text text-anchor="middle" x="1408.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge25" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1962.3966,-2663.9285C1882.6981,-2616.3424 1649.9117,-2473.2308 1478.5,-2326 1461.1684,-2311.1134 1443.7566,-2295.2797 1426.5544,-2278.967"/>
<polygon fill="#000000" stroke="#000000" points="1428.8476,-2276.3174 1419.1957,-2271.9479 1424.0161,-2281.3827 1428.8476,-2276.3174"/>
<text text-anchor="middle" x="1964" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- vital_signs -->
<g id="node16" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1499,-1865.5C1499,-1865.5 1786,-1865.5 1786,-1865.5 1792,-1865.5 1798,-1871.5 1798,-1877.5 1798,-1877.5 1798,-2175.5 1798,-2175.5 1798,-2181.5 1792,-2187.5 1786,-2187.5 1786,-2187.5 1499,-2187.5 1499,-2187.5 1493,-2187.5 1487,-2181.5 1487,-2175.5 1487,-2175.5 1487,-1877.5 1487,-1877.5 1487,-1871.5 1493,-1865.5 1499,-1865.5"/>
<text text-anchor="middle" x="1533.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1580,-1865.5 1580,-2187.5 "/>
<text text-anchor="middle" x="1590.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1601,-1865.5 1601,-2187.5 "/>
<text text-anchor="middle" x="1689" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1601,-2164.5 1777,-2164.5 "/>
<text text-anchor="middle" x="1689" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1601,-2141.5 1777,-2141.5 "/>
<text text-anchor="middle" x="1689" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1601,-2118.5 1777,-2118.5 "/>
<text text-anchor="middle" x="1689" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1601,-2095.5 1777,-2095.5 "/>
<text text-anchor="middle" x="1689" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1601,-2072.5 1777,-2072.5 "/>
<text text-anchor="middle" x="1689" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1601,-2049.5 1777,-2049.5 "/>
<text text-anchor="middle" x="1689" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1601,-2026.5 1777,-2026.5 "/>
<text text-anchor="middle" x="1689" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1601,-2003.5 1777,-2003.5 "/>
<text text-anchor="middle" x="1689" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1601,-1980.5 1777,-1980.5 "/>
<text text-anchor="middle" x="1689" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1601,-1957.5 1777,-1957.5 "/>
<text text-anchor="middle" x="1689" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1601,-1934.5 1777,-1934.5 "/>
<text text-anchor="middle" x="1689" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1601,-1911.5 1777,-1911.5 "/>
<text text-anchor="middle" x="1689" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1601,-1888.5 1777,-1888.5 "/>
<text text-anchor="middle" x="1689" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1777,-1865.5 1777,-2187.5 "/>
<text text-anchor="middle" x="1787.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1579.1217,-1865.4798C1553.657,-1816.1826 1520.267,-1764.9986 1478.5,-1727 1406.8205,-1661.7877 1303.4862,-1621.1634 1225.8968,-1597.9514"/>
<polygon fill="#000000" stroke="#000000" points="1226.6683,-1594.5302 1216.0871,-1595.0681 1224.6942,-1601.2461 1226.6683,-1594.5302"/>
<text text-anchor="middle" x="1481.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge19" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2071.4727,-1468.3678C1939.7602,-1373.5966 1750.3227,-1237.2904 1647.8843,-1163.5827"/>
<polygon fill="#000000" stroke="#000000" points="1649.9174,-1160.7338 1639.7561,-1157.7343 1645.829,-1166.4158 1649.9174,-1160.7338"/>
<text text-anchor="middle" x="2016.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- follow_up -->
<g id="node18" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1147.5,-1209.5C1147.5,-1209.5 1479.5,-1209.5 1479.5,-1209.5 1485.5,-1209.5 1491.5,-1215.5 1491.5,-1221.5 1491.5,-1221.5 1491.5,-1404.5 1491.5,-1404.5 1491.5,-1410.5 1485.5,-1416.5 1479.5,-1416.5 1479.5,-1416.5 1147.5,-1416.5 1147.5,-1416.5 1141.5,-1416.5 1135.5,-1410.5 1135.5,-1404.5 1135.5,-1404.5 1135.5,-1221.5 1135.5,-1221.5 1135.5,-1215.5 1141.5,-1209.5 1147.5,-1209.5"/>
<text text-anchor="middle" x="1178" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1209.5 1220.5,-1416.5 "/>
<text text-anchor="middle" x="1231" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1241.5,-1209.5 1241.5,-1416.5 "/>
<text text-anchor="middle" x="1356" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1393.5 1470.5,-1393.5 "/>
<text text-anchor="middle" x="1356" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1370.5 1470.5,-1370.5 "/>
<text text-anchor="middle" x="1356" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1347.5 1470.5,-1347.5 "/>
<text text-anchor="middle" x="1356" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1324.5 1470.5,-1324.5 "/>
<text text-anchor="middle" x="1356" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1301.5 1470.5,-1301.5 "/>
<text text-anchor="middle" x="1356" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1278.5 1470.5,-1278.5 "/>
<text text-anchor="middle" x="1356" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1255.5 1470.5,-1255.5 "/>
<text text-anchor="middle" x="1356" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1241.5,-1232.5 1470.5,-1232.5 "/>
<text text-anchor="middle" x="1356" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1209.5 1470.5,-1416.5 "/>
<text text-anchor="middle" x="1481" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge20" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1418.1075,-1209.187C1431.6211,-1197.4875 1445.6027,-1186.1441 1459.5,-1176 1465.6507,-1171.5104 1472.1464,-1167.1051 1478.7956,-1162.8372"/>
<polygon fill="#000000" stroke="#000000" points="1480.6762,-1165.7891 1487.2855,-1157.5085 1476.955,-1159.8601 1480.6762,-1165.7891"/>
<text text-anchor="middle" x="1486.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node19" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2360,-2750.5C2360,-2750.5 2545,-2750.5 2545,-2750.5 2551,-2750.5 2557,-2756.5 2557,-2762.5 2557,-2762.5 2557,-2945.5 2557,-2945.5 2557,-2951.5 2551,-2957.5 2545,-2957.5 2545,-2957.5 2360,-2957.5 2360,-2957.5 2354,-2957.5 2348,-2951.5 2348,-2945.5 2348,-2945.5 2348,-2762.5 2348,-2762.5 2348,-2756.5 2354,-2750.5 2360,-2750.5"/>
<text text-anchor="middle" x="2367.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2387,-2750.5 2387,-2957.5 "/>
<text text-anchor="middle" x="2397.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2408,-2750.5 2408,-2957.5 "/>
<text text-anchor="middle" x="2472" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2408,-2934.5 2536,-2934.5 "/>
<text text-anchor="middle" x="2472" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2408,-2911.5 2536,-2911.5 "/>
<text text-anchor="middle" x="2472" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2408,-2888.5 2536,-2888.5 "/>
<text text-anchor="middle" x="2472" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2408,-2865.5 2536,-2865.5 "/>
<text text-anchor="middle" x="2472" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2408,-2842.5 2536,-2842.5 "/>
<text text-anchor="middle" x="2472" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2408,-2819.5 2536,-2819.5 "/>
<text text-anchor="middle" x="2472" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2408,-2796.5 2536,-2796.5 "/>
<text text-anchor="middle" x="2472" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2408,-2773.5 2536,-2773.5 "/>
<text text-anchor="middle" x="2472" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2536,-2750.5 2536,-2957.5 "/>
<text text-anchor="middle" x="2546.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge32" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2557.0666,-2759.1789C2593.7244,-2725.9376 2635.9369,-2687.6592 2676.6813,-2650.7122"/>
<polygon fill="#000000" stroke="#000000" points="2679.2136,-2653.1406 2684.2704,-2643.8304 2674.5114,-2647.9551 2679.2136,-2653.1406"/>
<text text-anchor="middle" x="2654" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge41" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2347.9537,-2814.7386C2246.2175,-2776.5324 2097.1812,-2720.5632 2028.1552,-2694.6411"/>
<polygon fill="#000000" stroke="#000000" points="2029.1588,-2691.2794 2018.5667,-2691.0402 2026.6978,-2697.8325 2029.1588,-2691.2794"/>
<text text-anchor="middle" x="2157" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge24" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2396.897,-2750.3733C2324.7395,-2627.9405 2186.2497,-2430.0347 2004.5,-2344 1898.7884,-2293.9594 1585.1026,-2374.1133 1478.5,-2326 1461.0096,-2318.106 1444.0774,-2308.578 1427.7785,-2297.8451"/>
<polygon fill="#000000" stroke="#000000" points="1429.5586,-2294.8239 1419.3133,-2292.1249 1425.6394,-2300.6238 1429.5586,-2294.8239"/>
<text text-anchor="middle" x="2401" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge13" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2557.0206,-2841.5124C2769.2004,-2814.7423 3230.5,-2748.699 3230.5,-2680.5 3230.5,-2680.5 3230.5,-2680.5 3230.5,-438 3230.5,-343.7917 1832.9966,-291.1994 1349.0904,-275.8124"/>
<polygon fill="#000000" stroke="#000000" points="1348.9849,-272.3074 1338.8791,-275.4889 1348.7632,-279.3039 1348.9849,-272.3074"/>
<text text-anchor="middle" x="3261" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1148.7114,-1750.326C1138.8225,-1691.9558 1129.6995,-1638.1063 1124.1227,-1605.1883"/>
<polygon fill="#000000" stroke="#000000" points="1127.5614,-1604.5318 1122.4401,-1595.257 1120.6597,-1605.7011 1127.5614,-1604.5318"/>
<text text-anchor="middle" x="1169.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge22" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1419.1775,-1759.1991C1489.953,-1658.397 1559.1699,-1538.5725 1595.5,-1417 1620.656,-1332.8197 1604.9874,-1229.9794 1590.7265,-1167.673"/>
<polygon fill="#000000" stroke="#000000" points="1594.066,-1166.5846 1588.3652,-1157.6542 1587.2527,-1168.1905 1594.066,-1166.5846"/>
<text text-anchor="middle" x="1615.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge2" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1419.0955,-2065.8333C1430.3572,-2056.0642 1437,-2042.9531 1437,-2026.5 1437,-2013.9031 1433.1061,-2003.2652 1426.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="1428.5485,-1991.9513 1419.0955,-1987.1667 1423.5016,-1996.802 1428.5485,-1991.9513"/>
<text text-anchor="middle" x="1453" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- lab_exam -->
<g id="node21" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M523.5,-2008.5C523.5,-2008.5 583.5,-2008.5 583.5,-2008.5 589.5,-2008.5 595.5,-2014.5 595.5,-2020.5 595.5,-2020.5 595.5,-2032.5 595.5,-2032.5 595.5,-2038.5 589.5,-2044.5 583.5,-2044.5 583.5,-2044.5 523.5,-2044.5 523.5,-2044.5 517.5,-2044.5 511.5,-2038.5 511.5,-2032.5 511.5,-2032.5 511.5,-2020.5 511.5,-2020.5 511.5,-2014.5 517.5,-2008.5 523.5,-2008.5"/>
<text text-anchor="middle" x="553.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M550.6481,-2008.2777C543.7172,-1956.9659 531.5392,-1809.6373 604.5,-1727 657.9493,-1666.4619 874.5552,-1616.8596 1008.9429,-1591.1268"/>
<polygon fill="#000000" stroke="#000000" points="1009.7029,-1594.5451 1018.8738,-1589.24 1008.3962,-1587.6681 1009.7029,-1594.5451"/>
<text text-anchor="middle" x="675.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- prior_therapy -->
<g id="node23" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2624.5,-1727.5C2624.5,-1727.5 3080.5,-1727.5 3080.5,-1727.5 3086.5,-1727.5 3092.5,-1733.5 3092.5,-1739.5 3092.5,-1739.5 3092.5,-2313.5 3092.5,-2313.5 3092.5,-2319.5 3086.5,-2325.5 3080.5,-2325.5 3080.5,-2325.5 2624.5,-2325.5 2624.5,-2325.5 2618.5,-2325.5 2612.5,-2319.5 2612.5,-2313.5 2612.5,-2313.5 2612.5,-1739.5 2612.5,-1739.5 2612.5,-1733.5 2618.5,-1727.5 2624.5,-1727.5"/>
<text text-anchor="middle" x="2670" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2727.5,-1727.5 2727.5,-2325.5 "/>
<text text-anchor="middle" x="2738" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2748.5,-1727.5 2748.5,-2325.5 "/>
<text text-anchor="middle" x="2910" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2302.5 3071.5,-2302.5 "/>
<text text-anchor="middle" x="2910" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2279.5 3071.5,-2279.5 "/>
<text text-anchor="middle" x="2910" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2256.5 3071.5,-2256.5 "/>
<text text-anchor="middle" x="2910" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2233.5 3071.5,-2233.5 "/>
<text text-anchor="middle" x="2910" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2210.5 3071.5,-2210.5 "/>
<text text-anchor="middle" x="2910" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2187.5 3071.5,-2187.5 "/>
<text text-anchor="middle" x="2910" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2164.5 3071.5,-2164.5 "/>
<text text-anchor="middle" x="2910" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2141.5 3071.5,-2141.5 "/>
<text text-anchor="middle" x="2910" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2118.5 3071.5,-2118.5 "/>
<text text-anchor="middle" x="2910" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2095.5 3071.5,-2095.5 "/>
<text text-anchor="middle" x="2910" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2072.5 3071.5,-2072.5 "/>
<text text-anchor="middle" x="2910" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2049.5 3071.5,-2049.5 "/>
<text text-anchor="middle" x="2910" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2026.5 3071.5,-2026.5 "/>
<text text-anchor="middle" x="2910" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2003.5 3071.5,-2003.5 "/>
<text text-anchor="middle" x="2910" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1980.5 3071.5,-1980.5 "/>
<text text-anchor="middle" x="2910" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1957.5 3071.5,-1957.5 "/>
<text text-anchor="middle" x="2910" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1934.5 3071.5,-1934.5 "/>
<text text-anchor="middle" x="2910" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1911.5 3071.5,-1911.5 "/>
<text text-anchor="middle" x="2910" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1888.5 3071.5,-1888.5 "/>
<text text-anchor="middle" x="2910" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1865.5 3071.5,-1865.5 "/>
<text text-anchor="middle" x="2910" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1842.5 3071.5,-1842.5 "/>
<text text-anchor="middle" x="2910" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1819.5 3071.5,-1819.5 "/>
<text text-anchor="middle" x="2910" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1796.5 3071.5,-1796.5 "/>
<text text-anchor="middle" x="2910" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1773.5 3071.5,-1773.5 "/>
<text text-anchor="middle" x="2910" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1750.5 3071.5,-1750.5 "/>
<text text-anchor="middle" x="2910" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="3071.5,-1727.5 3071.5,-2325.5 "/>
<text text-anchor="middle" x="3082" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge30" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2612.4806,-1733.6908C2609.5019,-1731.4182 2606.5081,-1729.187 2603.5,-1727 2546.3216,-1685.4298 2476.4466,-1653.0469 2411.8285,-1628.8809"/>
<polygon fill="#000000" stroke="#000000" points="2412.9283,-1625.556 2402.335,-1625.3749 2410.5032,-1632.1225 2412.9283,-1625.556"/>
<text text-anchor="middle" x="2625.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge3" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3092.7384,-2064.6912C3103.9387,-2055.0507 3110.5,-2042.3203 3110.5,-2026.5 3110.5,-2014.3876 3106.6539,-2004.0864 3099.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3102.219,-1993.0385 3092.7384,-1988.3088 3097.2002,-1997.9183 3102.219,-1993.0385"/>
<text text-anchor="middle" x="3126.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge16" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1027.229,-1278.3002C1052.8758,-1255.296 1089.3419,-1226.2723 1126.5,-1209 1227.3497,-1162.1217 1351.5251,-1137.3857 1443.7074,-1124.5783"/>
<polygon fill="#000000" stroke="#000000" points="1444.2169,-1128.0413 1453.6539,-1123.2253 1443.2734,-1121.1051 1444.2169,-1128.0413"/>
<text text-anchor="middle" x="1235.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge35" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1402.1414,-403.3975C1379.8864,-389.7335 1353.2382,-373.3723 1326.3878,-356.887"/>
<polygon fill="#000000" stroke="#000000" points="1328.0216,-353.7831 1317.6683,-351.5335 1324.359,-359.7484 1328.0216,-353.7831"/>
<text text-anchor="middle" x="1411" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge36" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1186.5,-190.4932C1186.5,-176.7786 1186.5,-162.5421 1186.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="1190.0001,-148.5183 1186.5,-138.5184 1183.0001,-148.5184 1190.0001,-148.5183"/>
<text text-anchor="middle" x="1227" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge40" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1132.6066,-524.3809C1159.8406,-513.3058 1193.5634,-500.434 1224.5,-491 1243.0759,-485.3354 1262.647,-479.9761 1282.2346,-474.9989"/>
<polygon fill="#000000" stroke="#000000" points="1283.3115,-478.3373 1292.1594,-472.5093 1281.6083,-471.5477 1283.3115,-478.3373"/>
<text text-anchor="middle" x="1273" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge18" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1288.0653,-977.4869C1307.7885,-990.4136 1327.7829,-1002.7921 1347.5,-1014 1377.9022,-1031.2818 1411.9669,-1047.413 1444.3087,-1061.3839"/>
<polygon fill="#000000" stroke="#000000" points="1443.2601,-1064.7421 1453.8308,-1065.4571 1446.0132,-1058.3062 1443.2601,-1064.7421"/>
<text text-anchor="middle" x="1434.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge28" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1078.5,-622.4901C1078.5,-606.8636 1078.5,-592.5861 1078.5,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1082.0001,-580.664 1078.5,-570.6641 1075.0001,-580.6641 1082.0001,-580.664"/>
<text text-anchor="middle" x="1109.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge5" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1288.2046,-845.2761C1299.376,-838.5862 1306,-829.4941 1306,-818 1306,-809.7386 1302.5781,-802.7181 1296.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="1298.3073,-793.9155 1288.2046,-790.7239 1294.1119,-799.519 1298.3073,-793.9155"/>
<text text-anchor="middle" x="1322" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
</g>
</svg>
</div>
