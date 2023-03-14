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
<svg width="3865pt" height="3104pt"
 viewBox="0.00 0.00 3864.50 3104.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 3100)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-3100 3860.5,-3100 3860.5,4 -4,4"/>
<!-- image -->
<g id="node1" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1494.5,-2974C1494.5,-2974 1530.5,-2974 1530.5,-2974 1536.5,-2974 1542.5,-2980 1542.5,-2986 1542.5,-2986 1542.5,-2998 1542.5,-2998 1542.5,-3004 1536.5,-3010 1530.5,-3010 1530.5,-3010 1494.5,-3010 1494.5,-3010 1488.5,-3010 1482.5,-3004 1482.5,-2998 1482.5,-2998 1482.5,-2986 1482.5,-2986 1482.5,-2980 1488.5,-2974 1494.5,-2974"/>
<text text-anchor="middle" x="1512.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node24" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1496.5,-2800.5C1496.5,-2800.5 1528.5,-2800.5 1528.5,-2800.5 1534.5,-2800.5 1540.5,-2806.5 1540.5,-2812.5 1540.5,-2812.5 1540.5,-2824.5 1540.5,-2824.5 1540.5,-2830.5 1534.5,-2836.5 1528.5,-2836.5 1528.5,-2836.5 1496.5,-2836.5 1496.5,-2836.5 1490.5,-2836.5 1484.5,-2830.5 1484.5,-2824.5 1484.5,-2824.5 1484.5,-2812.5 1484.5,-2812.5 1484.5,-2806.5 1490.5,-2800.5 1496.5,-2800.5"/>
<text text-anchor="middle" x="1512.5" y="-2814.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge45" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1512.5,-2973.7604C1512.5,-2943.5622 1512.5,-2882.9545 1512.5,-2847.0457"/>
<polygon fill="#000000" stroke="#000000" points="1516.0001,-2846.7555 1512.5,-2836.7556 1509.0001,-2846.7556 1516.0001,-2846.7555"/>
<text text-anchor="middle" x="1543" y="-2858.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- image_collection -->
<g id="node2" class="node">
<title>image_collection</title>
<path fill="none" stroke="#000000" d="M12,-461C12,-461 351,-461 351,-461 357,-461 363,-467 363,-473 363,-473 363,-564 363,-564 363,-570 357,-576 351,-576 351,-576 12,-576 12,-576 6,-576 0,-570 0,-564 0,-564 0,-473 0,-473 0,-467 6,-461 12,-461"/>
<text text-anchor="middle" x="68.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection</text>
<polyline fill="none" stroke="#000000" points="137,-461 137,-576 "/>
<text text-anchor="middle" x="147.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="158,-461 158,-576 "/>
<text text-anchor="middle" x="250" y="-560.8" font-family="Times,serif" font-size="14.00" fill="#000000">collection_access</text>
<polyline fill="none" stroke="#000000" points="158,-553 342,-553 "/>
<text text-anchor="middle" x="250" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_name</text>
<polyline fill="none" stroke="#000000" points="158,-530 342,-530 "/>
<text text-anchor="middle" x="250" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_url</text>
<polyline fill="none" stroke="#000000" points="158,-507 342,-507 "/>
<text text-anchor="middle" x="250" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">image_type_included</text>
<polyline fill="none" stroke="#000000" points="158,-484 342,-484 "/>
<text text-anchor="middle" x="250" y="-468.8" font-family="Times,serif" font-size="14.00" fill="#000000">repository_name</text>
<polyline fill="none" stroke="#000000" points="342,-461 342,-576 "/>
<text text-anchor="middle" x="352.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node29" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1026.5,-190.5C1026.5,-190.5 1306.5,-190.5 1306.5,-190.5 1312.5,-190.5 1318.5,-196.5 1318.5,-202.5 1318.5,-202.5 1318.5,-385.5 1318.5,-385.5 1318.5,-391.5 1312.5,-397.5 1306.5,-397.5 1306.5,-397.5 1026.5,-397.5 1026.5,-397.5 1020.5,-397.5 1014.5,-391.5 1014.5,-385.5 1014.5,-385.5 1014.5,-202.5 1014.5,-202.5 1014.5,-196.5 1020.5,-190.5 1026.5,-190.5"/>
<text text-anchor="middle" x="1042.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1070.5,-190.5 1070.5,-397.5 "/>
<text text-anchor="middle" x="1081" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1091.5,-190.5 1091.5,-397.5 "/>
<text text-anchor="middle" x="1194.5" y="-382.3" font-family="Times,serif" font-size="14.00" fill="#000000">accession_id</text>
<polyline fill="none" stroke="#000000" points="1091.5,-374.5 1297.5,-374.5 "/>
<text text-anchor="middle" x="1194.5" y="-359.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1091.5,-351.5 1297.5,-351.5 "/>
<text text-anchor="middle" x="1194.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1091.5,-328.5 1297.5,-328.5 "/>
<text text-anchor="middle" x="1194.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1091.5,-305.5 1297.5,-305.5 "/>
<text text-anchor="middle" x="1194.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1091.5,-282.5 1297.5,-282.5 "/>
<text text-anchor="middle" x="1194.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1091.5,-259.5 1297.5,-259.5 "/>
<text text-anchor="middle" x="1194.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1091.5,-236.5 1297.5,-236.5 "/>
<text text-anchor="middle" x="1194.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1091.5,-213.5 1297.5,-213.5 "/>
<text text-anchor="middle" x="1194.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_disposition</text>
<polyline fill="none" stroke="#000000" points="1297.5,-190.5 1297.5,-397.5 "/>
<text text-anchor="middle" x="1308" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- image_collection&#45;&gt;study -->
<g id="edge32" class="edge">
<title>image_collection&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M243.0591,-460.9248C264.5156,-443.8479 289.7114,-426.833 315.5,-416 436.5034,-365.1701 792.8856,-326.6008 1004.1319,-307.4358"/>
<polygon fill="#000000" stroke="#000000" points="1004.7473,-310.8946 1014.3923,-306.5099 1004.1181,-303.9229 1004.7473,-310.8946"/>
<text text-anchor="middle" x="346" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file -->
<g id="node3" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1102,-2888.5C1102,-2888.5 1287,-2888.5 1287,-2888.5 1293,-2888.5 1299,-2894.5 1299,-2900.5 1299,-2900.5 1299,-3083.5 1299,-3083.5 1299,-3089.5 1293,-3095.5 1287,-3095.5 1287,-3095.5 1102,-3095.5 1102,-3095.5 1096,-3095.5 1090,-3089.5 1090,-3083.5 1090,-3083.5 1090,-2900.5 1090,-2900.5 1090,-2894.5 1096,-2888.5 1102,-2888.5"/>
<text text-anchor="middle" x="1109.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1129,-2888.5 1129,-3095.5 "/>
<text text-anchor="middle" x="1139.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1150,-2888.5 1150,-3095.5 "/>
<text text-anchor="middle" x="1214" y="-3080.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1150,-3072.5 1278,-3072.5 "/>
<text text-anchor="middle" x="1214" y="-3057.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1150,-3049.5 1278,-3049.5 "/>
<text text-anchor="middle" x="1214" y="-3034.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1150,-3026.5 1278,-3026.5 "/>
<text text-anchor="middle" x="1214" y="-3011.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1150,-3003.5 1278,-3003.5 "/>
<text text-anchor="middle" x="1214" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1150,-2980.5 1278,-2980.5 "/>
<text text-anchor="middle" x="1214" y="-2965.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1150,-2957.5 1278,-2957.5 "/>
<text text-anchor="middle" x="1214" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1150,-2934.5 1278,-2934.5 "/>
<text text-anchor="middle" x="1214" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1150,-2911.5 1278,-2911.5 "/>
<text text-anchor="middle" x="1214" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1278,-2888.5 1278,-3095.5 "/>
<text text-anchor="middle" x="1288.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node9" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1023,-2459.5C1023,-2459.5 1366,-2459.5 1366,-2459.5 1372,-2459.5 1378,-2465.5 1378,-2471.5 1378,-2471.5 1378,-2769.5 1378,-2769.5 1378,-2775.5 1372,-2781.5 1366,-2781.5 1366,-2781.5 1023,-2781.5 1023,-2781.5 1017,-2781.5 1011,-2775.5 1011,-2769.5 1011,-2769.5 1011,-2471.5 1011,-2471.5 1011,-2465.5 1017,-2459.5 1023,-2459.5"/>
<text text-anchor="middle" x="1053" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1095,-2459.5 1095,-2781.5 "/>
<text text-anchor="middle" x="1105.5" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1116,-2459.5 1116,-2781.5 "/>
<text text-anchor="middle" x="1236.5" y="-2766.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1116,-2758.5 1357,-2758.5 "/>
<text text-anchor="middle" x="1236.5" y="-2743.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1116,-2735.5 1357,-2735.5 "/>
<text text-anchor="middle" x="1236.5" y="-2720.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1116,-2712.5 1357,-2712.5 "/>
<text text-anchor="middle" x="1236.5" y="-2697.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1116,-2689.5 1357,-2689.5 "/>
<text text-anchor="middle" x="1236.5" y="-2674.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1116,-2666.5 1357,-2666.5 "/>
<text text-anchor="middle" x="1236.5" y="-2651.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis_id</text>
<polyline fill="none" stroke="#000000" points="1116,-2643.5 1357,-2643.5 "/>
<text text-anchor="middle" x="1236.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1116,-2620.5 1357,-2620.5 "/>
<text text-anchor="middle" x="1236.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1116,-2597.5 1357,-2597.5 "/>
<text text-anchor="middle" x="1236.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1116,-2574.5 1357,-2574.5 "/>
<text text-anchor="middle" x="1236.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1116,-2551.5 1357,-2551.5 "/>
<text text-anchor="middle" x="1236.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1116,-2528.5 1357,-2528.5 "/>
<text text-anchor="middle" x="1236.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1116,-2505.5 1357,-2505.5 "/>
<text text-anchor="middle" x="1236.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1116,-2482.5 1357,-2482.5 "/>
<text text-anchor="middle" x="1236.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1357,-2459.5 1357,-2781.5 "/>
<text text-anchor="middle" x="1367.5" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge11" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1194.5,-2888.0225C1194.5,-2858.1622 1194.5,-2824.7793 1194.5,-2791.9924"/>
<polygon fill="#000000" stroke="#000000" points="1198.0001,-2791.8408 1194.5,-2781.8409 1191.0001,-2791.8409 1198.0001,-2791.8408"/>
<text text-anchor="middle" x="1249" y="-2858.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- sample -->
<g id="node12" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1365,-1934.5C1365,-1934.5 1660,-1934.5 1660,-1934.5 1666,-1934.5 1672,-1940.5 1672,-1946.5 1672,-1946.5 1672,-2336.5 1672,-2336.5 1672,-2342.5 1666,-2348.5 1660,-2348.5 1660,-2348.5 1365,-2348.5 1365,-2348.5 1359,-2348.5 1353,-2342.5 1353,-2336.5 1353,-2336.5 1353,-1946.5 1353,-1946.5 1353,-1940.5 1359,-1934.5 1365,-1934.5"/>
<text text-anchor="middle" x="1387" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1421,-1934.5 1421,-2348.5 "/>
<text text-anchor="middle" x="1431.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1442,-1934.5 1442,-2348.5 "/>
<text text-anchor="middle" x="1546.5" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1442,-2325.5 1651,-2325.5 "/>
<text text-anchor="middle" x="1546.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1442,-2302.5 1651,-2302.5 "/>
<text text-anchor="middle" x="1546.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1442,-2279.5 1651,-2279.5 "/>
<text text-anchor="middle" x="1546.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1442,-2256.5 1651,-2256.5 "/>
<text text-anchor="middle" x="1546.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">molecular_subtype</text>
<polyline fill="none" stroke="#000000" points="1442,-2233.5 1651,-2233.5 "/>
<text text-anchor="middle" x="1546.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1442,-2210.5 1651,-2210.5 "/>
<text text-anchor="middle" x="1546.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1442,-2187.5 1651,-2187.5 "/>
<text text-anchor="middle" x="1546.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_sample_type</text>
<polyline fill="none" stroke="#000000" points="1442,-2164.5 1651,-2164.5 "/>
<text text-anchor="middle" x="1546.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_chronology</text>
<polyline fill="none" stroke="#000000" points="1442,-2141.5 1651,-2141.5 "/>
<text text-anchor="middle" x="1546.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1442,-2118.5 1651,-2118.5 "/>
<text text-anchor="middle" x="1546.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="1442,-2095.5 1651,-2095.5 "/>
<text text-anchor="middle" x="1546.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1442,-2072.5 1651,-2072.5 "/>
<text text-anchor="middle" x="1546.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1442,-2049.5 1651,-2049.5 "/>
<text text-anchor="middle" x="1546.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="1442,-2026.5 1651,-2026.5 "/>
<text text-anchor="middle" x="1546.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="1442,-2003.5 1651,-2003.5 "/>
<text text-anchor="middle" x="1546.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="1442,-1980.5 1651,-1980.5 "/>
<text text-anchor="middle" x="1546.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">volume_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1442,-1957.5 1651,-1957.5 "/>
<text text-anchor="middle" x="1546.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1651,-1934.5 1651,-2348.5 "/>
<text text-anchor="middle" x="1661.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge38" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1299.1164,-2895.9324C1329.5019,-2862.6914 1359.7779,-2823.3296 1379.5,-2782 1442.9002,-2649.139 1476.1948,-2486.6122 1493.6167,-2358.5244"/>
<polygon fill="#000000" stroke="#000000" points="1497.0894,-2358.9606 1494.9462,-2348.5848 1490.1512,-2358.0324 1497.0894,-2358.9606"/>
<text text-anchor="middle" x="1407" y="-2814.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- case -->
<g id="node20" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1368,-1249.5C1368,-1249.5 1587,-1249.5 1587,-1249.5 1593,-1249.5 1599,-1255.5 1599,-1261.5 1599,-1261.5 1599,-1306.5 1599,-1306.5 1599,-1312.5 1593,-1318.5 1587,-1318.5 1587,-1318.5 1368,-1318.5 1368,-1318.5 1362,-1318.5 1356,-1312.5 1356,-1306.5 1356,-1306.5 1356,-1261.5 1356,-1261.5 1356,-1255.5 1362,-1249.5 1368,-1249.5"/>
<text text-anchor="middle" x="1380.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1405,-1249.5 1405,-1318.5 "/>
<text text-anchor="middle" x="1415.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1426,-1249.5 1426,-1318.5 "/>
<text text-anchor="middle" x="1502" y="-1303.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1426,-1295.5 1578,-1295.5 "/>
<text text-anchor="middle" x="1502" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1426,-1272.5 1578,-1272.5 "/>
<text text-anchor="middle" x="1502" y="-1257.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1578,-1249.5 1578,-1318.5 "/>
<text text-anchor="middle" x="1588.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;case -->
<g id="edge16" class="edge">
<title>file&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1089.8223,-2904.3561C1055.7673,-2869.9085 1021.5961,-2827.6617 1001.5,-2782 832.586,-2398.2001 1069.5249,-2233.9513 920.5,-1842 838.642,-1626.7046 552.9233,-1541.6596 706.5,-1370 748.2755,-1323.3056 1136.6658,-1299.0556 1345.7148,-1289.2921"/>
<polygon fill="#000000" stroke="#000000" points="1346.0114,-1292.7822 1355.8391,-1288.824 1345.6881,-1285.7897 1346.0114,-1292.7822"/>
<text text-anchor="middle" x="940.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge46" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1299.0655,-2934.9493C1359.7796,-2901.8239 1432.5364,-2862.1279 1475.5059,-2838.6839"/>
<polygon fill="#000000" stroke="#000000" points="1477.3649,-2841.6567 1484.467,-2833.7947 1474.0122,-2835.5118 1477.3649,-2841.6567"/>
<text text-anchor="middle" x="1475" y="-2858.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge36" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1089.8035,-2980.2517C872.0647,-2954.3997 390.5,-2889.2288 390.5,-2818.5 390.5,-2818.5 390.5,-2818.5 390.5,-518.5 390.5,-391.8812 776.5577,-332.1916 1004.0733,-308.0087"/>
<polygon fill="#000000" stroke="#000000" points="1004.5339,-311.4796 1014.1133,-306.9536 1003.8022,-304.518 1004.5339,-311.4796"/>
<text text-anchor="middle" x="421" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study_arm -->
<g id="node4" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M494,-472.5C494,-472.5 863,-472.5 863,-472.5 869,-472.5 875,-478.5 875,-484.5 875,-484.5 875,-552.5 875,-552.5 875,-558.5 869,-564.5 863,-564.5 863,-564.5 494,-564.5 494,-564.5 488,-564.5 482,-558.5 482,-552.5 482,-552.5 482,-484.5 482,-484.5 482,-478.5 488,-472.5 494,-472.5"/>
<text text-anchor="middle" x="528" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="574,-472.5 574,-564.5 "/>
<text text-anchor="middle" x="584.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="595,-472.5 595,-564.5 "/>
<text text-anchor="middle" x="724.5" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="595,-541.5 854,-541.5 "/>
<text text-anchor="middle" x="724.5" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="595,-518.5 854,-518.5 "/>
<text text-anchor="middle" x="724.5" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_id</text>
<polyline fill="none" stroke="#000000" points="595,-495.5 854,-495.5 "/>
<text text-anchor="middle" x="724.5" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="854,-472.5 854,-564.5 "/>
<text text-anchor="middle" x="864.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge24" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M778.7268,-472.3916C843.8611,-442.4271 930.2427,-402.6881 1004.9421,-368.3232"/>
<polygon fill="#000000" stroke="#000000" points="1006.8381,-371.3037 1014.4601,-363.9446 1003.9126,-364.9443 1006.8381,-371.3037"/>
<text text-anchor="middle" x="934" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- lab_exam -->
<g id="node5" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1752.5,-2123.5C1752.5,-2123.5 1812.5,-2123.5 1812.5,-2123.5 1818.5,-2123.5 1824.5,-2129.5 1824.5,-2135.5 1824.5,-2135.5 1824.5,-2147.5 1824.5,-2147.5 1824.5,-2153.5 1818.5,-2159.5 1812.5,-2159.5 1812.5,-2159.5 1752.5,-2159.5 1752.5,-2159.5 1746.5,-2159.5 1740.5,-2153.5 1740.5,-2147.5 1740.5,-2147.5 1740.5,-2135.5 1740.5,-2135.5 1740.5,-2129.5 1746.5,-2123.5 1752.5,-2123.5"/>
<text text-anchor="middle" x="1782.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- visit -->
<g id="node14" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1695,-1664C1695,-1664 1870,-1664 1870,-1664 1876,-1664 1882,-1670 1882,-1676 1882,-1676 1882,-1721 1882,-1721 1882,-1727 1876,-1733 1870,-1733 1870,-1733 1695,-1733 1695,-1733 1689,-1733 1683,-1727 1683,-1721 1683,-1721 1683,-1676 1683,-1676 1683,-1670 1689,-1664 1695,-1664"/>
<text text-anchor="middle" x="1706.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1730,-1664 1730,-1733 "/>
<text text-anchor="middle" x="1740.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1751,-1664 1751,-1733 "/>
<text text-anchor="middle" x="1806" y="-1717.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1751,-1710 1861,-1710 "/>
<text text-anchor="middle" x="1806" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_id</text>
<polyline fill="none" stroke="#000000" points="1751,-1687 1861,-1687 "/>
<text text-anchor="middle" x="1806" y="-1671.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1861,-1664 1861,-1733 "/>
<text text-anchor="middle" x="1871.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge3" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1782.5,-2123.308C1782.5,-2058.6522 1782.5,-1838.7386 1782.5,-1743.3021"/>
<polygon fill="#000000" stroke="#000000" points="1786.0001,-1743.1086 1782.5,-1733.1086 1779.0001,-1743.1087 1786.0001,-1743.1086"/>
<text text-anchor="middle" x="1810.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- follow_up -->
<g id="node6" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M727.5,-1370.5C727.5,-1370.5 1059.5,-1370.5 1059.5,-1370.5 1065.5,-1370.5 1071.5,-1376.5 1071.5,-1382.5 1071.5,-1382.5 1071.5,-1542.5 1071.5,-1542.5 1071.5,-1548.5 1065.5,-1554.5 1059.5,-1554.5 1059.5,-1554.5 727.5,-1554.5 727.5,-1554.5 721.5,-1554.5 715.5,-1548.5 715.5,-1542.5 715.5,-1542.5 715.5,-1382.5 715.5,-1382.5 715.5,-1376.5 721.5,-1370.5 727.5,-1370.5"/>
<text text-anchor="middle" x="758" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="800.5,-1370.5 800.5,-1554.5 "/>
<text text-anchor="middle" x="811" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="821.5,-1370.5 821.5,-1554.5 "/>
<text text-anchor="middle" x="936" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="821.5,-1531.5 1050.5,-1531.5 "/>
<text text-anchor="middle" x="936" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="821.5,-1508.5 1050.5,-1508.5 "/>
<text text-anchor="middle" x="936" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="821.5,-1485.5 1050.5,-1485.5 "/>
<text text-anchor="middle" x="936" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="821.5,-1462.5 1050.5,-1462.5 "/>
<text text-anchor="middle" x="936" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="821.5,-1439.5 1050.5,-1439.5 "/>
<text text-anchor="middle" x="936" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="821.5,-1416.5 1050.5,-1416.5 "/>
<text text-anchor="middle" x="936" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="821.5,-1393.5 1050.5,-1393.5 "/>
<text text-anchor="middle" x="936" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1050.5,-1370.5 1050.5,-1554.5 "/>
<text text-anchor="middle" x="1061" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge20" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1071.746,-1373.1484C1074.6745,-1372.0667 1077.5938,-1371.0161 1080.5,-1370 1166.8439,-1339.8116 1267.6034,-1318.1374 1346.007,-1304.0991"/>
<polygon fill="#000000" stroke="#000000" points="1346.705,-1307.5301 1355.9414,-1302.3397 1345.4842,-1300.6373 1346.705,-1307.5301"/>
<text text-anchor="middle" x="1214.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- demographic -->
<g id="node7" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1101.5,-1370.5C1101.5,-1370.5 1437.5,-1370.5 1437.5,-1370.5 1443.5,-1370.5 1449.5,-1376.5 1449.5,-1382.5 1449.5,-1382.5 1449.5,-1542.5 1449.5,-1542.5 1449.5,-1548.5 1443.5,-1554.5 1437.5,-1554.5 1437.5,-1554.5 1101.5,-1554.5 1101.5,-1554.5 1095.5,-1554.5 1089.5,-1548.5 1089.5,-1542.5 1089.5,-1542.5 1089.5,-1382.5 1089.5,-1382.5 1089.5,-1376.5 1095.5,-1370.5 1101.5,-1370.5"/>
<text text-anchor="middle" x="1144.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1199.5,-1370.5 1199.5,-1554.5 "/>
<text text-anchor="middle" x="1210" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1220.5,-1370.5 1220.5,-1554.5 "/>
<text text-anchor="middle" x="1324.5" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">additional_breed_detail</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1531.5 1428.5,-1531.5 "/>
<text text-anchor="middle" x="1324.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1508.5 1428.5,-1508.5 "/>
<text text-anchor="middle" x="1324.5" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1485.5 1428.5,-1485.5 "/>
<text text-anchor="middle" x="1324.5" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic_id</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1462.5 1428.5,-1462.5 "/>
<text text-anchor="middle" x="1324.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1439.5 1428.5,-1439.5 "/>
<text text-anchor="middle" x="1324.5" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1416.5 1428.5,-1416.5 "/>
<text text-anchor="middle" x="1324.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1220.5,-1393.5 1428.5,-1393.5 "/>
<text text-anchor="middle" x="1324.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1428.5,-1370.5 1428.5,-1554.5 "/>
<text text-anchor="middle" x="1439" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge19" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1370.8603,-1370.1664C1383.7504,-1358.8607 1396.8546,-1347.5745 1409.5,-1337 1414.2472,-1333.0302 1419.2346,-1328.9604 1424.2608,-1324.9262"/>
<polygon fill="#000000" stroke="#000000" points="1426.5186,-1327.6025 1432.1623,-1318.6359 1422.1588,-1322.126 1426.5186,-1327.6025"/>
<text text-anchor="middle" x="1436.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_surgery -->
<g id="node8" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2900.5,-2072.5C2900.5,-2072.5 3246.5,-2072.5 3246.5,-2072.5 3252.5,-2072.5 3258.5,-2078.5 3258.5,-2084.5 3258.5,-2084.5 3258.5,-2198.5 3258.5,-2198.5 3258.5,-2204.5 3252.5,-2210.5 3246.5,-2210.5 3246.5,-2210.5 2900.5,-2210.5 2900.5,-2210.5 2894.5,-2210.5 2888.5,-2204.5 2888.5,-2198.5 2888.5,-2198.5 2888.5,-2084.5 2888.5,-2084.5 2888.5,-2078.5 2894.5,-2072.5 2900.5,-2072.5"/>
<text text-anchor="middle" x="2946" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="3003.5,-2072.5 3003.5,-2210.5 "/>
<text text-anchor="middle" x="3014" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3024.5,-2072.5 3024.5,-2210.5 "/>
<text text-anchor="middle" x="3131" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="3024.5,-2187.5 3237.5,-2187.5 "/>
<text text-anchor="middle" x="3131" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="3024.5,-2164.5 3237.5,-2164.5 "/>
<text text-anchor="middle" x="3131" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="3024.5,-2141.5 3237.5,-2141.5 "/>
<text text-anchor="middle" x="3131" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="3024.5,-2118.5 3237.5,-2118.5 "/>
<text text-anchor="middle" x="3131" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="3024.5,-2095.5 3237.5,-2095.5 "/>
<text text-anchor="middle" x="3131" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="3237.5,-2072.5 3237.5,-2210.5 "/>
<text text-anchor="middle" x="3248" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge42" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M3258.613,-2183.5585C3269.7907,-2173.5547 3276.5,-2159.5352 3276.5,-2141.5 3276.5,-2127.5509 3272.4865,-2116.004 3265.4962,-2106.8593"/>
<polygon fill="#000000" stroke="#000000" points="3267.9806,-2104.3911 3258.613,-2099.4415 3262.8494,-2109.1525 3267.9806,-2104.3911"/>
<text text-anchor="middle" x="3292.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node28" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2662.5,-1606.5C2662.5,-1606.5 2984.5,-1606.5 2984.5,-1606.5 2990.5,-1606.5 2996.5,-1612.5 2996.5,-1618.5 2996.5,-1618.5 2996.5,-1778.5 2996.5,-1778.5 2996.5,-1784.5 2990.5,-1790.5 2984.5,-1790.5 2984.5,-1790.5 2662.5,-1790.5 2662.5,-1790.5 2656.5,-1790.5 2650.5,-1784.5 2650.5,-1778.5 2650.5,-1778.5 2650.5,-1618.5 2650.5,-1618.5 2650.5,-1612.5 2656.5,-1606.5 2662.5,-1606.5"/>
<text text-anchor="middle" x="2698" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2745.5,-1606.5 2745.5,-1790.5 "/>
<text text-anchor="middle" x="2756" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2766.5,-1606.5 2766.5,-1790.5 "/>
<text text-anchor="middle" x="2871" y="-1775.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1767.5 2975.5,-1767.5 "/>
<text text-anchor="middle" x="2871" y="-1752.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1744.5 2975.5,-1744.5 "/>
<text text-anchor="middle" x="2871" y="-1729.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_id</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1721.5 2975.5,-1721.5 "/>
<text text-anchor="middle" x="2871" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1698.5 2975.5,-1698.5 "/>
<text text-anchor="middle" x="2871" y="-1683.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1675.5 2975.5,-1675.5 "/>
<text text-anchor="middle" x="2871" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1652.5 2975.5,-1652.5 "/>
<text text-anchor="middle" x="2871" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2766.5,-1629.5 2975.5,-1629.5 "/>
<text text-anchor="middle" x="2871" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2975.5,-1606.5 2975.5,-1790.5 "/>
<text text-anchor="middle" x="2986" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge48" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M3038.1739,-2072.1832C3003.123,-2004.3169 2947.1696,-1898.3835 2894.5,-1809 2892.6243,-1805.8168 2890.7016,-1802.5938 2888.7453,-1799.349"/>
<polygon fill="#000000" stroke="#000000" points="2891.6845,-1797.446 2883.498,-1790.7206 2885.7037,-1801.0833 2891.6845,-1797.446"/>
<text text-anchor="middle" x="2949.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge17" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1216.1251,-2459.2013C1239.5877,-2300.2509 1282.1057,-2051.4713 1343.5,-1842 1382.1492,-1710.1326 1427.7681,-1688.934 1458.5,-1555 1476.3986,-1476.9955 1478.9171,-1383.334 1478.5808,-1329.0436"/>
<polygon fill="#000000" stroke="#000000" points="1482.0776,-1328.6918 1478.4792,-1318.7268 1475.0779,-1328.7608 1482.0776,-1328.6918"/>
<text text-anchor="middle" x="1471.5" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent_administration -->
<g id="node10" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M431,-1911.5C431,-1911.5 900,-1911.5 900,-1911.5 906,-1911.5 912,-1917.5 912,-1923.5 912,-1923.5 912,-2359.5 912,-2359.5 912,-2365.5 906,-2371.5 900,-2371.5 900,-2371.5 431,-2371.5 431,-2371.5 425,-2371.5 419,-2365.5 419,-2359.5 419,-2359.5 419,-1923.5 419,-1923.5 419,-1917.5 425,-1911.5 431,-1911.5"/>
<text text-anchor="middle" x="504" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="589,-1911.5 589,-2371.5 "/>
<text text-anchor="middle" x="599.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="610,-1911.5 610,-2371.5 "/>
<text text-anchor="middle" x="750.5" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="610,-2348.5 891,-2348.5 "/>
<text text-anchor="middle" x="750.5" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="610,-2325.5 891,-2325.5 "/>
<text text-anchor="middle" x="750.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="610,-2302.5 891,-2302.5 "/>
<text text-anchor="middle" x="750.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="610,-2279.5 891,-2279.5 "/>
<text text-anchor="middle" x="750.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="610,-2256.5 891,-2256.5 "/>
<text text-anchor="middle" x="750.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="610,-2233.5 891,-2233.5 "/>
<text text-anchor="middle" x="750.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="610,-2210.5 891,-2210.5 "/>
<text text-anchor="middle" x="750.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="610,-2187.5 891,-2187.5 "/>
<text text-anchor="middle" x="750.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="610,-2164.5 891,-2164.5 "/>
<text text-anchor="middle" x="750.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="610,-2141.5 891,-2141.5 "/>
<text text-anchor="middle" x="750.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="610,-2118.5 891,-2118.5 "/>
<text text-anchor="middle" x="750.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="610,-2095.5 891,-2095.5 "/>
<text text-anchor="middle" x="750.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="610,-2072.5 891,-2072.5 "/>
<text text-anchor="middle" x="750.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="610,-2049.5 891,-2049.5 "/>
<text text-anchor="middle" x="750.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="610,-2026.5 891,-2026.5 "/>
<text text-anchor="middle" x="750.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="610,-2003.5 891,-2003.5 "/>
<text text-anchor="middle" x="750.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="610,-1980.5 891,-1980.5 "/>
<text text-anchor="middle" x="750.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="610,-1957.5 891,-1957.5 "/>
<text text-anchor="middle" x="750.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="610,-1934.5 891,-1934.5 "/>
<text text-anchor="middle" x="750.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="891,-1911.5 891,-2371.5 "/>
<text text-anchor="middle" x="901.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent -->
<g id="node11" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M565.5,-651C565.5,-651 791.5,-651 791.5,-651 797.5,-651 803.5,-657 803.5,-663 803.5,-663 803.5,-685 803.5,-685 803.5,-691 797.5,-697 791.5,-697 791.5,-697 565.5,-697 565.5,-697 559.5,-697 553.5,-691 553.5,-685 553.5,-685 553.5,-663 553.5,-663 553.5,-657 559.5,-651 565.5,-651"/>
<text text-anchor="middle" x="582" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="610.5,-651 610.5,-697 "/>
<text text-anchor="middle" x="621" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="631.5,-651 631.5,-697 "/>
<text text-anchor="middle" x="707" y="-681.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="631.5,-674 782.5,-674 "/>
<text text-anchor="middle" x="707" y="-658.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="782.5,-651 782.5,-697 "/>
<text text-anchor="middle" x="793" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge31" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M626.0036,-1911.3878C617.2413,-1843.0816 610.5,-1767.9596 610.5,-1698.5 610.5,-1698.5 610.5,-1698.5 610.5,-979 610.5,-881.3385 599.2365,-853.1742 628.5,-760 634.5131,-740.8544 645.3684,-721.3715 655.4314,-705.8018"/>
<polygon fill="#000000" stroke="#000000" points="658.5856,-707.3804 661.2222,-697.1189 652.7619,-703.4964 658.5856,-707.3804"/>
<text text-anchor="middle" x="641.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge6" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M912.1702,-2025.4185C1039.6744,-1967.2393 1198.5561,-1897.5437 1343.5,-1842 1454.211,-1799.5746 1583.485,-1758.2854 1672.9444,-1730.9732"/>
<polygon fill="#000000" stroke="#000000" points="1674.0156,-1734.3058 1682.562,-1728.044 1671.9761,-1727.6095 1674.0156,-1734.3058"/>
<text text-anchor="middle" x="1454.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge9" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M678.5,-650.7201C678.5,-630.7494 678.5,-601.1435 678.5,-575.0066"/>
<polygon fill="#000000" stroke="#000000" points="682.0001,-574.8121 678.5,-564.8122 675.0001,-574.8122 682.0001,-574.8121"/>
<text text-anchor="middle" x="727" y="-609.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge44" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1672.2452,-2185.6053C1683.2813,-2175.5025 1690,-2160.8008 1690,-2141.5 1690,-2126.5721 1685.9808,-2114.3953 1679.0535,-2104.9696"/>
<polygon fill="#000000" stroke="#000000" points="1681.5331,-2102.4925 1672.2452,-2097.3947 1676.3269,-2107.1718 1681.5331,-2102.4925"/>
<text text-anchor="middle" x="1706" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge4" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1638.8042,-1934.2676C1682.9376,-1861.856 1728.3156,-1787.4026 1755.9664,-1742.0348"/>
<polygon fill="#000000" stroke="#000000" points="1759.0388,-1743.7188 1761.2546,-1733.3582 1753.0615,-1740.0757 1759.0388,-1743.7188"/>
<text text-anchor="middle" x="1738.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge13" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1520.2329,-1934.1291C1523.1556,-1771.0039 1520.3301,-1538.411 1491.5,-1337 1491.0954,-1334.1737 1490.5934,-1331.282 1490.0224,-1328.379"/>
<polygon fill="#000000" stroke="#000000" points="1493.4253,-1327.5571 1487.8561,-1318.5441 1486.5892,-1329.0629 1493.4253,-1327.5571"/>
<text text-anchor="middle" x="1542.5" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node13" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M3338.5,-1842.5C3338.5,-1842.5 3794.5,-1842.5 3794.5,-1842.5 3800.5,-1842.5 3806.5,-1848.5 3806.5,-1854.5 3806.5,-1854.5 3806.5,-2428.5 3806.5,-2428.5 3806.5,-2434.5 3800.5,-2440.5 3794.5,-2440.5 3794.5,-2440.5 3338.5,-2440.5 3338.5,-2440.5 3332.5,-2440.5 3326.5,-2434.5 3326.5,-2428.5 3326.5,-2428.5 3326.5,-1854.5 3326.5,-1854.5 3326.5,-1848.5 3332.5,-1842.5 3338.5,-1842.5"/>
<text text-anchor="middle" x="3384" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="3441.5,-1842.5 3441.5,-2440.5 "/>
<text text-anchor="middle" x="3452" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3462.5,-1842.5 3462.5,-2440.5 "/>
<text text-anchor="middle" x="3624" y="-2425.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2417.5 3785.5,-2417.5 "/>
<text text-anchor="middle" x="3624" y="-2402.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2394.5 3785.5,-2394.5 "/>
<text text-anchor="middle" x="3624" y="-2379.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2371.5 3785.5,-2371.5 "/>
<text text-anchor="middle" x="3624" y="-2356.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response_to_prior_therapy</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2348.5 3785.5,-2348.5 "/>
<text text-anchor="middle" x="3624" y="-2333.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2325.5 3785.5,-2325.5 "/>
<text text-anchor="middle" x="3624" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2302.5 3785.5,-2302.5 "/>
<text text-anchor="middle" x="3624" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2279.5 3785.5,-2279.5 "/>
<text text-anchor="middle" x="3624" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2256.5 3785.5,-2256.5 "/>
<text text-anchor="middle" x="3624" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2233.5 3785.5,-2233.5 "/>
<text text-anchor="middle" x="3624" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2210.5 3785.5,-2210.5 "/>
<text text-anchor="middle" x="3624" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2187.5 3785.5,-2187.5 "/>
<text text-anchor="middle" x="3624" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2164.5 3785.5,-2164.5 "/>
<text text-anchor="middle" x="3624" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2141.5 3785.5,-2141.5 "/>
<text text-anchor="middle" x="3624" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2118.5 3785.5,-2118.5 "/>
<text text-anchor="middle" x="3624" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2095.5 3785.5,-2095.5 "/>
<text text-anchor="middle" x="3624" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2072.5 3785.5,-2072.5 "/>
<text text-anchor="middle" x="3624" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2049.5 3785.5,-2049.5 "/>
<text text-anchor="middle" x="3624" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2026.5 3785.5,-2026.5 "/>
<text text-anchor="middle" x="3624" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="3462.5,-2003.5 3785.5,-2003.5 "/>
<text text-anchor="middle" x="3624" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="3462.5,-1980.5 3785.5,-1980.5 "/>
<text text-anchor="middle" x="3624" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3462.5,-1957.5 3785.5,-1957.5 "/>
<text text-anchor="middle" x="3624" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="3462.5,-1934.5 3785.5,-1934.5 "/>
<text text-anchor="middle" x="3624" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="3462.5,-1911.5 3785.5,-1911.5 "/>
<text text-anchor="middle" x="3624" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="3462.5,-1888.5 3785.5,-1888.5 "/>
<text text-anchor="middle" x="3624" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="3462.5,-1865.5 3785.5,-1865.5 "/>
<text text-anchor="middle" x="3624" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="3785.5,-1842.5 3785.5,-2440.5 "/>
<text text-anchor="middle" x="3796" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge43" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3806.7384,-2179.6912C3817.9387,-2170.0507 3824.5,-2157.3203 3824.5,-2141.5 3824.5,-2129.3876 3820.6539,-2119.0864 3813.8244,-2110.5965"/>
<polygon fill="#000000" stroke="#000000" points="3816.219,-2108.0385 3806.7384,-2103.3088 3811.2002,-2112.9183 3816.219,-2108.0385"/>
<text text-anchor="middle" x="3840.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge49" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M3326.3569,-1847.9719C3323.422,-1845.9369 3320.4695,-1843.9454 3317.5,-1842 3224.4196,-1781.0224 3104.9256,-1745.4085 3006.778,-1724.9135"/>
<polygon fill="#000000" stroke="#000000" points="3007.2427,-1721.436 2996.7433,-1722.855 3005.836,-1728.2932 3007.2427,-1721.436"/>
<text text-anchor="middle" x="3331.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge41" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1882.3627,-1716.9735C1893.0961,-1713.4156 1900,-1707.2578 1900,-1698.5 1900,-1692.6158 1896.8835,-1687.9054 1891.5829,-1684.3685"/>
<polygon fill="#000000" stroke="#000000" points="1892.9009,-1681.1206 1882.3627,-1680.0265 1889.9185,-1687.4535 1892.9009,-1681.1206"/>
<text text-anchor="middle" x="1916" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge12" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1717.8081,-1663.878C1676.651,-1638.7496 1625.2975,-1601.1334 1593.5,-1555 1536.1943,-1471.858 1580.61,-1424.088 1529.5,-1337 1527.4662,-1333.5345 1525.1567,-1330.1271 1522.6687,-1326.8151"/>
<polygon fill="#000000" stroke="#000000" points="1525.1881,-1324.3649 1516.1724,-1318.8 1519.75,-1328.7726 1525.1881,-1324.3649"/>
<text text-anchor="middle" x="1620.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle -->
<g id="node26" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1668.5,-1428C1668.5,-1428 1896.5,-1428 1896.5,-1428 1902.5,-1428 1908.5,-1434 1908.5,-1440 1908.5,-1440 1908.5,-1485 1908.5,-1485 1908.5,-1491 1902.5,-1497 1896.5,-1497 1896.5,-1497 1668.5,-1497 1668.5,-1497 1662.5,-1497 1656.5,-1491 1656.5,-1485 1656.5,-1485 1656.5,-1440 1656.5,-1440 1656.5,-1434 1662.5,-1428 1668.5,-1428"/>
<text text-anchor="middle" x="1683.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1710.5,-1428 1710.5,-1497 "/>
<text text-anchor="middle" x="1721" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1731.5,-1428 1731.5,-1497 "/>
<text text-anchor="middle" x="1809.5" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1731.5,-1474 1887.5,-1474 "/>
<text text-anchor="middle" x="1809.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1731.5,-1451 1887.5,-1451 "/>
<text text-anchor="middle" x="1809.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1887.5,-1428 1887.5,-1497 "/>
<text text-anchor="middle" x="1898" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge22" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1782.5,-1663.9308C1782.5,-1622.4774 1782.5,-1552.8993 1782.5,-1507.345"/>
<polygon fill="#000000" stroke="#000000" points="1786.0001,-1507.1616 1782.5,-1497.1617 1779.0001,-1507.1617 1786.0001,-1507.1616"/>
<text text-anchor="middle" x="1812" y="-1576.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- program -->
<g id="node15" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1012.5,-.5C1012.5,-.5 1320.5,-.5 1320.5,-.5 1326.5,-.5 1332.5,-6.5 1332.5,-12.5 1332.5,-12.5 1332.5,-126.5 1332.5,-126.5 1332.5,-132.5 1326.5,-138.5 1320.5,-138.5 1320.5,-138.5 1012.5,-138.5 1012.5,-138.5 1006.5,-138.5 1000.5,-132.5 1000.5,-126.5 1000.5,-126.5 1000.5,-12.5 1000.5,-12.5 1000.5,-6.5 1006.5,-.5 1012.5,-.5"/>
<text text-anchor="middle" x="1039.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1078.5,-.5 1078.5,-138.5 "/>
<text text-anchor="middle" x="1089" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1099.5,-.5 1099.5,-138.5 "/>
<text text-anchor="middle" x="1205.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1099.5,-115.5 1311.5,-115.5 "/>
<text text-anchor="middle" x="1205.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1099.5,-92.5 1311.5,-92.5 "/>
<text text-anchor="middle" x="1205.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1099.5,-69.5 1311.5,-69.5 "/>
<text text-anchor="middle" x="1205.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1099.5,-46.5 1311.5,-46.5 "/>
<text text-anchor="middle" x="1205.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1099.5,-23.5 1311.5,-23.5 "/>
<text text-anchor="middle" x="1205.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1311.5,-.5 1311.5,-138.5 "/>
<text text-anchor="middle" x="1322" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- canine_individual -->
<g id="node16" class="node">
<title>canine_individual</title>
<path fill="none" stroke="#000000" d="M1419,-961C1419,-961 1742,-961 1742,-961 1748,-961 1754,-967 1754,-973 1754,-973 1754,-985 1754,-985 1754,-991 1748,-997 1742,-997 1742,-997 1419,-997 1419,-997 1413,-997 1407,-991 1407,-985 1407,-985 1407,-973 1407,-973 1407,-967 1413,-961 1419,-961"/>
<text text-anchor="middle" x="1478" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual</text>
<polyline fill="none" stroke="#000000" points="1549,-961 1549,-997 "/>
<text text-anchor="middle" x="1559.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1570,-961 1570,-997 "/>
<text text-anchor="middle" x="1651.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">canine_individual_id</text>
<polyline fill="none" stroke="#000000" points="1733,-961 1733,-997 "/>
<text text-anchor="middle" x="1743.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site -->
<g id="node17" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M905,-484C905,-484 1222,-484 1222,-484 1228,-484 1234,-490 1234,-496 1234,-496 1234,-541 1234,-541 1234,-547 1228,-553 1222,-553 1222,-553 905,-553 905,-553 899,-553 893,-547 893,-541 893,-541 893,-496 893,-496 893,-490 899,-484 905,-484"/>
<text text-anchor="middle" x="938" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="983,-484 983,-553 "/>
<text text-anchor="middle" x="993.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1004,-484 1004,-553 "/>
<text text-anchor="middle" x="1108.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1004,-530 1213,-530 "/>
<text text-anchor="middle" x="1108.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1004,-507 1213,-507 "/>
<text text-anchor="middle" x="1108.5" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1213,-484 1213,-553 "/>
<text text-anchor="middle" x="1223.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge34" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1079.368,-483.9139C1088.9918,-462.9377 1101.8717,-434.8646 1114.7708,-406.7497"/>
<polygon fill="#000000" stroke="#000000" points="1117.9664,-408.1775 1118.9553,-397.6289 1111.6041,-405.2584 1117.9664,-408.1775"/>
<text text-anchor="middle" x="1140" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- cohort -->
<g id="node18" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M979,-639.5C979,-639.5 1212,-639.5 1212,-639.5 1218,-639.5 1224,-645.5 1224,-651.5 1224,-651.5 1224,-696.5 1224,-696.5 1224,-702.5 1218,-708.5 1212,-708.5 1212,-708.5 979,-708.5 979,-708.5 973,-708.5 967,-702.5 967,-696.5 967,-696.5 967,-651.5 967,-651.5 967,-645.5 973,-639.5 979,-639.5"/>
<text text-anchor="middle" x="998.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1030,-639.5 1030,-708.5 "/>
<text text-anchor="middle" x="1040.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1051,-639.5 1051,-708.5 "/>
<text text-anchor="middle" x="1127" y="-693.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1051,-685.5 1203,-685.5 "/>
<text text-anchor="middle" x="1127" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1051,-662.5 1203,-662.5 "/>
<text text-anchor="middle" x="1127" y="-647.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_id</text>
<polyline fill="none" stroke="#000000" points="1203,-639.5 1203,-708.5 "/>
<text text-anchor="middle" x="1213.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge29" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1002.9542,-639.4895C946.6959,-618.5107 873.923,-591.3735 811.5585,-568.1177"/>
<polygon fill="#000000" stroke="#000000" points="812.6327,-564.7829 802.04,-564.5683 810.1868,-571.3417 812.6327,-564.7829"/>
<text text-anchor="middle" x="990" y="-609.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge28" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1187.9072,-639.3291C1209.59,-626.6061 1229.9964,-609.8012 1242.5,-588 1274.1779,-532.7666 1259.0496,-464.2114 1234.229,-407.1981"/>
<polygon fill="#000000" stroke="#000000" points="1237.2916,-405.4744 1230,-397.7878 1230.9068,-408.3438 1237.2916,-405.4744"/>
<text text-anchor="middle" x="1301" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node19" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1784,-875.5C1784,-875.5 2199,-875.5 2199,-875.5 2205,-875.5 2211,-881.5 2211,-887.5 2211,-887.5 2211,-1070.5 2211,-1070.5 2211,-1076.5 2205,-1082.5 2199,-1082.5 2199,-1082.5 1784,-1082.5 1784,-1082.5 1778,-1082.5 1772,-1076.5 1772,-1070.5 1772,-1070.5 1772,-887.5 1772,-887.5 1772,-881.5 1778,-875.5 1784,-875.5"/>
<text text-anchor="middle" x="1813.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1855,-875.5 1855,-1082.5 "/>
<text text-anchor="middle" x="1865.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1876,-875.5 1876,-1082.5 "/>
<text text-anchor="middle" x="2033" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1876,-1059.5 2190,-1059.5 "/>
<text text-anchor="middle" x="2033" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1876,-1036.5 2190,-1036.5 "/>
<text text-anchor="middle" x="2033" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1876,-1013.5 2190,-1013.5 "/>
<text text-anchor="middle" x="2033" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1876,-990.5 2190,-990.5 "/>
<text text-anchor="middle" x="2033" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1876,-967.5 2190,-967.5 "/>
<text text-anchor="middle" x="2033" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1876,-944.5 2190,-944.5 "/>
<text text-anchor="middle" x="2033" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1876,-921.5 2190,-921.5 "/>
<text text-anchor="middle" x="2033" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1876,-898.5 2190,-898.5 "/>
<text text-anchor="middle" x="2033" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2190,-875.5 2190,-1082.5 "/>
<text text-anchor="middle" x="2200.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge8" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1385.1238,-1249.4074C1377.7908,-1244.0733 1371.078,-1237.9702 1365.5,-1231 1323.3764,-1178.3626 1281.4836,-685.3218 1232.5,-639 1175.5518,-585.1464 959.9427,-605.3153 883.5,-588 859.4754,-582.5581 834.3136,-575.3465 810.1722,-567.6281"/>
<polygon fill="#000000" stroke="#000000" points="811.2093,-564.2851 800.6173,-564.5307 809.0506,-570.9439 811.2093,-564.2851"/>
<text text-anchor="middle" x="1316" y="-730.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- case&#45;&gt;canine_individual -->
<g id="edge37" class="edge">
<title>case&#45;&gt;canine_individual</title>
<path fill="none" stroke="#000000" d="M1489.2151,-1249.3096C1509.8643,-1188.1639 1552.3319,-1062.4105 1571.1594,-1006.6592"/>
<polygon fill="#000000" stroke="#000000" points="1574.5056,-1007.6894 1574.3892,-997.0952 1567.8735,-1005.4497 1574.5056,-1007.6894"/>
<text text-anchor="middle" x="1539.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">represents</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge26" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1355.5962,-1267.077C1275.6583,-1253.1588 1181.6264,-1230.4206 1157.5,-1198 1099.1252,-1119.5572 1131.2757,-856.4988 1115.5,-760 1113.273,-746.3776 1110.1382,-731.698 1107.0097,-718.3905"/>
<polygon fill="#000000" stroke="#000000" points="1110.3773,-717.4248 1104.6337,-708.5219 1103.5717,-719.0633 1110.3773,-717.4248"/>
<text text-anchor="middle" x="1198" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge10" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1599.119,-1260.6647C1651.6996,-1247.2731 1712.5004,-1227.1664 1762.5,-1198 1811.3709,-1169.4921 1857.9355,-1128.5427 1896.159,-1089.75"/>
<polygon fill="#000000" stroke="#000000" points="1898.7198,-1092.1371 1903.1978,-1082.5351 1893.7093,-1087.2489 1898.7198,-1092.1371"/>
<text text-anchor="middle" x="1782" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge25" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1435.018,-1249.1532C1420.5875,-1234.8899 1405.9807,-1217.2152 1397.5,-1198 1358.0668,-1108.6535 1379.5,-1076.6615 1379.5,-979 1379.5,-979 1379.5,-979 1379.5,-518.5 1379.5,-473.4209 1356.6194,-433.7753 1325.8564,-400.844"/>
<polygon fill="#000000" stroke="#000000" points="1328.2138,-398.2467 1318.7478,-393.4879 1323.1801,-403.1111 1328.2138,-398.2467"/>
<text text-anchor="middle" x="1420" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node31" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M650,-760.5C650,-760.5 1045,-760.5 1045,-760.5 1051,-760.5 1057,-766.5 1057,-772.5 1057,-772.5 1057,-1185.5 1057,-1185.5 1057,-1191.5 1051,-1197.5 1045,-1197.5 1045,-1197.5 650,-1197.5 650,-1197.5 644,-1197.5 638,-1191.5 638,-1185.5 638,-1185.5 638,-772.5 638,-772.5 638,-766.5 644,-760.5 650,-760.5"/>
<text text-anchor="middle" x="698" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="758,-760.5 758,-1197.5 "/>
<text text-anchor="middle" x="768.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="779,-760.5 779,-1197.5 "/>
<text text-anchor="middle" x="907.5" y="-1182.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_agent_dose</text>
<polyline fill="none" stroke="#000000" points="779,-1174.5 1036,-1174.5 "/>
<text text-anchor="middle" x="907.5" y="-1159.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_agent_name</text>
<polyline fill="none" stroke="#000000" points="779,-1151.5 1036,-1151.5 "/>
<text text-anchor="middle" x="907.5" y="-1136.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="779,-1128.5 1036,-1128.5 "/>
<text text-anchor="middle" x="907.5" y="-1113.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="779,-1105.5 1036,-1105.5 "/>
<text text-anchor="middle" x="907.5" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="779,-1082.5 1036,-1082.5 "/>
<text text-anchor="middle" x="907.5" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="779,-1059.5 1036,-1059.5 "/>
<text text-anchor="middle" x="907.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="779,-1036.5 1036,-1036.5 "/>
<text text-anchor="middle" x="907.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="779,-1013.5 1036,-1013.5 "/>
<text text-anchor="middle" x="907.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="779,-990.5 1036,-990.5 "/>
<text text-anchor="middle" x="907.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="779,-967.5 1036,-967.5 "/>
<text text-anchor="middle" x="907.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="779,-944.5 1036,-944.5 "/>
<text text-anchor="middle" x="907.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_onset</text>
<polyline fill="none" stroke="#000000" points="779,-921.5 1036,-921.5 "/>
<text text-anchor="middle" x="907.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_resolution</text>
<polyline fill="none" stroke="#000000" points="779,-898.5 1036,-898.5 "/>
<text text-anchor="middle" x="907.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="779,-875.5 1036,-875.5 "/>
<text text-anchor="middle" x="907.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="779,-852.5 1036,-852.5 "/>
<text text-anchor="middle" x="907.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">existing_adverse_event</text>
<polyline fill="none" stroke="#000000" points="779,-829.5 1036,-829.5 "/>
<text text-anchor="middle" x="907.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ongoing_adverse_event</text>
<polyline fill="none" stroke="#000000" points="779,-806.5 1036,-806.5 "/>
<text text-anchor="middle" x="907.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">other_attribution_description</text>
<polyline fill="none" stroke="#000000" points="779,-783.5 1036,-783.5 "/>
<text text-anchor="middle" x="907.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1036,-760.5 1036,-1197.5 "/>
<text text-anchor="middle" x="1046.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge23" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1355.9961,-1280.0234C1199.4866,-1273.7834 943.527,-1259.3596 910.5,-1231 901.9212,-1223.6335 894.4184,-1215.2925 887.8634,-1206.2386"/>
<polygon fill="#000000" stroke="#000000" points="890.6093,-1204.0512 882.1061,-1197.7309 884.8119,-1207.9744 890.6093,-1204.0512"/>
<text text-anchor="middle" x="979.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- off_treatment -->
<g id="node33" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2241,-887C2241,-887 2688,-887 2688,-887 2694,-887 2700,-893 2700,-899 2700,-899 2700,-1059 2700,-1059 2700,-1065 2694,-1071 2688,-1071 2688,-1071 2241,-1071 2241,-1071 2235,-1071 2229,-1065 2229,-1059 2229,-1059 2229,-899 2229,-899 2229,-893 2235,-887 2241,-887"/>
<text text-anchor="middle" x="2286.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2344,-887 2344,-1071 "/>
<text text-anchor="middle" x="2354.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2365,-887 2365,-1071 "/>
<text text-anchor="middle" x="2522" y="-1055.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2365,-1048 2679,-1048 "/>
<text text-anchor="middle" x="2522" y="-1032.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2365,-1025 2679,-1025 "/>
<text text-anchor="middle" x="2522" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2365,-1002 2679,-1002 "/>
<text text-anchor="middle" x="2522" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2365,-979 2679,-979 "/>
<text text-anchor="middle" x="2522" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2365,-956 2679,-956 "/>
<text text-anchor="middle" x="2522" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2365,-933 2679,-933 "/>
<text text-anchor="middle" x="2522" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2365,-910 2679,-910 "/>
<text text-anchor="middle" x="2522" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2679,-887 2679,-1071 "/>
<text text-anchor="middle" x="2689.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge7" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1599.3557,-1278.8411C1780.864,-1269.6581 2112.4685,-1246.6779 2220.5,-1198 2281.2122,-1170.6437 2337.3907,-1122.5558 2380.5006,-1078.3971"/>
<polygon fill="#000000" stroke="#000000" points="2383.1523,-1080.6894 2387.5774,-1071.0629 2378.115,-1075.8288 2383.1523,-1080.6894"/>
<text text-anchor="middle" x="2234.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- disease_extent -->
<g id="node21" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1854.5,-2003.5C1854.5,-2003.5 2170.5,-2003.5 2170.5,-2003.5 2176.5,-2003.5 2182.5,-2009.5 2182.5,-2015.5 2182.5,-2015.5 2182.5,-2267.5 2182.5,-2267.5 2182.5,-2273.5 2176.5,-2279.5 2170.5,-2279.5 2170.5,-2279.5 1854.5,-2279.5 1854.5,-2279.5 1848.5,-2279.5 1842.5,-2273.5 1842.5,-2267.5 1842.5,-2267.5 1842.5,-2015.5 1842.5,-2015.5 1842.5,-2009.5 1848.5,-2003.5 1854.5,-2003.5"/>
<text text-anchor="middle" x="1904" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1965.5,-2003.5 1965.5,-2279.5 "/>
<text text-anchor="middle" x="1976" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1986.5,-2003.5 1986.5,-2279.5 "/>
<text text-anchor="middle" x="2074" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2256.5 2161.5,-2256.5 "/>
<text text-anchor="middle" x="2074" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2233.5 2161.5,-2233.5 "/>
<text text-anchor="middle" x="2074" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2210.5 2161.5,-2210.5 "/>
<text text-anchor="middle" x="2074" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2187.5 2161.5,-2187.5 "/>
<text text-anchor="middle" x="2074" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2164.5 2161.5,-2164.5 "/>
<text text-anchor="middle" x="2074" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2141.5 2161.5,-2141.5 "/>
<text text-anchor="middle" x="2074" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2118.5 2161.5,-2118.5 "/>
<text text-anchor="middle" x="2074" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2095.5 2161.5,-2095.5 "/>
<text text-anchor="middle" x="2074" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2072.5 2161.5,-2072.5 "/>
<text text-anchor="middle" x="2074" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2049.5 2161.5,-2049.5 "/>
<text text-anchor="middle" x="2074" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1986.5,-2026.5 2161.5,-2026.5 "/>
<text text-anchor="middle" x="2074" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2161.5,-2003.5 2161.5,-2279.5 "/>
<text text-anchor="middle" x="2172" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge5" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1942.7527,-2003.1927C1912.3056,-1943.3111 1875.9773,-1872.5208 1842.5,-1809 1830.8495,-1786.894 1817.6217,-1762.4641 1806.5565,-1742.2082"/>
<polygon fill="#000000" stroke="#000000" points="1809.5083,-1740.3115 1801.638,-1733.2186 1803.3674,-1743.6713 1809.5083,-1740.3115"/>
<text text-anchor="middle" x="1875.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- vital_signs -->
<g id="node22" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M2213,-1992C2213,-1992 2500,-1992 2500,-1992 2506,-1992 2512,-1998 2512,-2004 2512,-2004 2512,-2279 2512,-2279 2512,-2285 2506,-2291 2500,-2291 2500,-2291 2213,-2291 2213,-2291 2207,-2291 2201,-2285 2201,-2279 2201,-2279 2201,-2004 2201,-2004 2201,-1998 2207,-1992 2213,-1992"/>
<text text-anchor="middle" x="2247.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="2294,-1992 2294,-2291 "/>
<text text-anchor="middle" x="2304.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2315,-1992 2315,-2291 "/>
<text text-anchor="middle" x="2403" y="-2275.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2315,-2268 2491,-2268 "/>
<text text-anchor="middle" x="2403" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="2315,-2245 2491,-2245 "/>
<text text-anchor="middle" x="2403" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="2315,-2222 2491,-2222 "/>
<text text-anchor="middle" x="2403" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="2315,-2199 2491,-2199 "/>
<text text-anchor="middle" x="2403" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="2315,-2176 2491,-2176 "/>
<text text-anchor="middle" x="2403" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="2315,-2153 2491,-2153 "/>
<text text-anchor="middle" x="2403" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="2315,-2130 2491,-2130 "/>
<text text-anchor="middle" x="2403" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2315,-2107 2491,-2107 "/>
<text text-anchor="middle" x="2403" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="2315,-2084 2491,-2084 "/>
<text text-anchor="middle" x="2403" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="2315,-2061 2491,-2061 "/>
<text text-anchor="middle" x="2403" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="2315,-2038 2491,-2038 "/>
<text text-anchor="middle" x="2403" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="2315,-2015 2491,-2015 "/>
<text text-anchor="middle" x="2403" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="2491,-1992 2491,-2291 "/>
<text text-anchor="middle" x="2501.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2300.7228,-1991.9228C2274.5223,-1938.5184 2238.5146,-1881.7885 2191.5,-1842 2105.8217,-1769.4904 1981.1366,-1732.7607 1891.9854,-1714.7322"/>
<polygon fill="#000000" stroke="#000000" points="1892.6017,-1711.2864 1882.113,-1712.7826 1891.2455,-1718.1538 1892.6017,-1711.2864"/>
<text text-anchor="middle" x="2192.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- publication -->
<g id="node23" class="node">
<title>publication</title>
<path fill="none" stroke="#000000" d="M1419.5,-449.5C1419.5,-449.5 1691.5,-449.5 1691.5,-449.5 1697.5,-449.5 1703.5,-455.5 1703.5,-461.5 1703.5,-461.5 1703.5,-575.5 1703.5,-575.5 1703.5,-581.5 1697.5,-587.5 1691.5,-587.5 1691.5,-587.5 1419.5,-587.5 1419.5,-587.5 1413.5,-587.5 1407.5,-581.5 1407.5,-575.5 1407.5,-575.5 1407.5,-461.5 1407.5,-461.5 1407.5,-455.5 1413.5,-449.5 1419.5,-449.5"/>
<text text-anchor="middle" x="1456" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">publication</text>
<polyline fill="none" stroke="#000000" points="1504.5,-449.5 1504.5,-587.5 "/>
<text text-anchor="middle" x="1515" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1525.5,-449.5 1525.5,-587.5 "/>
<text text-anchor="middle" x="1604" y="-572.3" font-family="Times,serif" font-size="14.00" fill="#000000">authorship</text>
<polyline fill="none" stroke="#000000" points="1525.5,-564.5 1682.5,-564.5 "/>
<text text-anchor="middle" x="1604" y="-549.3" font-family="Times,serif" font-size="14.00" fill="#000000">digital_object_id</text>
<polyline fill="none" stroke="#000000" points="1525.5,-541.5 1682.5,-541.5 "/>
<text text-anchor="middle" x="1604" y="-526.3" font-family="Times,serif" font-size="14.00" fill="#000000">journal_citation</text>
<polyline fill="none" stroke="#000000" points="1525.5,-518.5 1682.5,-518.5 "/>
<text text-anchor="middle" x="1604" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">publication_title</text>
<polyline fill="none" stroke="#000000" points="1525.5,-495.5 1682.5,-495.5 "/>
<text text-anchor="middle" x="1604" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">pubmed_id</text>
<polyline fill="none" stroke="#000000" points="1525.5,-472.5 1682.5,-472.5 "/>
<text text-anchor="middle" x="1604" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">year_of_publication</text>
<polyline fill="none" stroke="#000000" points="1682.5,-449.5 1682.5,-587.5 "/>
<text text-anchor="middle" x="1693" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- publication&#45;&gt;study -->
<g id="edge35" class="edge">
<title>publication&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1448.5388,-449.327C1430.3089,-437.9693 1411.4617,-426.4913 1393.5,-416 1372.3542,-403.6489 1349.8738,-391.0023 1327.596,-378.7512"/>
<polygon fill="#000000" stroke="#000000" points="1329.1899,-375.6335 1318.7387,-373.8949 1325.8246,-381.7715 1329.1899,-375.6335"/>
<text text-anchor="middle" x="1447" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge39" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1512.5,-2800.3919C1512.5,-2737.8815 1512.5,-2525.8372 1512.5,-2358.9762"/>
<polygon fill="#000000" stroke="#000000" points="1516.0001,-2358.5566 1512.5,-2348.5566 1509.0001,-2358.5566 1516.0001,-2358.5566"/>
<text text-anchor="middle" x="1549" y="-2616.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- physical_exam -->
<g id="node25" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M2542.5,-2061C2542.5,-2061 2858.5,-2061 2858.5,-2061 2864.5,-2061 2870.5,-2067 2870.5,-2073 2870.5,-2073 2870.5,-2210 2870.5,-2210 2870.5,-2216 2864.5,-2222 2858.5,-2222 2858.5,-2222 2542.5,-2222 2542.5,-2222 2536.5,-2222 2530.5,-2216 2530.5,-2210 2530.5,-2210 2530.5,-2073 2530.5,-2073 2530.5,-2067 2536.5,-2061 2542.5,-2061"/>
<text text-anchor="middle" x="2591.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="2652.5,-2061 2652.5,-2222 "/>
<text text-anchor="middle" x="2663" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2673.5,-2061 2673.5,-2222 "/>
<text text-anchor="middle" x="2761.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2673.5,-2199 2849.5,-2199 "/>
<text text-anchor="middle" x="2761.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="2673.5,-2176 2849.5,-2176 "/>
<text text-anchor="middle" x="2761.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="2673.5,-2153 2849.5,-2153 "/>
<text text-anchor="middle" x="2761.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2673.5,-2130 2849.5,-2130 "/>
<text text-anchor="middle" x="2761.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="2673.5,-2107 2849.5,-2107 "/>
<text text-anchor="middle" x="2761.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="2673.5,-2084 2849.5,-2084 "/>
<text text-anchor="middle" x="2761.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="2849.5,-2061 2849.5,-2222 "/>
<text text-anchor="middle" x="2860" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge2" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2673.7289,-2060.9204C2646.4826,-1991.8219 2597.3618,-1895.2413 2521.5,-1842 2421.3628,-1771.7218 2072.4765,-1727.4893 1892.2096,-1708.7924"/>
<polygon fill="#000000" stroke="#000000" points="1892.4749,-1705.3013 1882.1692,-1707.7594 1891.7584,-1712.2646 1892.4749,-1705.3013"/>
<text text-anchor="middle" x="2507.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge47" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2722.9171,-2060.7621C2743.2175,-1987.6476 2773.2187,-1879.5943 2795.1723,-1800.5258"/>
<polygon fill="#000000" stroke="#000000" points="2798.6406,-1801.1165 2797.9436,-1790.5447 2791.8958,-1799.2438 2798.6406,-1801.1165"/>
<text text-anchor="middle" x="2840.5" y="-1812.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge21" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1736.7601,-1427.7723C1700.4277,-1401.0691 1647.7188,-1364.2548 1598.5,-1337 1589.6816,-1332.1169 1580.3245,-1327.3482 1570.8736,-1322.7986"/>
<polygon fill="#000000" stroke="#000000" points="1572.3346,-1319.6179 1561.7981,-1318.5071 1569.3422,-1325.9461 1572.3346,-1319.6179"/>
<text text-anchor="middle" x="1646.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- principal_investigator -->
<g id="node27" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M1734,-484C1734,-484 2061,-484 2061,-484 2067,-484 2073,-490 2073,-496 2073,-496 2073,-541 2073,-541 2073,-547 2067,-553 2061,-553 2061,-553 1734,-553 1734,-553 1728,-553 1722,-547 1722,-541 1722,-541 1722,-496 1722,-496 1722,-490 1728,-484 1734,-484"/>
<text text-anchor="middle" x="1809" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1896,-484 1896,-553 "/>
<text text-anchor="middle" x="1906.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1917,-484 1917,-553 "/>
<text text-anchor="middle" x="1984.5" y="-537.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1917,-530 2052,-530 "/>
<text text-anchor="middle" x="1984.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1917,-507 2052,-507 "/>
<text text-anchor="middle" x="1984.5" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2052,-484 2052,-553 "/>
<text text-anchor="middle" x="2062.5" y="-514.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge33" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1810.0404,-483.9478C1779.3873,-472.2904 1744.6008,-459.5661 1712.5,-449 1584.6212,-406.9082 1437.7209,-365.5959 1328.5266,-336.2202"/>
<polygon fill="#000000" stroke="#000000" points="1329.31,-332.8066 1318.7444,-333.5933 1327.4945,-339.5671 1329.31,-332.8066"/>
<text text-anchor="middle" x="1685" y="-419.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge18" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2650.0227,-1692.721C2425.0949,-1681.5002 2050.1143,-1648.8784 1953.5,-1555 1893.4251,-1496.6262 1976.7059,-1429.255 1917.5,-1370 1874.9114,-1327.3761 1722.8963,-1304.8529 1609.3935,-1293.7075"/>
<polygon fill="#000000" stroke="#000000" points="1609.5151,-1290.2032 1599.2259,-1292.7292 1608.8447,-1297.171 1609.5151,-1290.2032"/>
<text text-anchor="middle" x="1980.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge27" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1166.5,-190.2929C1166.5,-176.377 1166.5,-162.285 1166.5,-148.8791"/>
<polygon fill="#000000" stroke="#000000" points="1170.0001,-148.7754 1166.5,-138.7754 1163.0001,-148.7755 1170.0001,-148.7754"/>
<text text-anchor="middle" x="1207" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- biospecimen_source -->
<g id="node30" class="node">
<title>biospecimen_source</title>
<path fill="none" stroke="#000000" d="M1573,-2969C1573,-2969 2018,-2969 2018,-2969 2024,-2969 2030,-2975 2030,-2981 2030,-2981 2030,-3003 2030,-3003 2030,-3009 2024,-3015 2018,-3015 2018,-3015 1573,-3015 1573,-3015 1567,-3015 1561,-3009 1561,-3003 1561,-3003 1561,-2981 1561,-2981 1561,-2975 1567,-2969 1573,-2969"/>
<text text-anchor="middle" x="1642" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_source</text>
<polyline fill="none" stroke="#000000" points="1723,-2969 1723,-3015 "/>
<text text-anchor="middle" x="1733.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1744,-2969 1744,-3015 "/>
<text text-anchor="middle" x="1876.5" y="-2999.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_repository_acronym</text>
<polyline fill="none" stroke="#000000" points="1744,-2992 2009,-2992 "/>
<text text-anchor="middle" x="1876.5" y="-2976.8" font-family="Times,serif" font-size="14.00" fill="#000000">biospecimen_repository_full_name</text>
<polyline fill="none" stroke="#000000" points="2009,-2969 2009,-3015 "/>
<text text-anchor="middle" x="2019.5" y="-2988.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge30" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M726.251,-760.1778C714.7531,-739.4271 704.3826,-720.7112 696.2669,-706.0645"/>
<polygon fill="#000000" stroke="#000000" points="699.1783,-704.0973 691.2701,-697.0467 693.0554,-707.49 699.1783,-704.0973"/>
<text text-anchor="middle" x="746.5" y="-730.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge15" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1024.071,-1197.5407C1040.4197,-1210.2237 1057.6064,-1221.611 1075.5,-1231 1121.302,-1255.0328 1246.9858,-1268.9387 1345.7489,-1276.4248"/>
<polygon fill="#000000" stroke="#000000" points="1345.5931,-1279.9228 1355.825,-1277.1735 1346.1118,-1272.942 1345.5931,-1279.9228"/>
<text text-anchor="middle" x="1102.5" y="-1219.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge40" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1057.2046,-1009.2517C1068.376,-1001.832 1075,-991.748 1075,-979 1075,-969.6382 1071.4277,-961.7131 1065.1053,-955.2248"/>
<polygon fill="#000000" stroke="#000000" points="1067.1571,-952.3811 1057.2046,-948.7483 1062.7194,-957.7947 1067.1571,-952.3811"/>
<text text-anchor="middle" x="1091" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- registration -->
<g id="node32" class="node">
<title>registration</title>
<path fill="none" stroke="#000000" d="M2028.5,-1439.5C2028.5,-1439.5 2298.5,-1439.5 2298.5,-1439.5 2304.5,-1439.5 2310.5,-1445.5 2310.5,-1451.5 2310.5,-1451.5 2310.5,-1473.5 2310.5,-1473.5 2310.5,-1479.5 2304.5,-1485.5 2298.5,-1485.5 2298.5,-1485.5 2028.5,-1485.5 2028.5,-1485.5 2022.5,-1485.5 2016.5,-1479.5 2016.5,-1473.5 2016.5,-1473.5 2016.5,-1451.5 2016.5,-1451.5 2016.5,-1445.5 2022.5,-1439.5 2028.5,-1439.5"/>
<text text-anchor="middle" x="2067" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration</text>
<polyline fill="none" stroke="#000000" points="2117.5,-1439.5 2117.5,-1485.5 "/>
<text text-anchor="middle" x="2128" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2138.5,-1439.5 2138.5,-1485.5 "/>
<text text-anchor="middle" x="2214" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration_id</text>
<polyline fill="none" stroke="#000000" points="2138.5,-1462.5 2289.5,-1462.5 "/>
<text text-anchor="middle" x="2214" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration_origin</text>
<polyline fill="none" stroke="#000000" points="2289.5,-1439.5 2289.5,-1485.5 "/>
<text text-anchor="middle" x="2300" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge14" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2135.0221,-1439.3524C2097.2178,-1410.0308 2027.2031,-1360.4973 1958.5,-1337 1896.0173,-1315.6301 1728.889,-1300.5198 1609.1998,-1292.0398"/>
<polygon fill="#000000" stroke="#000000" points="1609.4417,-1288.5482 1599.2214,-1291.3403 1608.9521,-1295.5311 1609.4417,-1288.5482"/>
<text text-anchor="middle" x="2022.5" y="-1340.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
</g>
</svg>
</div>
