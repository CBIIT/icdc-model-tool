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
<svg width="3316pt" height="3150pt"
 viewBox="0.00 0.00 3316.00 3150.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 3146)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-3146 3312,-3146 3312,4 -4,4"/>
<!-- agent -->
<g id="node1" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M2495,-651C2495,-651 2721,-651 2721,-651 2727,-651 2733,-657 2733,-663 2733,-663 2733,-685 2733,-685 2733,-691 2727,-697 2721,-697 2721,-697 2495,-697 2495,-697 2489,-697 2483,-691 2483,-685 2483,-685 2483,-663 2483,-663 2483,-657 2489,-651 2495,-651"/>
<text text-anchor="middle" x="2511.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="2540,-651 2540,-697 "/>
<text text-anchor="middle" x="2550.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2561,-651 2561,-697 "/>
<text text-anchor="middle" x="2636.5" y="-681.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2561,-674 2712,-674 "/>
<text text-anchor="middle" x="2636.5" y="-658.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2712,-651 2712,-697 "/>
<text text-anchor="middle" x="2722.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm -->
<g id="node3" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2423.5,-472.5C2423.5,-472.5 2792.5,-472.5 2792.5,-472.5 2798.5,-472.5 2804.5,-478.5 2804.5,-484.5 2804.5,-484.5 2804.5,-552.5 2804.5,-552.5 2804.5,-558.5 2798.5,-564.5 2792.5,-564.5 2792.5,-564.5 2423.5,-564.5 2423.5,-564.5 2417.5,-564.5 2411.5,-558.5 2411.5,-552.5 2411.5,-552.5 2411.5,-484.5 2411.5,-484.5 2411.5,-478.5 2417.5,-472.5 2423.5,-472.5"/>
<text text-anchor="middle" x="2457.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2503.5,-472.5 2503.5,-564.5 "/>
<text text-anchor="middle" x="2514" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2524.5,-472.5 2524.5,-564.5 "/>
<text text-anchor="middle" x="2654" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2524.5,-541.5 2783.5,-541.5 "/>
<text text-anchor="middle" x="2654" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="2524.5,-518.5 2783.5,-518.5 "/>
<text text-anchor="middle" x="2654" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_id</text>
<polyline fill="none" stroke="#000000" points="2524.5,-495.5 2783.5,-495.5 "/>
<text text-anchor="middle" x="2654" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2783.5,-472.5 2783.5,-564.5 "/>
<text text-anchor="middle" x="2794" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge46" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2608,-650.7201C2608,-630.7494 2608,-601.1435 2608,-575.0066"/>
<polygon fill="#000000" stroke="#000000" points="2611.5001,-574.8121 2608,-564.8122 2604.5001,-574.8122 2611.5001,-574.8121"/>
<text text-anchor="middle" x="2656.5" y="-609.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- principal_investigator -->
<g id="node2" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M475.5,-484C475.5,-484 802.5,-484 802.5,-484 808.5,-484 814.5,-490 814.5,-496 814.5,-496 814.5,-541 814.5,-541 814.5,-547 808.5,-553 802.5,-553 802.5,-553 475.5,-553 475.5,-553 469.5,-553 463.5,-547 463.5,-541 463.5,-541 463.5,-496 463.5,-496 463.5,-490 469.5,-484 475.5,-484"/>
<text text-anchor="middle" x="550.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="637.5,-484 637.5,-553 "/>
<text text-anchor="middle" x="648" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="658.5,-484 658.5,-553 "/>
<text text-anchor="middle" x="726" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="658.5,-530 793.5,-530 "/>
<text text-anchor="middle" x="726" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="658.5,-507 793.5,-507 "/>
<text text-anchor="middle" x="726" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="793.5,-484 793.5,-553 "/>
<text text-anchor="middle" x="804" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node10" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1981,-190.5C1981,-190.5 2261,-190.5 2261,-190.5 2267,-190.5 2273,-196.5 2273,-202.5 2273,-202.5 2273,-385.5 2273,-385.5 2273,-391.5 2267,-397.5 2261,-397.5 2261,-397.5 1981,-397.5 1981,-397.5 1975,-397.5 1969,-391.5 1969,-385.5 1969,-385.5 1969,-202.5 1969,-202.5 1969,-196.5 1975,-190.5 1981,-190.5"/>
<text text-anchor="middle" x="1997" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2025,-190.5 2025,-397.5 "/>
<text text-anchor="middle" x="2035.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2046,-190.5 2046,-397.5 "/>
<text text-anchor="middle" x="2149" y="-382.3" font-family="Times,serif" font-size="14.00" fill="#000000">accession_id</text>
<polyline fill="none" stroke="#000000" points="2046,-374.5 2252,-374.5 "/>
<text text-anchor="middle" x="2149" y="-359.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2046,-351.5 2252,-351.5 "/>
<text text-anchor="middle" x="2149" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2046,-328.5 2252,-328.5 "/>
<text text-anchor="middle" x="2149" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2046,-305.5 2252,-305.5 "/>
<text text-anchor="middle" x="2149" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2046,-282.5 2252,-282.5 "/>
<text text-anchor="middle" x="2149" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2046,-259.5 2252,-259.5 "/>
<text text-anchor="middle" x="2149" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2046,-236.5 2252,-236.5 "/>
<text text-anchor="middle" x="2149" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2046,-213.5 2252,-213.5 "/>
<text text-anchor="middle" x="2149" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_disposition</text>
<polyline fill="none" stroke="#000000" points="2252,-190.5 2252,-397.5 "/>
<text text-anchor="middle" x="2262.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge9" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M671.296,-483.8522C695.4746,-460.3485 730.6871,-430.9324 768,-416 980.4163,-330.9919 1648.0052,-304.761 1958.8218,-297.0424"/>
<polygon fill="#000000" stroke="#000000" points="1958.9086,-300.5414 1968.8199,-296.7974 1958.7371,-293.5435 1958.9086,-300.5414"/>
<text text-anchor="middle" x="798.5" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge21" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2507.9786,-472.3916C2443.1113,-442.4887 2357.1271,-402.8512 2282.6862,-368.535"/>
<polygon fill="#000000" stroke="#000000" points="2283.7474,-365.1702 2273.2006,-364.1623 2280.8168,-371.5273 2283.7474,-365.1702"/>
<text text-anchor="middle" x="2449.5" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- canine_individual -->
<g id="node4" class="node">
<title>canine_individual</title>
<path fill="none" stroke="#000000" d="M882.5,-938C882.5,-938 1205.5,-938 1205.5,-938 1211.5,-938 1217.5,-944 1217.5,-950 1217.5,-950 1217.5,-962 1217.5,-962 1217.5,-968 1211.5,-974 1205.5,-974 1205.5,-974 882.5,-974 882.5,-974 876.5,-974 870.5,-968 870.5,-962 870.5,-962 870.5,-950 870.5,-950 870.5,-944 876.5,-938 882.5,-938"/>
<text text-anchor="middle" x="941.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual</text>
<polyline fill="none" stroke="#000000" points="1012.5,-938 1012.5,-974 "/>
<text text-anchor="middle" x="1023" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1033.5,-938 1033.5,-974 "/>
<text text-anchor="middle" x="1115" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual_id</text>
<polyline fill="none" stroke="#000000" points="1196.5,-938 1196.5,-974 "/>
<text text-anchor="middle" x="1207" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- program -->
<g id="node5" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1967,-.5C1967,-.5 2275,-.5 2275,-.5 2281,-.5 2287,-6.5 2287,-12.5 2287,-12.5 2287,-126.5 2287,-126.5 2287,-132.5 2281,-138.5 2275,-138.5 2275,-138.5 1967,-138.5 1967,-138.5 1961,-138.5 1955,-132.5 1955,-126.5 1955,-126.5 1955,-12.5 1955,-12.5 1955,-6.5 1961,-.5 1967,-.5"/>
<text text-anchor="middle" x="1994" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2033,-.5 2033,-138.5 "/>
<text text-anchor="middle" x="2043.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2054,-.5 2054,-138.5 "/>
<text text-anchor="middle" x="2160" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2054,-115.5 2266,-115.5 "/>
<text text-anchor="middle" x="2160" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2054,-92.5 2266,-92.5 "/>
<text text-anchor="middle" x="2160" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2054,-69.5 2266,-69.5 "/>
<text text-anchor="middle" x="2160" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2054,-46.5 2266,-46.5 "/>
<text text-anchor="middle" x="2160" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2054,-23.5 2266,-23.5 "/>
<text text-anchor="middle" x="2160" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2266,-.5 2266,-138.5 "/>
<text text-anchor="middle" x="2276.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node6" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1420.5,-2505.5C1420.5,-2505.5 1763.5,-2505.5 1763.5,-2505.5 1769.5,-2505.5 1775.5,-2511.5 1775.5,-2517.5 1775.5,-2517.5 1775.5,-2815.5 1775.5,-2815.5 1775.5,-2821.5 1769.5,-2827.5 1763.5,-2827.5 1763.5,-2827.5 1420.5,-2827.5 1420.5,-2827.5 1414.5,-2827.5 1408.5,-2821.5 1408.5,-2815.5 1408.5,-2815.5 1408.5,-2517.5 1408.5,-2517.5 1408.5,-2511.5 1414.5,-2505.5 1420.5,-2505.5"/>
<text text-anchor="middle" x="1450.5" y="-2662.8" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1492.5,-2505.5 1492.5,-2827.5 "/>
<text text-anchor="middle" x="1503" y="-2662.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1513.5,-2505.5 1513.5,-2827.5 "/>
<text text-anchor="middle" x="1634" y="-2812.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2804.5 1754.5,-2804.5 "/>
<text text-anchor="middle" x="1634" y="-2789.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2781.5 1754.5,-2781.5 "/>
<text text-anchor="middle" x="1634" y="-2766.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2758.5 1754.5,-2758.5 "/>
<text text-anchor="middle" x="1634" y="-2743.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2735.5 1754.5,-2735.5 "/>
<text text-anchor="middle" x="1634" y="-2720.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2712.5 1754.5,-2712.5 "/>
<text text-anchor="middle" x="1634" y="-2697.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2689.5 1754.5,-2689.5 "/>
<text text-anchor="middle" x="1634" y="-2674.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2666.5 1754.5,-2666.5 "/>
<text text-anchor="middle" x="1634" y="-2651.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2643.5 1754.5,-2643.5 "/>
<text text-anchor="middle" x="1634" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2620.5 1754.5,-2620.5 "/>
<text text-anchor="middle" x="1634" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2597.5 1754.5,-2597.5 "/>
<text text-anchor="middle" x="1634" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2574.5 1754.5,-2574.5 "/>
<text text-anchor="middle" x="1634" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2551.5 1754.5,-2551.5 "/>
<text text-anchor="middle" x="1634" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1513.5,-2528.5 1754.5,-2528.5 "/>
<text text-anchor="middle" x="1634" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1754.5,-2505.5 1754.5,-2827.5 "/>
<text text-anchor="middle" x="1765" y="-2662.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node16" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1797.5,-1203.5C1797.5,-1203.5 2016.5,-1203.5 2016.5,-1203.5 2022.5,-1203.5 2028.5,-1209.5 2028.5,-1215.5 2028.5,-1215.5 2028.5,-1283.5 2028.5,-1283.5 2028.5,-1289.5 2022.5,-1295.5 2016.5,-1295.5 2016.5,-1295.5 1797.5,-1295.5 1797.5,-1295.5 1791.5,-1295.5 1785.5,-1289.5 1785.5,-1283.5 1785.5,-1283.5 1785.5,-1215.5 1785.5,-1215.5 1785.5,-1209.5 1791.5,-1203.5 1797.5,-1203.5"/>
<text text-anchor="middle" x="1810" y="-1245.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1834.5,-1203.5 1834.5,-1295.5 "/>
<text text-anchor="middle" x="1845" y="-1245.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1855.5,-1203.5 1855.5,-1295.5 "/>
<text text-anchor="middle" x="1931.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1855.5,-1272.5 2007.5,-1272.5 "/>
<text text-anchor="middle" x="1931.5" y="-1257.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1855.5,-1249.5 2007.5,-1249.5 "/>
<text text-anchor="middle" x="1931.5" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1855.5,-1226.5 2007.5,-1226.5 "/>
<text text-anchor="middle" x="1931.5" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2007.5,-1203.5 2007.5,-1295.5 "/>
<text text-anchor="middle" x="2018" y="-1245.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge36" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1408.3312,-2539.3251C1394.406,-2523.2237 1382.2149,-2505.7512 1373,-2487 1309.5108,-2357.8065 1354,-1983.4508 1354,-1839.5 1354,-1839.5 1354,-1839.5 1354,-1451 1354,-1361.7356 1611.5818,-1300.4583 1775.1524,-1270.5448"/>
<polygon fill="#000000" stroke="#000000" points="1776.0834,-1273.9332 1785.2997,-1268.7072 1774.836,-1267.0453 1776.0834,-1273.9332"/>
<text text-anchor="middle" x="1381" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- off_study -->
<g id="node7" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1247.5,-852.5C1247.5,-852.5 1662.5,-852.5 1662.5,-852.5 1668.5,-852.5 1674.5,-858.5 1674.5,-864.5 1674.5,-864.5 1674.5,-1047.5 1674.5,-1047.5 1674.5,-1053.5 1668.5,-1059.5 1662.5,-1059.5 1662.5,-1059.5 1247.5,-1059.5 1247.5,-1059.5 1241.5,-1059.5 1235.5,-1053.5 1235.5,-1047.5 1235.5,-1047.5 1235.5,-864.5 1235.5,-864.5 1235.5,-858.5 1241.5,-852.5 1247.5,-852.5"/>
<text text-anchor="middle" x="1277" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1318.5,-852.5 1318.5,-1059.5 "/>
<text text-anchor="middle" x="1329" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1339.5,-852.5 1339.5,-1059.5 "/>
<text text-anchor="middle" x="1496.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1339.5,-1036.5 1653.5,-1036.5 "/>
<text text-anchor="middle" x="1496.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1339.5,-1013.5 1653.5,-1013.5 "/>
<text text-anchor="middle" x="1496.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1339.5,-990.5 1653.5,-990.5 "/>
<text text-anchor="middle" x="1496.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1339.5,-967.5 1653.5,-967.5 "/>
<text text-anchor="middle" x="1496.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1339.5,-944.5 1653.5,-944.5 "/>
<text text-anchor="middle" x="1496.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1339.5,-921.5 1653.5,-921.5 "/>
<text text-anchor="middle" x="1496.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1339.5,-898.5 1653.5,-898.5 "/>
<text text-anchor="middle" x="1496.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1339.5,-875.5 1653.5,-875.5 "/>
<text text-anchor="middle" x="1496.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1653.5,-852.5 1653.5,-1059.5 "/>
<text text-anchor="middle" x="1664" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration -->
<g id="node8" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M2737.5,-1934.5C2737.5,-1934.5 3206.5,-1934.5 3206.5,-1934.5 3212.5,-1934.5 3218.5,-1940.5 3218.5,-1946.5 3218.5,-1946.5 3218.5,-2405.5 3218.5,-2405.5 3218.5,-2411.5 3212.5,-2417.5 3206.5,-2417.5 3206.5,-2417.5 2737.5,-2417.5 2737.5,-2417.5 2731.5,-2417.5 2725.5,-2411.5 2725.5,-2405.5 2725.5,-2405.5 2725.5,-1946.5 2725.5,-1946.5 2725.5,-1940.5 2731.5,-1934.5 2737.5,-1934.5"/>
<text text-anchor="middle" x="2810.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2895.5,-1934.5 2895.5,-2417.5 "/>
<text text-anchor="middle" x="2906" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2916.5,-1934.5 2916.5,-2417.5 "/>
<text text-anchor="middle" x="3057" y="-2402.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2394.5 3197.5,-2394.5 "/>
<text text-anchor="middle" x="3057" y="-2379.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2371.5 3197.5,-2371.5 "/>
<text text-anchor="middle" x="3057" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2348.5 3197.5,-2348.5 "/>
<text text-anchor="middle" x="3057" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2325.5 3197.5,-2325.5 "/>
<text text-anchor="middle" x="3057" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2302.5 3197.5,-2302.5 "/>
<text text-anchor="middle" x="3057" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2279.5 3197.5,-2279.5 "/>
<text text-anchor="middle" x="3057" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2256.5 3197.5,-2256.5 "/>
<text text-anchor="middle" x="3057" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2233.5 3197.5,-2233.5 "/>
<text text-anchor="middle" x="3057" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2210.5 3197.5,-2210.5 "/>
<text text-anchor="middle" x="3057" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2187.5 3197.5,-2187.5 "/>
<text text-anchor="middle" x="3057" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2164.5 3197.5,-2164.5 "/>
<text text-anchor="middle" x="3057" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2141.5 3197.5,-2141.5 "/>
<text text-anchor="middle" x="3057" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2118.5 3197.5,-2118.5 "/>
<text text-anchor="middle" x="3057" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2095.5 3197.5,-2095.5 "/>
<text text-anchor="middle" x="3057" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2072.5 3197.5,-2072.5 "/>
<text text-anchor="middle" x="3057" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2049.5 3197.5,-2049.5 "/>
<text text-anchor="middle" x="3057" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2026.5 3197.5,-2026.5 "/>
<text text-anchor="middle" x="3057" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2916.5,-2003.5 3197.5,-2003.5 "/>
<text text-anchor="middle" x="3057" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2916.5,-1980.5 3197.5,-1980.5 "/>
<text text-anchor="middle" x="3057" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2916.5,-1957.5 3197.5,-1957.5 "/>
<text text-anchor="middle" x="3057" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="3197.5,-1934.5 3197.5,-2417.5 "/>
<text text-anchor="middle" x="3208" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge44" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2956.9616,-1934.2303C2953.5955,-1862.1204 2951,-1782.8864 2951,-1710 2951,-1710 2951,-1710 2951,-956 2951,-851.6312 2974.3741,-799.1913 2899,-727 2876.2063,-705.1688 2808.2081,-692.0832 2743.6727,-684.3778"/>
<polygon fill="#000000" stroke="#000000" points="2743.6876,-680.8564 2733.3523,-683.1868 2742.8851,-687.8102 2743.6876,-680.8564"/>
<text text-anchor="middle" x="2982" y="-1317.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- visit -->
<g id="node25" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1580.5,-1687C1580.5,-1687 1755.5,-1687 1755.5,-1687 1761.5,-1687 1767.5,-1693 1767.5,-1699 1767.5,-1699 1767.5,-1721 1767.5,-1721 1767.5,-1727 1761.5,-1733 1755.5,-1733 1755.5,-1733 1580.5,-1733 1580.5,-1733 1574.5,-1733 1568.5,-1727 1568.5,-1721 1568.5,-1721 1568.5,-1699 1568.5,-1699 1568.5,-1693 1574.5,-1687 1580.5,-1687"/>
<text text-anchor="middle" x="1592" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1615.5,-1687 1615.5,-1733 "/>
<text text-anchor="middle" x="1626" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1636.5,-1687 1636.5,-1733 "/>
<text text-anchor="middle" x="1691.5" y="-1717.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1636.5,-1710 1746.5,-1710 "/>
<text text-anchor="middle" x="1691.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1746.5,-1687 1746.5,-1733 "/>
<text text-anchor="middle" x="1757" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge29" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2859.5656,-1934.4859C2830.8238,-1894.5269 2796.1332,-1857.7826 2755,-1832 2673.326,-1780.8062 2037.4484,-1734.0757 1777.8373,-1716.9312"/>
<polygon fill="#000000" stroke="#000000" points="1777.8442,-1713.4242 1767.6359,-1716.26 1777.3845,-1720.4091 1777.8442,-1713.4242"/>
<text text-anchor="middle" x="2800" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- image_collection -->
<g id="node9" class="node">
<title>image_collection</title>
<path fill="none" stroke="#000000" d="M1611.5,-461C1611.5,-461 1950.5,-461 1950.5,-461 1956.5,-461 1962.5,-467 1962.5,-473 1962.5,-473 1962.5,-564 1962.5,-564 1962.5,-570 1956.5,-576 1950.5,-576 1950.5,-576 1611.5,-576 1611.5,-576 1605.5,-576 1599.5,-570 1599.5,-564 1599.5,-564 1599.5,-473 1599.5,-473 1599.5,-467 1605.5,-461 1611.5,-461"/>
<text text-anchor="middle" x="1668" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection</text>
<polyline fill="none" stroke="#000000" points="1736.5,-461 1736.5,-576 "/>
<text text-anchor="middle" x="1747" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1757.5,-461 1757.5,-576 "/>
<text text-anchor="middle" x="1849.5" y="-560.8" font-family="Times,serif" font-size="14.00" fill="#000000">collection_access</text>
<polyline fill="none" stroke="#000000" points="1757.5,-553 1941.5,-553 "/>
<text text-anchor="middle" x="1849.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_name</text>
<polyline fill="none" stroke="#000000" points="1757.5,-530 1941.5,-530 "/>
<text text-anchor="middle" x="1849.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_url</text>
<polyline fill="none" stroke="#000000" points="1757.5,-507 1941.5,-507 "/>
<text text-anchor="middle" x="1849.5" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_type_included</text>
<polyline fill="none" stroke="#000000" points="1757.5,-484 1941.5,-484 "/>
<text text-anchor="middle" x="1849.5" y="-468.8" font-family="Times,serif" font-size="14.00" fill="#000000">repository_name</text>
<polyline fill="none" stroke="#000000" points="1941.5,-461 1941.5,-576 "/>
<text text-anchor="middle" x="1952" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- image_collection&#45;&gt;study -->
<g id="edge13" class="edge">
<title>image_collection&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1858.7741,-460.8037C1879.4389,-445.9037 1901.8863,-430.0978 1923,-416 1935.0045,-407.9845 1947.5176,-399.8285 1960.163,-391.7275"/>
<polygon fill="#000000" stroke="#000000" points="1962.387,-394.4603 1968.934,-386.1304 1958.6213,-388.5594 1962.387,-394.4603"/>
<text text-anchor="middle" x="1953.5" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge24" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2121,-190.2929C2121,-176.377 2121,-162.285 2121,-148.8791"/>
<polygon fill="#000000" stroke="#000000" points="2124.5001,-148.7754 2121,-138.7754 2117.5001,-148.7755 2124.5001,-148.7754"/>
<text text-anchor="middle" x="2161.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node11" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1947,-1347.5C1947,-1347.5 2279,-1347.5 2279,-1347.5 2285,-1347.5 2291,-1353.5 2291,-1359.5 2291,-1359.5 2291,-1542.5 2291,-1542.5 2291,-1548.5 2285,-1554.5 2279,-1554.5 2279,-1554.5 1947,-1554.5 1947,-1554.5 1941,-1554.5 1935,-1548.5 1935,-1542.5 1935,-1542.5 1935,-1359.5 1935,-1359.5 1935,-1353.5 1941,-1347.5 1947,-1347.5"/>
<text text-anchor="middle" x="1977.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2020,-1347.5 2020,-1554.5 "/>
<text text-anchor="middle" x="2030.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2041,-1347.5 2041,-1554.5 "/>
<text text-anchor="middle" x="2155.5" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2041,-1531.5 2270,-1531.5 "/>
<text text-anchor="middle" x="2155.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2041,-1508.5 2270,-1508.5 "/>
<text text-anchor="middle" x="2155.5" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2041,-1485.5 2270,-1485.5 "/>
<text text-anchor="middle" x="2155.5" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2041,-1462.5 2270,-1462.5 "/>
<text text-anchor="middle" x="2155.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2041,-1439.5 2270,-1439.5 "/>
<text text-anchor="middle" x="2155.5" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2041,-1416.5 2270,-1416.5 "/>
<text text-anchor="middle" x="2155.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2041,-1393.5 2270,-1393.5 "/>
<text text-anchor="middle" x="2155.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2041,-1370.5 2270,-1370.5 "/>
<text text-anchor="middle" x="2155.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2270,-1347.5 2270,-1554.5 "/>
<text text-anchor="middle" x="2280.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge39" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2006.9828,-1347.2987C1991.2002,-1331.8608 1975.5121,-1316.5154 1961.4025,-1302.7141"/>
<polygon fill="#000000" stroke="#000000" points="1963.7719,-1300.1358 1954.1758,-1295.6452 1958.8771,-1305.1399 1963.7719,-1300.1358"/>
<text text-anchor="middle" x="2013" y="-1317.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node12" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M450,-1877C450,-1877 906,-1877 906,-1877 912,-1877 918,-1883 918,-1889 918,-1889 918,-2463 918,-2463 918,-2469 912,-2475 906,-2475 906,-2475 450,-2475 450,-2475 444,-2475 438,-2469 438,-2463 438,-2463 438,-1889 438,-1889 438,-1883 444,-1877 450,-1877"/>
<text text-anchor="middle" x="495.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="553,-1877 553,-2475 "/>
<text text-anchor="middle" x="563.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="574,-1877 574,-2475 "/>
<text text-anchor="middle" x="735.5" y="-2459.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="574,-2452 897,-2452 "/>
<text text-anchor="middle" x="735.5" y="-2436.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="574,-2429 897,-2429 "/>
<text text-anchor="middle" x="735.5" y="-2413.8" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="574,-2406 897,-2406 "/>
<text text-anchor="middle" x="735.5" y="-2390.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="574,-2383 897,-2383 "/>
<text text-anchor="middle" x="735.5" y="-2367.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="574,-2360 897,-2360 "/>
<text text-anchor="middle" x="735.5" y="-2344.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="574,-2337 897,-2337 "/>
<text text-anchor="middle" x="735.5" y="-2321.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="574,-2314 897,-2314 "/>
<text text-anchor="middle" x="735.5" y="-2298.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="574,-2291 897,-2291 "/>
<text text-anchor="middle" x="735.5" y="-2275.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="574,-2268 897,-2268 "/>
<text text-anchor="middle" x="735.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="574,-2245 897,-2245 "/>
<text text-anchor="middle" x="735.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="574,-2222 897,-2222 "/>
<text text-anchor="middle" x="735.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="574,-2199 897,-2199 "/>
<text text-anchor="middle" x="735.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="574,-2176 897,-2176 "/>
<text text-anchor="middle" x="735.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="574,-2153 897,-2153 "/>
<text text-anchor="middle" x="735.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="574,-2130 897,-2130 "/>
<text text-anchor="middle" x="735.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="574,-2107 897,-2107 "/>
<text text-anchor="middle" x="735.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="574,-2084 897,-2084 "/>
<text text-anchor="middle" x="735.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="574,-2061 897,-2061 "/>
<text text-anchor="middle" x="735.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="574,-2038 897,-2038 "/>
<text text-anchor="middle" x="735.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="574,-2015 897,-2015 "/>
<text text-anchor="middle" x="735.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="574,-1992 897,-1992 "/>
<text text-anchor="middle" x="735.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="574,-1969 897,-1969 "/>
<text text-anchor="middle" x="735.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="574,-1946 897,-1946 "/>
<text text-anchor="middle" x="735.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="574,-1923 897,-1923 "/>
<text text-anchor="middle" x="735.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="574,-1900 897,-1900 "/>
<text text-anchor="middle" x="735.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="897,-1877 897,-2475 "/>
<text text-anchor="middle" x="907.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge14" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M918.2384,-2215.6057C929.4387,-2205.6082 936,-2192.4063 936,-2176 936,-2163.3108 932.075,-2152.5384 925.1144,-2143.6829"/>
<polygon fill="#000000" stroke="#000000" points="927.6465,-2141.2665 918.2384,-2136.3943 922.5547,-2146.0701 927.6465,-2141.2665"/>
<text text-anchor="middle" x="952" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node21" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M711.5,-1606.5C711.5,-1606.5 1060.5,-1606.5 1060.5,-1606.5 1066.5,-1606.5 1072.5,-1612.5 1072.5,-1618.5 1072.5,-1618.5 1072.5,-1801.5 1072.5,-1801.5 1072.5,-1807.5 1066.5,-1813.5 1060.5,-1813.5 1060.5,-1813.5 711.5,-1813.5 711.5,-1813.5 705.5,-1813.5 699.5,-1807.5 699.5,-1801.5 699.5,-1801.5 699.5,-1618.5 699.5,-1618.5 699.5,-1612.5 705.5,-1606.5 711.5,-1606.5"/>
<text text-anchor="middle" x="747" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="794.5,-1606.5 794.5,-1813.5 "/>
<text text-anchor="middle" x="805" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="815.5,-1606.5 815.5,-1813.5 "/>
<text text-anchor="middle" x="933.5" y="-1798.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="815.5,-1790.5 1051.5,-1790.5 "/>
<text text-anchor="middle" x="933.5" y="-1775.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="815.5,-1767.5 1051.5,-1767.5 "/>
<text text-anchor="middle" x="933.5" y="-1752.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="815.5,-1744.5 1051.5,-1744.5 "/>
<text text-anchor="middle" x="933.5" y="-1729.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="815.5,-1721.5 1051.5,-1721.5 "/>
<text text-anchor="middle" x="933.5" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="815.5,-1698.5 1051.5,-1698.5 "/>
<text text-anchor="middle" x="933.5" y="-1683.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="815.5,-1675.5 1051.5,-1675.5 "/>
<text text-anchor="middle" x="933.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="815.5,-1652.5 1051.5,-1652.5 "/>
<text text-anchor="middle" x="933.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="815.5,-1629.5 1051.5,-1629.5 "/>
<text text-anchor="middle" x="933.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1051.5,-1606.5 1051.5,-1813.5 "/>
<text text-anchor="middle" x="1062" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge8" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M811.4947,-1876.9205C819.8388,-1858.2265 827.9067,-1840.1513 835.4582,-1823.233"/>
<polygon fill="#000000" stroke="#000000" points="838.7189,-1824.5147 839.5988,-1813.9565 832.3268,-1821.6615 838.7189,-1824.5147"/>
<text text-anchor="middle" x="881" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- demographic -->
<g id="node13" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2321,-1370.5C2321,-1370.5 2657,-1370.5 2657,-1370.5 2663,-1370.5 2669,-1376.5 2669,-1382.5 2669,-1382.5 2669,-1519.5 2669,-1519.5 2669,-1525.5 2663,-1531.5 2657,-1531.5 2657,-1531.5 2321,-1531.5 2321,-1531.5 2315,-1531.5 2309,-1525.5 2309,-1519.5 2309,-1519.5 2309,-1382.5 2309,-1382.5 2309,-1376.5 2315,-1370.5 2321,-1370.5"/>
<text text-anchor="middle" x="2364" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2419,-1370.5 2419,-1531.5 "/>
<text text-anchor="middle" x="2429.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2440,-1370.5 2440,-1531.5 "/>
<text text-anchor="middle" x="2544" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2440,-1508.5 2648,-1508.5 "/>
<text text-anchor="middle" x="2544" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2440,-1485.5 2648,-1485.5 "/>
<text text-anchor="middle" x="2544" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2440,-1462.5 2648,-1462.5 "/>
<text text-anchor="middle" x="2544" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2440,-1439.5 2648,-1439.5 "/>
<text text-anchor="middle" x="2544" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2440,-1416.5 2648,-1416.5 "/>
<text text-anchor="middle" x="2544" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2440,-1393.5 2648,-1393.5 "/>
<text text-anchor="middle" x="2544" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2648,-1370.5 2648,-1531.5 "/>
<text text-anchor="middle" x="2658.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge37" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2352.4256,-1370.4822C2335.0952,-1361.8716 2317.3505,-1353.7918 2300,-1347 2215.4094,-1313.887 2116.0811,-1289.3604 2038.4473,-1273.1889"/>
<polygon fill="#000000" stroke="#000000" points="2039.1089,-1269.7517 2028.608,-1271.1598 2037.695,-1276.6075 2039.1089,-1269.7517"/>
<text text-anchor="middle" x="2276" y="-1317.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node14" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1847,-3020C1847,-3020 1883,-3020 1883,-3020 1889,-3020 1895,-3026 1895,-3032 1895,-3032 1895,-3044 1895,-3044 1895,-3050 1889,-3056 1883,-3056 1883,-3056 1847,-3056 1847,-3056 1841,-3056 1835,-3050 1835,-3044 1835,-3044 1835,-3032 1835,-3032 1835,-3026 1841,-3020 1847,-3020"/>
<text text-anchor="middle" x="1865" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node23" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M2021,-2846.5C2021,-2846.5 2053,-2846.5 2053,-2846.5 2059,-2846.5 2065,-2852.5 2065,-2858.5 2065,-2858.5 2065,-2870.5 2065,-2870.5 2065,-2876.5 2059,-2882.5 2053,-2882.5 2053,-2882.5 2021,-2882.5 2021,-2882.5 2015,-2882.5 2009,-2876.5 2009,-2870.5 2009,-2870.5 2009,-2858.5 2009,-2858.5 2009,-2852.5 2015,-2846.5 2021,-2846.5"/>
<text text-anchor="middle" x="2037" y="-2860.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge2" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1858.6309,-3019.6351C1849.9293,-2990.8561 1838.3483,-2934.9229 1866,-2901 1882.4592,-2880.808 1953.71,-2871.2847 1998.8861,-2867.2008"/>
<polygon fill="#000000" stroke="#000000" points="1999.2643,-2870.6813 2008.9302,-2866.3429 1998.6686,-2863.7067 1999.2643,-2870.6813"/>
<text text-anchor="middle" x="1896.5" y="-2904.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- disease_extent -->
<g id="node15" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2341,-2026.5C2341,-2026.5 2657,-2026.5 2657,-2026.5 2663,-2026.5 2669,-2032.5 2669,-2038.5 2669,-2038.5 2669,-2313.5 2669,-2313.5 2669,-2319.5 2663,-2325.5 2657,-2325.5 2657,-2325.5 2341,-2325.5 2341,-2325.5 2335,-2325.5 2329,-2319.5 2329,-2313.5 2329,-2313.5 2329,-2038.5 2329,-2038.5 2329,-2032.5 2335,-2026.5 2341,-2026.5"/>
<text text-anchor="middle" x="2390.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2452,-2026.5 2452,-2325.5 "/>
<text text-anchor="middle" x="2462.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2473,-2026.5 2473,-2325.5 "/>
<text text-anchor="middle" x="2560.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2473,-2302.5 2648,-2302.5 "/>
<text text-anchor="middle" x="2560.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2473,-2279.5 2648,-2279.5 "/>
<text text-anchor="middle" x="2560.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2473,-2256.5 2648,-2256.5 "/>
<text text-anchor="middle" x="2560.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2473,-2233.5 2648,-2233.5 "/>
<text text-anchor="middle" x="2560.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2473,-2210.5 2648,-2210.5 "/>
<text text-anchor="middle" x="2560.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2473,-2187.5 2648,-2187.5 "/>
<text text-anchor="middle" x="2560.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2473,-2164.5 2648,-2164.5 "/>
<text text-anchor="middle" x="2560.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2473,-2141.5 2648,-2141.5 "/>
<text text-anchor="middle" x="2560.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2473,-2118.5 2648,-2118.5 "/>
<text text-anchor="middle" x="2560.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2473,-2095.5 2648,-2095.5 "/>
<text text-anchor="middle" x="2560.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2473,-2072.5 2648,-2072.5 "/>
<text text-anchor="middle" x="2560.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2473,-2049.5 2648,-2049.5 "/>
<text text-anchor="middle" x="2560.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2648,-2026.5 2648,-2325.5 "/>
<text text-anchor="middle" x="2658.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge25" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2443.0624,-2026.2971C2414.2729,-1968.0136 2373.5443,-1905.6052 2319,-1865 2234.0516,-1801.7608 1939.9428,-1749.9846 1777.6578,-1725.4163"/>
<polygon fill="#000000" stroke="#000000" points="1778.0504,-1721.9361 1767.6409,-1723.9091 1777.0088,-1728.8582 1778.0504,-1721.9361"/>
<text text-anchor="middle" x="2311" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge45" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2028.6235,-1244.7142C2256.4184,-1234.4945 2728.9322,-1206.8669 2778,-1152 2930.3623,-981.6306 2858.9795,-835.3563 2742,-639 2726.7449,-613.3936 2704.2866,-590.1577 2682.0988,-571.0742"/>
<polygon fill="#000000" stroke="#000000" points="2684.1821,-568.2532 2674.2743,-564.5003 2679.6792,-573.6127 2684.1821,-568.2532"/>
<text text-anchor="middle" x="2846.5" y="-730.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- case&#45;&gt;canine_individual -->
<g id="edge49" class="edge">
<title>case&#45;&gt;canine_individual</title>
<path fill="none" stroke="#000000" d="M1785.2894,-1241.8263C1616.326,-1229.5332 1320.7663,-1201.6152 1226,-1152 1149.3787,-1111.8847 1087.9115,-1026.3934 1060.1053,-982.7864"/>
<polygon fill="#000000" stroke="#000000" points="1062.9668,-980.7614 1054.6894,-974.1482 1057.0361,-984.4799 1062.9668,-980.7614"/>
<text text-anchor="middle" x="1358" y="-1173.8" font-family="Times,serif" font-size="14.00" fill="#000000">represents</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge3" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1785.3478,-1204.3947C1751.1721,-1189.6555 1714.7064,-1171.8917 1683,-1152 1643.8442,-1127.4348 1604.4962,-1096.4123 1569.7741,-1066.339"/>
<polygon fill="#000000" stroke="#000000" points="1571.8132,-1063.4731 1561.9774,-1059.5351 1567.2107,-1068.7473 1571.8132,-1063.4731"/>
<text text-anchor="middle" x="1796.5" y="-1173.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge22" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1785.0468,-1246.7275C1523.1108,-1239.565 925.197,-1216.2846 861,-1152 799.1861,-1090.1018 843,-1043.4777 843,-956 843,-956 843,-956 843,-518.5 843,-406.4758 1614.576,-332.9994 1958.6909,-305.8003"/>
<polygon fill="#000000" stroke="#000000" points="1959.0513,-309.2828 1968.7459,-305.0091 1958.5021,-302.3044 1959.0513,-309.2828"/>
<text text-anchor="middle" x="883.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node22" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1704.5,-864C1704.5,-864 2151.5,-864 2151.5,-864 2157.5,-864 2163.5,-870 2163.5,-876 2163.5,-876 2163.5,-1036 2163.5,-1036 2163.5,-1042 2157.5,-1048 2151.5,-1048 2151.5,-1048 1704.5,-1048 1704.5,-1048 1698.5,-1048 1692.5,-1042 1692.5,-1036 1692.5,-1036 1692.5,-876 1692.5,-876 1692.5,-870 1698.5,-864 1704.5,-864"/>
<text text-anchor="middle" x="1750" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1807.5,-864 1807.5,-1048 "/>
<text text-anchor="middle" x="1818" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1828.5,-864 1828.5,-1048 "/>
<text text-anchor="middle" x="1985.5" y="-1032.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1828.5,-1025 2142.5,-1025 "/>
<text text-anchor="middle" x="1985.5" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1828.5,-1002 2142.5,-1002 "/>
<text text-anchor="middle" x="1985.5" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1828.5,-979 2142.5,-979 "/>
<text text-anchor="middle" x="1985.5" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1828.5,-956 2142.5,-956 "/>
<text text-anchor="middle" x="1985.5" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1828.5,-933 2142.5,-933 "/>
<text text-anchor="middle" x="1985.5" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1828.5,-910 2142.5,-910 "/>
<text text-anchor="middle" x="1985.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1828.5,-887 2142.5,-887 "/>
<text text-anchor="middle" x="1985.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2142.5,-864 2142.5,-1048 "/>
<text text-anchor="middle" x="2153" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge42" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1910.3044,-1203.3178C1913.0815,-1164.5035 1917.1527,-1107.604 1920.6901,-1058.1644"/>
<polygon fill="#000000" stroke="#000000" points="1924.1903,-1058.2851 1921.413,-1048.0607 1917.2082,-1057.7854 1924.1903,-1058.2851"/>
<text text-anchor="middle" x="1984" y="-1173.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- adverse_event -->
<g id="node29" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M2311.5,-760.5C2311.5,-760.5 2706.5,-760.5 2706.5,-760.5 2712.5,-760.5 2718.5,-766.5 2718.5,-772.5 2718.5,-772.5 2718.5,-1139.5 2718.5,-1139.5 2718.5,-1145.5 2712.5,-1151.5 2706.5,-1151.5 2706.5,-1151.5 2311.5,-1151.5 2311.5,-1151.5 2305.5,-1151.5 2299.5,-1145.5 2299.5,-1139.5 2299.5,-1139.5 2299.5,-772.5 2299.5,-772.5 2299.5,-766.5 2305.5,-760.5 2311.5,-760.5"/>
<text text-anchor="middle" x="2359.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="2419.5,-760.5 2419.5,-1151.5 "/>
<text text-anchor="middle" x="2430" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2440.5,-760.5 2440.5,-1151.5 "/>
<text text-anchor="middle" x="2569" y="-1136.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2440.5,-1128.5 2697.5,-1128.5 "/>
<text text-anchor="middle" x="2569" y="-1113.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2440.5,-1105.5 2697.5,-1105.5 "/>
<text text-anchor="middle" x="2569" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="2440.5,-1082.5 2697.5,-1082.5 "/>
<text text-anchor="middle" x="2569" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="2440.5,-1059.5 2697.5,-1059.5 "/>
<text text-anchor="middle" x="2569" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="2440.5,-1036.5 2697.5,-1036.5 "/>
<text text-anchor="middle" x="2569" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="2440.5,-1013.5 2697.5,-1013.5 "/>
<text text-anchor="middle" x="2569" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="2440.5,-990.5 2697.5,-990.5 "/>
<text text-anchor="middle" x="2569" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="2440.5,-967.5 2697.5,-967.5 "/>
<text text-anchor="middle" x="2569" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="2440.5,-944.5 2697.5,-944.5 "/>
<text text-anchor="middle" x="2569" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2440.5,-921.5 2697.5,-921.5 "/>
<text text-anchor="middle" x="2569" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2440.5,-898.5 2697.5,-898.5 "/>
<text text-anchor="middle" x="2569" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="2440.5,-875.5 2697.5,-875.5 "/>
<text text-anchor="middle" x="2569" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2440.5,-852.5 2697.5,-852.5 "/>
<text text-anchor="middle" x="2569" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="2440.5,-829.5 2697.5,-829.5 "/>
<text text-anchor="middle" x="2569" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2440.5,-806.5 2697.5,-806.5 "/>
<text text-anchor="middle" x="2569" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2440.5,-783.5 2697.5,-783.5 "/>
<text text-anchor="middle" x="2569" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2697.5,-760.5 2697.5,-1151.5 "/>
<text text-anchor="middle" x="2708" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge47" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2028.7229,-1238.9439C2128.3825,-1228.6533 2260.2626,-1210.771 2307,-1185 2321.0324,-1177.2625 2334.5673,-1168.1597 2347.5264,-1158.1218"/>
<polygon fill="#000000" stroke="#000000" points="2349.8788,-1160.7227 2355.5202,-1151.7548 2345.5176,-1155.2473 2349.8788,-1160.7227"/>
<text text-anchor="middle" x="2397" y="-1173.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- cohort -->
<g id="node32" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2083.5,-639.5C2083.5,-639.5 2316.5,-639.5 2316.5,-639.5 2322.5,-639.5 2328.5,-645.5 2328.5,-651.5 2328.5,-651.5 2328.5,-696.5 2328.5,-696.5 2328.5,-702.5 2322.5,-708.5 2316.5,-708.5 2316.5,-708.5 2083.5,-708.5 2083.5,-708.5 2077.5,-708.5 2071.5,-702.5 2071.5,-696.5 2071.5,-696.5 2071.5,-651.5 2071.5,-651.5 2071.5,-645.5 2077.5,-639.5 2083.5,-639.5"/>
<text text-anchor="middle" x="2103" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2134.5,-639.5 2134.5,-708.5 "/>
<text text-anchor="middle" x="2145" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2155.5,-639.5 2155.5,-708.5 "/>
<text text-anchor="middle" x="2231.5" y="-693.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2155.5,-685.5 2307.5,-685.5 "/>
<text text-anchor="middle" x="2231.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2155.5,-662.5 2307.5,-662.5 "/>
<text text-anchor="middle" x="2231.5" y="-647.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_id</text>
<polyline fill="none" stroke="#000000" points="2307.5,-639.5 2307.5,-708.5 "/>
<text text-anchor="middle" x="2318" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge23" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2028.7295,-1218.6875C2089.3688,-1200.7133 2153.633,-1176.7526 2172,-1152 2197.4034,-1117.7647 2200.0736,-831.4798 2200.1318,-719.0619"/>
<polygon fill="#000000" stroke="#000000" points="2203.6318,-718.7391 2200.1299,-708.7398 2196.6318,-718.7405 2203.6318,-718.7391"/>
<text text-anchor="middle" x="2240.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- lab_exam -->
<g id="node17" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1394,-2158C1394,-2158 1454,-2158 1454,-2158 1460,-2158 1466,-2164 1466,-2170 1466,-2170 1466,-2182 1466,-2182 1466,-2188 1460,-2194 1454,-2194 1454,-2194 1394,-2194 1394,-2194 1388,-2194 1382,-2188 1382,-2182 1382,-2182 1382,-2170 1382,-2170 1382,-2164 1388,-2158 1394,-2158"/>
<text text-anchor="middle" x="1424" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge26" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1422.6557,-2157.6655C1419.8181,-2107.1662 1417.6294,-1963.287 1475,-1865 1507.9024,-1808.6318 1569.6935,-1764.5921 1614.5159,-1738.0921"/>
<polygon fill="#000000" stroke="#000000" points="1616.3492,-1741.0749 1623.2405,-1733.0275 1612.8349,-1735.021 1616.3492,-1741.0749"/>
<text text-anchor="middle" x="1527" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- publication -->
<g id="node18" class="node">
<title>publication</title>
<path fill="none" stroke="#000000" d="M2109,-449.5C2109,-449.5 2381,-449.5 2381,-449.5 2387,-449.5 2393,-455.5 2393,-461.5 2393,-461.5 2393,-575.5 2393,-575.5 2393,-581.5 2387,-587.5 2381,-587.5 2381,-587.5 2109,-587.5 2109,-587.5 2103,-587.5 2097,-581.5 2097,-575.5 2097,-575.5 2097,-461.5 2097,-461.5 2097,-455.5 2103,-449.5 2109,-449.5"/>
<text text-anchor="middle" x="2145.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">publication</text>
<polyline fill="none" stroke="#000000" points="2194,-449.5 2194,-587.5 "/>
<text text-anchor="middle" x="2204.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2215,-449.5 2215,-587.5 "/>
<text text-anchor="middle" x="2293.5" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">authorship</text>
<polyline fill="none" stroke="#000000" points="2215,-564.5 2372,-564.5 "/>
<text text-anchor="middle" x="2293.5" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">digital_object_id</text>
<polyline fill="none" stroke="#000000" points="2215,-541.5 2372,-541.5 "/>
<text text-anchor="middle" x="2293.5" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">journal_citation</text>
<polyline fill="none" stroke="#000000" points="2215,-518.5 2372,-518.5 "/>
<text text-anchor="middle" x="2293.5" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">publication_title</text>
<polyline fill="none" stroke="#000000" points="2215,-495.5 2372,-495.5 "/>
<text text-anchor="middle" x="2293.5" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">pubmed_id</text>
<polyline fill="none" stroke="#000000" points="2215,-472.5 2372,-472.5 "/>
<text text-anchor="middle" x="2293.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">year_of_publication</text>
<polyline fill="none" stroke="#000000" points="2372,-449.5 2372,-587.5 "/>
<text text-anchor="middle" x="2382.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- publication&#45;&gt;study -->
<g id="edge12" class="edge">
<title>publication&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2206.7841,-449.3107C2199.3,-435.7609 2191.271,-421.2245 2183.2366,-406.6784"/>
<polygon fill="#000000" stroke="#000000" points="2186.1369,-404.6902 2178.2382,-397.6289 2180.0095,-408.0746 2186.1369,-404.6902"/>
<text text-anchor="middle" x="2225.5" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file -->
<g id="node19" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2064.5,-2934.5C2064.5,-2934.5 2249.5,-2934.5 2249.5,-2934.5 2255.5,-2934.5 2261.5,-2940.5 2261.5,-2946.5 2261.5,-2946.5 2261.5,-3129.5 2261.5,-3129.5 2261.5,-3135.5 2255.5,-3141.5 2249.5,-3141.5 2249.5,-3141.5 2064.5,-3141.5 2064.5,-3141.5 2058.5,-3141.5 2052.5,-3135.5 2052.5,-3129.5 2052.5,-3129.5 2052.5,-2946.5 2052.5,-2946.5 2052.5,-2940.5 2058.5,-2934.5 2064.5,-2934.5"/>
<text text-anchor="middle" x="2072" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2091.5,-2934.5 2091.5,-3141.5 "/>
<text text-anchor="middle" x="2102" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2112.5,-2934.5 2112.5,-3141.5 "/>
<text text-anchor="middle" x="2176.5" y="-3126.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2112.5,-3118.5 2240.5,-3118.5 "/>
<text text-anchor="middle" x="2176.5" y="-3103.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2112.5,-3095.5 2240.5,-3095.5 "/>
<text text-anchor="middle" x="2176.5" y="-3080.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2112.5,-3072.5 2240.5,-3072.5 "/>
<text text-anchor="middle" x="2176.5" y="-3057.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2112.5,-3049.5 2240.5,-3049.5 "/>
<text text-anchor="middle" x="2176.5" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2112.5,-3026.5 2240.5,-3026.5 "/>
<text text-anchor="middle" x="2176.5" y="-3011.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2112.5,-3003.5 2240.5,-3003.5 "/>
<text text-anchor="middle" x="2176.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2112.5,-2980.5 2240.5,-2980.5 "/>
<text text-anchor="middle" x="2176.5" y="-2965.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2112.5,-2957.5 2240.5,-2957.5 "/>
<text text-anchor="middle" x="2176.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2240.5,-2934.5 2240.5,-3141.5 "/>
<text text-anchor="middle" x="2251" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge48" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2052.3456,-2978.4012C2019.2841,-2959.0203 1982.824,-2937.0676 1950,-2916 1916.602,-2894.564 1850.5795,-2848.885 1784.2298,-2802.3965"/>
<polygon fill="#000000" stroke="#000000" points="1785.9147,-2799.3033 1775.7172,-2796.429 1781.8965,-2805.0352 1785.9147,-2799.3033"/>
<text text-anchor="middle" x="2004.5" y="-2904.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge10" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2261.5138,-3032.263C2534.332,-3015.8991 3247,-2963.6625 3247,-2864.5 3247,-2864.5 3247,-2864.5 3247,-518.5 3247,-473.3801 3213.6248,-468.6324 3173,-449 3019.2244,-374.6861 2538.1814,-326.8248 2283.2774,-305.9989"/>
<polygon fill="#000000" stroke="#000000" points="2283.4341,-302.5001 2273.1835,-305.1787 2282.8671,-309.4771 2283.4341,-302.5001"/>
<text text-anchor="middle" x="3277.5" y="-1317.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;case -->
<g id="edge38" class="edge">
<title>file&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2261.7577,-3025.9599C2418.7927,-3004.9527 2697,-2954.9694 2697,-2864.5 2697,-2864.5 2697,-2864.5 2697,-1451 2697,-1404.0127 2712.1245,-1379.3004 2678,-1347 2632.4778,-1303.9111 2246.7762,-1272.0027 2038.7583,-1257.7479"/>
<polygon fill="#000000" stroke="#000000" points="2038.898,-1254.2494 2028.6833,-1257.0618 2038.4223,-1261.2333 2038.898,-1254.2494"/>
<text text-anchor="middle" x="2724" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge1" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2085.1172,-2934.0694C2074.1389,-2918.1966 2063.7135,-2903.1232 2055.3918,-2891.0914"/>
<polygon fill="#000000" stroke="#000000" points="2058.0308,-2888.7542 2049.4638,-2882.5206 2052.2737,-2892.7361 2058.0308,-2888.7542"/>
<text text-anchor="middle" x="2103.5" y="-2904.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- sample -->
<g id="node31" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1825.5,-1865.5C1825.5,-1865.5 2248.5,-1865.5 2248.5,-1865.5 2254.5,-1865.5 2260.5,-1871.5 2260.5,-1877.5 2260.5,-1877.5 2260.5,-2474.5 2260.5,-2474.5 2260.5,-2480.5 2254.5,-2486.5 2248.5,-2486.5 2248.5,-2486.5 1825.5,-2486.5 1825.5,-2486.5 1819.5,-2486.5 1813.5,-2480.5 1813.5,-2474.5 1813.5,-2474.5 1813.5,-1877.5 1813.5,-1877.5 1813.5,-1871.5 1819.5,-1865.5 1825.5,-1865.5"/>
<text text-anchor="middle" x="1847.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1881.5,-1865.5 1881.5,-2486.5 "/>
<text text-anchor="middle" x="1892" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1902.5,-1865.5 1902.5,-2486.5 "/>
<text text-anchor="middle" x="2071" y="-2471.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2463.5 2239.5,-2463.5 "/>
<text text-anchor="middle" x="2071" y="-2448.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2440.5 2239.5,-2440.5 "/>
<text text-anchor="middle" x="2071" y="-2425.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2417.5 2239.5,-2417.5 "/>
<text text-anchor="middle" x="2071" y="-2402.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2394.5 2239.5,-2394.5 "/>
<text text-anchor="middle" x="2071" y="-2379.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2371.5 2239.5,-2371.5 "/>
<text text-anchor="middle" x="2071" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2348.5 2239.5,-2348.5 "/>
<text text-anchor="middle" x="2071" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2325.5 2239.5,-2325.5 "/>
<text text-anchor="middle" x="2071" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2302.5 2239.5,-2302.5 "/>
<text text-anchor="middle" x="2071" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2279.5 2239.5,-2279.5 "/>
<text text-anchor="middle" x="2071" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">molecular_subtype</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2256.5 2239.5,-2256.5 "/>
<text text-anchor="middle" x="2071" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2233.5 2239.5,-2233.5 "/>
<text text-anchor="middle" x="2071" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2210.5 2239.5,-2210.5 "/>
<text text-anchor="middle" x="2071" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2187.5 2239.5,-2187.5 "/>
<text text-anchor="middle" x="2071" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2164.5 2239.5,-2164.5 "/>
<text text-anchor="middle" x="2071" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_sample_type</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2141.5 2239.5,-2141.5 "/>
<text text-anchor="middle" x="2071" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_chronology</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2118.5 2239.5,-2118.5 "/>
<text text-anchor="middle" x="2071" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2095.5 2239.5,-2095.5 "/>
<text text-anchor="middle" x="2071" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2072.5 2239.5,-2072.5 "/>
<text text-anchor="middle" x="2071" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2049.5 2239.5,-2049.5 "/>
<text text-anchor="middle" x="2071" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2026.5 2239.5,-2026.5 "/>
<text text-anchor="middle" x="2071" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="1902.5,-2003.5 2239.5,-2003.5 "/>
<text text-anchor="middle" x="2071" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1902.5,-1980.5 2239.5,-1980.5 "/>
<text text-anchor="middle" x="2071" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="1902.5,-1957.5 2239.5,-1957.5 "/>
<text text-anchor="middle" x="2071" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="1902.5,-1934.5 2239.5,-1934.5 "/>
<text text-anchor="middle" x="2071" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1902.5,-1911.5 2239.5,-1911.5 "/>
<text text-anchor="middle" x="2071" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">volume_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1902.5,-1888.5 2239.5,-1888.5 "/>
<text text-anchor="middle" x="2071" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2239.5,-1865.5 2239.5,-2486.5 "/>
<text text-anchor="middle" x="2250" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge4" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2153.222,-2934.2868C2148.2238,-2826.4846 2137.1761,-2653.127 2114,-2505 2113.5686,-2502.2425 2113.1266,-2499.4739 2112.6746,-2496.6956"/>
<polygon fill="#000000" stroke="#000000" points="2116.0881,-2495.886 2110.9951,-2486.5956 2109.1829,-2497.0343 2116.0881,-2495.886"/>
<text text-anchor="middle" x="2187.5" y="-2860.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- registration -->
<g id="node20" class="node">
<title>registration</title>
<path fill="none" stroke="#000000" d="M1044,-1428C1044,-1428 1314,-1428 1314,-1428 1320,-1428 1326,-1434 1326,-1440 1326,-1440 1326,-1462 1326,-1462 1326,-1468 1320,-1474 1314,-1474 1314,-1474 1044,-1474 1044,-1474 1038,-1474 1032,-1468 1032,-1462 1032,-1462 1032,-1440 1032,-1440 1032,-1434 1038,-1428 1044,-1428"/>
<text text-anchor="middle" x="1082.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration</text>
<polyline fill="none" stroke="#000000" points="1133,-1428 1133,-1474 "/>
<text text-anchor="middle" x="1143.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1154,-1428 1154,-1474 "/>
<text text-anchor="middle" x="1229.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_id</text>
<polyline fill="none" stroke="#000000" points="1154,-1451 1305,-1451 "/>
<text text-anchor="middle" x="1229.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_origin</text>
<polyline fill="none" stroke="#000000" points="1305,-1428 1305,-1474 "/>
<text text-anchor="middle" x="1315.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge40" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1189.6577,-1427.8415C1205.6306,-1396.0891 1239.0022,-1340.0187 1286,-1314 1327.7239,-1290.9011 1605.5793,-1269.0778 1775.1765,-1257.6934"/>
<polygon fill="#000000" stroke="#000000" points="1775.4356,-1261.1839 1785.1802,-1257.0255 1774.9692,-1254.1995 1775.4356,-1261.1839"/>
<text text-anchor="middle" x="1313" y="-1317.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge33" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M879.7229,-1606.3892C880.8212,-1523.6007 897.1505,-1411.1564 969,-1347 1027.9097,-1294.3979 1530.8791,-1265.7015 1775.0557,-1254.757"/>
<polygon fill="#000000" stroke="#000000" points="1775.224,-1258.2531 1785.0586,-1254.3121 1774.9129,-1251.26 1775.224,-1258.2531"/>
<text text-anchor="middle" x="996" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge5" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2037,-2846.4382C2037,-2795.2094 2037,-2643.1971 2037,-2496.8504"/>
<polygon fill="#000000" stroke="#000000" points="2040.5001,-2496.7728 2037,-2486.7728 2033.5001,-2496.7729 2040.5001,-2496.7728"/>
<text text-anchor="middle" x="2073.5" y="-2662.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- prior_surgery -->
<g id="node24" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M12,-2095.5C12,-2095.5 358,-2095.5 358,-2095.5 364,-2095.5 370,-2101.5 370,-2107.5 370,-2107.5 370,-2244.5 370,-2244.5 370,-2250.5 364,-2256.5 358,-2256.5 358,-2256.5 12,-2256.5 12,-2256.5 6,-2256.5 0,-2250.5 0,-2244.5 0,-2244.5 0,-2107.5 0,-2107.5 0,-2101.5 6,-2095.5 12,-2095.5"/>
<text text-anchor="middle" x="57.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="115,-2095.5 115,-2256.5 "/>
<text text-anchor="middle" x="125.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="136,-2095.5 136,-2256.5 "/>
<text text-anchor="middle" x="242.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="136,-2233.5 349,-2233.5 "/>
<text text-anchor="middle" x="242.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="136,-2210.5 349,-2210.5 "/>
<text text-anchor="middle" x="242.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="136,-2187.5 349,-2187.5 "/>
<text text-anchor="middle" x="242.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="136,-2164.5 349,-2164.5 "/>
<text text-anchor="middle" x="242.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="136,-2141.5 349,-2141.5 "/>
<text text-anchor="middle" x="242.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="136,-2118.5 349,-2118.5 "/>
<text text-anchor="middle" x="242.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="349,-2095.5 349,-2256.5 "/>
<text text-anchor="middle" x="359.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge6" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M229.8909,-2095.2935C272.6657,-2025.2471 343.1756,-1925.7882 429,-1865 506.1864,-1810.33 604.1751,-1773.734 689.6058,-1749.9033"/>
<polygon fill="#000000" stroke="#000000" points="690.7104,-1753.2296 699.4254,-1747.2046 688.8553,-1746.4798 690.7104,-1753.2296"/>
<text text-anchor="middle" x="523" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge18" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M370.113,-2219.6163C381.2907,-2209.2419 388,-2194.7031 388,-2176 388,-2161.5343 383.9865,-2149.5598 376.9962,-2140.0763"/>
<polygon fill="#000000" stroke="#000000" points="379.3895,-2137.5022 370.113,-2132.3837 374.1729,-2142.1699 379.3895,-2137.5022"/>
<text text-anchor="middle" x="404" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge41" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1645.8815,-1686.8678C1620.4018,-1658.4607 1579.9953,-1607.5473 1564,-1555 1537.0796,-1466.5621 1508.2806,-1420.7654 1564,-1347 1590.0671,-1312.4905 1689.8497,-1286.6075 1775.1193,-1270.2141"/>
<polygon fill="#000000" stroke="#000000" points="1775.9991,-1273.6099 1785.174,-1268.3116 1774.6976,-1266.7319 1775.9991,-1273.6099"/>
<text text-anchor="middle" x="1591" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge17" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1726.0376,-1733.0098C1757.1529,-1736.9199 1785.5,-1729.25 1785.5,-1710 1785.5,-1692.8555 1763.0147,-1684.8964 1736.1145,-1686.1228"/>
<polygon fill="#000000" stroke="#000000" points="1735.7006,-1682.6454 1726.0376,-1686.9902 1736.301,-1689.6196 1735.7006,-1682.6454"/>
<text text-anchor="middle" x="1801.5" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node30" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1639,-1416.5C1639,-1416.5 1867,-1416.5 1867,-1416.5 1873,-1416.5 1879,-1422.5 1879,-1428.5 1879,-1428.5 1879,-1473.5 1879,-1473.5 1879,-1479.5 1873,-1485.5 1867,-1485.5 1867,-1485.5 1639,-1485.5 1639,-1485.5 1633,-1485.5 1627,-1479.5 1627,-1473.5 1627,-1473.5 1627,-1428.5 1627,-1428.5 1627,-1422.5 1633,-1416.5 1639,-1416.5"/>
<text text-anchor="middle" x="1654" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1681,-1416.5 1681,-1485.5 "/>
<text text-anchor="middle" x="1691.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1702,-1416.5 1702,-1485.5 "/>
<text text-anchor="middle" x="1780" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1702,-1462.5 1858,-1462.5 "/>
<text text-anchor="middle" x="1780" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1702,-1439.5 1858,-1439.5 "/>
<text text-anchor="middle" x="1780" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1858,-1416.5 1858,-1485.5 "/>
<text text-anchor="middle" x="1868.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge31" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1675.6931,-1686.5587C1689.8801,-1643.3301 1720.3693,-1550.4277 1738.5313,-1495.0869"/>
<polygon fill="#000000" stroke="#000000" points="1741.8704,-1496.1366 1741.6632,-1485.5438 1735.2194,-1493.9538 1741.8704,-1496.1366"/>
<text text-anchor="middle" x="1740.5" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- physical_exam -->
<g id="node26" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M998,-2084C998,-2084 1314,-2084 1314,-2084 1320,-2084 1326,-2090 1326,-2096 1326,-2096 1326,-2256 1326,-2256 1326,-2262 1320,-2268 1314,-2268 1314,-2268 998,-2268 998,-2268 992,-2268 986,-2262 986,-2256 986,-2256 986,-2096 986,-2096 986,-2090 992,-2084 998,-2084"/>
<text text-anchor="middle" x="1047" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1108,-2084 1108,-2268 "/>
<text text-anchor="middle" x="1118.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1129,-2084 1129,-2268 "/>
<text text-anchor="middle" x="1217" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1129,-2245 1305,-2245 "/>
<text text-anchor="middle" x="1217" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1129,-2222 1305,-2222 "/>
<text text-anchor="middle" x="1217" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1129,-2199 1305,-2199 "/>
<text text-anchor="middle" x="1217" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1129,-2176 1305,-2176 "/>
<text text-anchor="middle" x="1217" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1129,-2153 1305,-2153 "/>
<text text-anchor="middle" x="1217" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1129,-2130 1305,-2130 "/>
<text text-anchor="middle" x="1217" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1129,-2107 1305,-2107 "/>
<text text-anchor="middle" x="1217" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1305,-2084 1305,-2268 "/>
<text text-anchor="middle" x="1315.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge7" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1103.1433,-2083.6837C1067.6133,-2021.7481 1019.6583,-1938.3823 977,-1865 969.013,-1851.2604 960.6022,-1836.8529 952.2524,-1822.5871"/>
<polygon fill="#000000" stroke="#000000" points="955.1394,-1820.5907 947.0658,-1813.7302 949.0989,-1824.1281 955.1394,-1820.5907"/>
<text text-anchor="middle" x="1015" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge30" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1205.6119,-2083.8941C1244.7171,-2017.34 1304.0415,-1928.3697 1373,-1865 1437.4253,-1805.7961 1528.6865,-1762.4478 1592.5914,-1736.8836"/>
<polygon fill="#000000" stroke="#000000" points="1594.1927,-1740.0144 1602.2094,-1733.0874 1591.6227,-1733.5032 1594.1927,-1740.0144"/>
<text text-anchor="middle" x="1436" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_site -->
<g id="node27" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2834.5,-484C2834.5,-484 3151.5,-484 3151.5,-484 3157.5,-484 3163.5,-490 3163.5,-496 3163.5,-496 3163.5,-541 3163.5,-541 3163.5,-547 3157.5,-553 3151.5,-553 3151.5,-553 2834.5,-553 2834.5,-553 2828.5,-553 2822.5,-547 2822.5,-541 2822.5,-541 2822.5,-496 2822.5,-496 2822.5,-490 2828.5,-484 2834.5,-484"/>
<text text-anchor="middle" x="2867.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2912.5,-484 2912.5,-553 "/>
<text text-anchor="middle" x="2923" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2933.5,-484 2933.5,-553 "/>
<text text-anchor="middle" x="3038" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2933.5,-530 3142.5,-530 "/>
<text text-anchor="middle" x="3038" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2933.5,-507 3142.5,-507 "/>
<text text-anchor="middle" x="3038" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3142.5,-484 3142.5,-553 "/>
<text text-anchor="middle" x="3153" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge11" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2911.477,-483.8692C2881.214,-471.8075 2846.373,-458.8441 2814,-449 2635.0268,-394.5774 2424.7582,-350.2163 2283.1662,-323.1084"/>
<polygon fill="#000000" stroke="#000000" points="2283.5704,-319.6224 2273.0916,-321.1865 2282.2586,-326.4985 2283.5704,-319.6224"/>
<text text-anchor="middle" x="2770.5" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- vital_signs -->
<g id="node28" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1496.5,-2015C1496.5,-2015 1783.5,-2015 1783.5,-2015 1789.5,-2015 1795.5,-2021 1795.5,-2027 1795.5,-2027 1795.5,-2325 1795.5,-2325 1795.5,-2331 1789.5,-2337 1783.5,-2337 1783.5,-2337 1496.5,-2337 1496.5,-2337 1490.5,-2337 1484.5,-2331 1484.5,-2325 1484.5,-2325 1484.5,-2027 1484.5,-2027 1484.5,-2021 1490.5,-2015 1496.5,-2015"/>
<text text-anchor="middle" x="1531" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1577.5,-2015 1577.5,-2337 "/>
<text text-anchor="middle" x="1588" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1598.5,-2015 1598.5,-2337 "/>
<text text-anchor="middle" x="1686.5" y="-2321.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2314 1774.5,-2314 "/>
<text text-anchor="middle" x="1686.5" y="-2298.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2291 1774.5,-2291 "/>
<text text-anchor="middle" x="1686.5" y="-2275.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2268 1774.5,-2268 "/>
<text text-anchor="middle" x="1686.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2245 1774.5,-2245 "/>
<text text-anchor="middle" x="1686.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2222 1774.5,-2222 "/>
<text text-anchor="middle" x="1686.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2199 1774.5,-2199 "/>
<text text-anchor="middle" x="1686.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2176 1774.5,-2176 "/>
<text text-anchor="middle" x="1686.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2153 1774.5,-2153 "/>
<text text-anchor="middle" x="1686.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2130 1774.5,-2130 "/>
<text text-anchor="middle" x="1686.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2107 1774.5,-2107 "/>
<text text-anchor="middle" x="1686.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2084 1774.5,-2084 "/>
<text text-anchor="middle" x="1686.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2061 1774.5,-2061 "/>
<text text-anchor="middle" x="1686.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1598.5,-2038 1774.5,-2038 "/>
<text text-anchor="middle" x="1686.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1774.5,-2015 1774.5,-2337 "/>
<text text-anchor="middle" x="1785" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge27" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1649.1145,-2014.9793C1652.447,-1957.2605 1656.3067,-1891.709 1660,-1832 1661.8493,-1802.1035 1664.0907,-1768.0958 1665.73,-1743.5939"/>
<polygon fill="#000000" stroke="#000000" points="1669.2375,-1743.5968 1666.4149,-1733.3849 1662.2533,-1743.1282 1669.2375,-1743.5968"/>
<text text-anchor="middle" x="1688" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge43" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2577.7588,-760.1416C2584.8898,-739.829 2591.3891,-721.316 2596.5193,-706.7027"/>
<polygon fill="#000000" stroke="#000000" points="2599.8331,-707.8294 2599.8432,-697.2346 2593.2283,-705.5106 2599.8331,-707.8294"/>
<text text-anchor="middle" x="2620" y="-730.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge32" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2299.2955,-1142.4259C2294.5323,-1145.7034 2289.7641,-1148.8994 2285,-1152 2211.476,-1199.8515 2115.6664,-1224.2396 2038.9036,-1236.6582"/>
<polygon fill="#000000" stroke="#000000" points="2038.0207,-1233.2538 2028.683,-1238.2596 2039.1043,-1240.1694 2038.0207,-1233.2538"/>
<text text-anchor="middle" x="2276" y="-1173.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge15" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2718.7046,-983.2761C2729.876,-976.5862 2736.5,-967.4941 2736.5,-956 2736.5,-947.7386 2733.0781,-940.7181 2727.0052,-934.9385"/>
<polygon fill="#000000" stroke="#000000" points="2728.8073,-931.9155 2718.7046,-928.7239 2724.6119,-937.519 2728.8073,-931.9155"/>
<text text-anchor="middle" x="2752.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge35" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1771.4568,-1416.461C1787.5384,-1387.7476 1812.3996,-1346.4813 1839,-1314 1841.9994,-1310.3374 1845.1954,-1306.6743 1848.5044,-1303.058"/>
<polygon fill="#000000" stroke="#000000" points="1851.1138,-1305.3924 1855.4288,-1295.7161 1846.0214,-1300.5896 1851.1138,-1305.3924"/>
<text text-anchor="middle" x="1866" y="-1317.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge34" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1974.2162,-1865.1109C1956.2079,-1766.3255 1938.1748,-1656.4003 1926,-1555 1915.61,-1468.4646 1910.7344,-1367.4154 1908.5721,-1305.9687"/>
<polygon fill="#000000" stroke="#000000" points="1912.0612,-1305.5878 1908.2235,-1295.7125 1905.0653,-1305.8257 1912.0612,-1305.5878"/>
<text text-anchor="middle" x="1958" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge28" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1813.1978,-1872.1974C1810.1534,-1869.7492 1807.0873,-1867.3489 1804,-1865 1786.5281,-1851.7068 1775.0532,-1860.8262 1758,-1847 1723.0935,-1818.6988 1697.0064,-1773.1853 1682.1398,-1742.462"/>
<polygon fill="#000000" stroke="#000000" points="1685.1346,-1740.6058 1677.7104,-1733.0472 1678.8006,-1743.5858 1685.1346,-1740.6058"/>
<text text-anchor="middle" x="1786" y="-1835.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge16" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2260.5955,-2216.79C2271.8572,-2206.6592 2278.5,-2193.0625 2278.5,-2176 2278.5,-2162.8032 2274.5262,-2151.6797 2267.5151,-2142.6295"/>
<polygon fill="#000000" stroke="#000000" points="2269.9756,-2140.136 2260.5955,-2135.21 2264.8563,-2144.9103 2269.9756,-2140.136"/>
<text text-anchor="middle" x="2294.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge19" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2290.5484,-639.4895C2345.4795,-618.5538 2416.5025,-591.485 2477.4373,-568.261"/>
<polygon fill="#000000" stroke="#000000" points="2479.0285,-571.4002 2487.1263,-564.5683 2476.5355,-564.8592 2479.0285,-571.4002"/>
<text text-anchor="middle" x="2408.5" y="-609.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge20" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2071.4365,-641.4093C2045.9688,-628.9112 2022.3802,-611.6913 2007,-588 1970.8494,-532.3142 1994.5336,-463.4093 2029.4746,-406.3067"/>
<polygon fill="#000000" stroke="#000000" points="2032.5824,-407.939 2034.9381,-397.6093 2026.6549,-404.2154 2032.5824,-407.939"/>
<text text-anchor="middle" x="2047.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
</g>
</svg>
</div>
