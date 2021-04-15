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
<svg width="3278pt" height="2960pt"
 viewBox="0.00 0.00 3277.50 2960.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2956)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2956 3273.5,-2956 3273.5,4 -4,4"/>
<!-- adverse_event -->
<g id="node1" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M876,-973.5C876,-973.5 1271,-973.5 1271,-973.5 1277,-973.5 1283,-979.5 1283,-985.5 1283,-985.5 1283,-1352.5 1283,-1352.5 1283,-1358.5 1277,-1364.5 1271,-1364.5 1271,-1364.5 876,-1364.5 876,-1364.5 870,-1364.5 864,-1358.5 864,-1352.5 864,-1352.5 864,-985.5 864,-985.5 864,-979.5 870,-973.5 876,-973.5"/>
<text text-anchor="middle" x="924" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="984,-973.5 984,-1364.5 "/>
<text text-anchor="middle" x="994.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1005,-973.5 1005,-1364.5 "/>
<text text-anchor="middle" x="1133.5" y="-1349.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1005,-1341.5 1262,-1341.5 "/>
<text text-anchor="middle" x="1133.5" y="-1326.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1005,-1318.5 1262,-1318.5 "/>
<text text-anchor="middle" x="1133.5" y="-1303.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1005,-1295.5 1262,-1295.5 "/>
<text text-anchor="middle" x="1133.5" y="-1280.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1005,-1272.5 1262,-1272.5 "/>
<text text-anchor="middle" x="1133.5" y="-1257.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1005,-1249.5 1262,-1249.5 "/>
<text text-anchor="middle" x="1133.5" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1005,-1226.5 1262,-1226.5 "/>
<text text-anchor="middle" x="1133.5" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1005,-1203.5 1262,-1203.5 "/>
<text text-anchor="middle" x="1133.5" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1005,-1180.5 1262,-1180.5 "/>
<text text-anchor="middle" x="1133.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1005,-1157.5 1262,-1157.5 "/>
<text text-anchor="middle" x="1133.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1005,-1134.5 1262,-1134.5 "/>
<text text-anchor="middle" x="1133.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1005,-1111.5 1262,-1111.5 "/>
<text text-anchor="middle" x="1133.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1005,-1088.5 1262,-1088.5 "/>
<text text-anchor="middle" x="1133.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1005,-1065.5 1262,-1065.5 "/>
<text text-anchor="middle" x="1133.5" y="-1050.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1005,-1042.5 1262,-1042.5 "/>
<text text-anchor="middle" x="1133.5" y="-1027.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1005,-1019.5 1262,-1019.5 "/>
<text text-anchor="middle" x="1133.5" y="-1004.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1005,-996.5 1262,-996.5 "/>
<text text-anchor="middle" x="1133.5" y="-981.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1262,-973.5 1262,-1364.5 "/>
<text text-anchor="middle" x="1272.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge30" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1283.2046,-1196.2761C1294.376,-1189.5862 1301,-1180.4941 1301,-1169 1301,-1160.7386 1297.5781,-1153.7181 1291.5052,-1147.9385"/>
<polygon fill="#000000" stroke="#000000" points="1293.3073,-1144.9155 1283.2046,-1141.7239 1289.1119,-1150.519 1293.3073,-1144.9155"/>
<text text-anchor="middle" x="1317" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node2" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M933.5,-852.5C933.5,-852.5 1159.5,-852.5 1159.5,-852.5 1165.5,-852.5 1171.5,-858.5 1171.5,-864.5 1171.5,-864.5 1171.5,-886.5 1171.5,-886.5 1171.5,-892.5 1165.5,-898.5 1159.5,-898.5 1159.5,-898.5 933.5,-898.5 933.5,-898.5 927.5,-898.5 921.5,-892.5 921.5,-886.5 921.5,-886.5 921.5,-864.5 921.5,-864.5 921.5,-858.5 927.5,-852.5 933.5,-852.5"/>
<text text-anchor="middle" x="950" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="978.5,-852.5 978.5,-898.5 "/>
<text text-anchor="middle" x="989" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="999.5,-852.5 999.5,-898.5 "/>
<text text-anchor="middle" x="1075" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="999.5,-875.5 1150.5,-875.5 "/>
<text text-anchor="middle" x="1075" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1150.5,-852.5 1150.5,-898.5 "/>
<text text-anchor="middle" x="1161" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge38" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1048.8682,-973.4441C1048.3645,-967.2283 1047.9056,-961.0682 1047.5,-955 1046.495,-939.9644 1046.1653,-923.2947 1046.1177,-909.1191"/>
<polygon fill="#000000" stroke="#000000" points="1049.618,-908.8375 1046.1298,-898.8334 1042.618,-908.8292 1049.618,-908.8375"/>
<text text-anchor="middle" x="1078.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- case -->
<g id="node7" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1532,-829.5C1532,-829.5 1751,-829.5 1751,-829.5 1757,-829.5 1763,-835.5 1763,-841.5 1763,-841.5 1763,-909.5 1763,-909.5 1763,-915.5 1757,-921.5 1751,-921.5 1751,-921.5 1532,-921.5 1532,-921.5 1526,-921.5 1520,-915.5 1520,-909.5 1520,-909.5 1520,-841.5 1520,-841.5 1520,-835.5 1526,-829.5 1532,-829.5"/>
<text text-anchor="middle" x="1544.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1569,-829.5 1569,-921.5 "/>
<text text-anchor="middle" x="1579.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1590,-829.5 1590,-921.5 "/>
<text text-anchor="middle" x="1666" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1590,-898.5 1742,-898.5 "/>
<text text-anchor="middle" x="1666" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1590,-875.5 1742,-875.5 "/>
<text text-anchor="middle" x="1666" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1590,-852.5 1742,-852.5 "/>
<text text-anchor="middle" x="1666" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1742,-829.5 1742,-921.5 "/>
<text text-anchor="middle" x="1752.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge14" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1105.074,-973.4359C1112.5286,-961.003 1121.5653,-949.6359 1132.5,-940 1160.3998,-915.4141 1368.4867,-895.458 1509.8121,-884.5532"/>
<polygon fill="#000000" stroke="#000000" points="1510.1649,-888.0366 1519.8687,-883.7838 1509.6308,-881.057 1510.1649,-888.0366"/>
<text text-anchor="middle" x="1159.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm -->
<g id="node29" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1239,-415C1239,-415 1608,-415 1608,-415 1614,-415 1620,-421 1620,-427 1620,-427 1620,-495 1620,-495 1620,-501 1614,-507 1608,-507 1608,-507 1239,-507 1239,-507 1233,-507 1227,-501 1227,-495 1227,-495 1227,-427 1227,-427 1227,-421 1233,-415 1239,-415"/>
<text text-anchor="middle" x="1273" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1319,-415 1319,-507 "/>
<text text-anchor="middle" x="1329.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1340,-415 1340,-507 "/>
<text text-anchor="middle" x="1469.5" y="-491.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1340,-484 1599,-484 "/>
<text text-anchor="middle" x="1469.5" y="-468.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1340,-461 1599,-461 "/>
<text text-anchor="middle" x="1469.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm_id</text>
<polyline fill="none" stroke="#000000" points="1340,-438 1599,-438 "/>
<text text-anchor="middle" x="1469.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="1599,-415 1599,-507 "/>
<text text-anchor="middle" x="1609.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge24" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1044.0682,-852.2693C1039.5552,-796.3295 1036.1457,-652.6717 1108.5,-570 1119.8295,-557.055 1188.5933,-532.6194 1258.9929,-510.1604"/>
<polygon fill="#000000" stroke="#000000" points="1260.4591,-513.3672 1268.9316,-507.0059 1258.3413,-506.6952 1260.4591,-513.3672"/>
<text text-anchor="middle" x="1157" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- enrollment -->
<g id="node3" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2003,-1416.5C2003,-1416.5 2352,-1416.5 2352,-1416.5 2358,-1416.5 2364,-1422.5 2364,-1428.5 2364,-1428.5 2364,-1611.5 2364,-1611.5 2364,-1617.5 2358,-1623.5 2352,-1623.5 2352,-1623.5 2003,-1623.5 2003,-1623.5 1997,-1623.5 1991,-1617.5 1991,-1611.5 1991,-1611.5 1991,-1428.5 1991,-1428.5 1991,-1422.5 1997,-1416.5 2003,-1416.5"/>
<text text-anchor="middle" x="2038.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2086,-1416.5 2086,-1623.5 "/>
<text text-anchor="middle" x="2096.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2107,-1416.5 2107,-1623.5 "/>
<text text-anchor="middle" x="2225" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2107,-1600.5 2343,-1600.5 "/>
<text text-anchor="middle" x="2225" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2107,-1577.5 2343,-1577.5 "/>
<text text-anchor="middle" x="2225" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2107,-1554.5 2343,-1554.5 "/>
<text text-anchor="middle" x="2225" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2107,-1531.5 2343,-1531.5 "/>
<text text-anchor="middle" x="2225" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2107,-1508.5 2343,-1508.5 "/>
<text text-anchor="middle" x="2225" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2107,-1485.5 2343,-1485.5 "/>
<text text-anchor="middle" x="2225" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2107,-1462.5 2343,-1462.5 "/>
<text text-anchor="middle" x="2225" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2107,-1439.5 2343,-1439.5 "/>
<text text-anchor="middle" x="2225" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2343,-1416.5 2343,-1623.5 "/>
<text text-anchor="middle" x="2353.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge13" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1990.7246,-1457.6297C1948.4547,-1434.9165 1908.2167,-1404.705 1881.5,-1365 1828.5304,-1286.2791 1899.9228,-1013.9709 1840.5,-940 1830.4513,-927.4911 1803.6322,-915.9333 1772.8165,-906.1601"/>
<polygon fill="#000000" stroke="#000000" points="1773.7259,-902.7781 1763.1389,-903.1853 1771.6691,-909.4691 1773.7259,-902.7781"/>
<text text-anchor="middle" x="1908.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cohort -->
<g id="node4" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1332,-639.5C1332,-639.5 1565,-639.5 1565,-639.5 1571,-639.5 1577,-645.5 1577,-651.5 1577,-651.5 1577,-696.5 1577,-696.5 1577,-702.5 1571,-708.5 1565,-708.5 1565,-708.5 1332,-708.5 1332,-708.5 1326,-708.5 1320,-702.5 1320,-696.5 1320,-696.5 1320,-651.5 1320,-651.5 1320,-645.5 1326,-639.5 1332,-639.5"/>
<text text-anchor="middle" x="1351.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1383,-639.5 1383,-708.5 "/>
<text text-anchor="middle" x="1393.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1404,-639.5 1404,-708.5 "/>
<text text-anchor="middle" x="1480" y="-693.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1404,-685.5 1556,-685.5 "/>
<text text-anchor="middle" x="1480" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_id</text>
<polyline fill="none" stroke="#000000" points="1404,-662.5 1556,-662.5 "/>
<text text-anchor="middle" x="1480" y="-647.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1556,-639.5 1556,-708.5 "/>
<text text-anchor="middle" x="1566.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node23" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1877.5,-190.5C1877.5,-190.5 2157.5,-190.5 2157.5,-190.5 2163.5,-190.5 2169.5,-196.5 2169.5,-202.5 2169.5,-202.5 2169.5,-339.5 2169.5,-339.5 2169.5,-345.5 2163.5,-351.5 2157.5,-351.5 2157.5,-351.5 1877.5,-351.5 1877.5,-351.5 1871.5,-351.5 1865.5,-345.5 1865.5,-339.5 1865.5,-339.5 1865.5,-202.5 1865.5,-202.5 1865.5,-196.5 1871.5,-190.5 1877.5,-190.5"/>
<text text-anchor="middle" x="1893.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1921.5,-190.5 1921.5,-351.5 "/>
<text text-anchor="middle" x="1932" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1942.5,-190.5 1942.5,-351.5 "/>
<text text-anchor="middle" x="2045.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1942.5,-328.5 2148.5,-328.5 "/>
<text text-anchor="middle" x="2045.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1942.5,-305.5 2148.5,-305.5 "/>
<text text-anchor="middle" x="2045.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1942.5,-282.5 2148.5,-282.5 "/>
<text text-anchor="middle" x="2045.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1942.5,-259.5 2148.5,-259.5 "/>
<text text-anchor="middle" x="2045.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1942.5,-236.5 2148.5,-236.5 "/>
<text text-anchor="middle" x="2045.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1942.5,-213.5 2148.5,-213.5 "/>
<text text-anchor="middle" x="2045.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2148.5,-190.5 2148.5,-351.5 "/>
<text text-anchor="middle" x="2159" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge18" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1410.5736,-639.4336C1384.1673,-616.9351 1347.2276,-588.4474 1310.5,-570 1238.4867,-533.8294 1184.8094,-583.5014 1136.5,-519 1105.594,-477.7351 1102.8538,-442.0629 1136.5,-403 1182.7072,-349.3538 1613.5911,-304.9146 1855.1815,-283.9598"/>
<polygon fill="#000000" stroke="#000000" points="1855.811,-287.4186 1865.4729,-283.0714 1855.2089,-280.4445 1855.811,-287.4186"/>
<text text-anchor="middle" x="1177" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge19" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1444.4277,-639.3038C1440.5539,-606.2989 1434.6587,-556.0723 1430.1113,-517.3284"/>
<polygon fill="#000000" stroke="#000000" points="1433.5688,-516.7611 1428.9269,-507.2373 1426.6166,-517.5772 1433.5688,-516.7611"/>
<text text-anchor="middle" x="1475" y="-540.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_therapy -->
<g id="node5" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2224.5,-1687C2224.5,-1687 2680.5,-1687 2680.5,-1687 2686.5,-1687 2692.5,-1693 2692.5,-1699 2692.5,-1699 2692.5,-2273 2692.5,-2273 2692.5,-2279 2686.5,-2285 2680.5,-2285 2680.5,-2285 2224.5,-2285 2224.5,-2285 2218.5,-2285 2212.5,-2279 2212.5,-2273 2212.5,-2273 2212.5,-1699 2212.5,-1699 2212.5,-1693 2218.5,-1687 2224.5,-1687"/>
<text text-anchor="middle" x="2270" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2327.5,-1687 2327.5,-2285 "/>
<text text-anchor="middle" x="2338" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2348.5,-1687 2348.5,-2285 "/>
<text text-anchor="middle" x="2510" y="-2269.8" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2262 2671.5,-2262 "/>
<text text-anchor="middle" x="2510" y="-2246.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2239 2671.5,-2239 "/>
<text text-anchor="middle" x="2510" y="-2223.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2216 2671.5,-2216 "/>
<text text-anchor="middle" x="2510" y="-2200.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2193 2671.5,-2193 "/>
<text text-anchor="middle" x="2510" y="-2177.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2170 2671.5,-2170 "/>
<text text-anchor="middle" x="2510" y="-2154.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2147 2671.5,-2147 "/>
<text text-anchor="middle" x="2510" y="-2131.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2124 2671.5,-2124 "/>
<text text-anchor="middle" x="2510" y="-2108.8" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2101 2671.5,-2101 "/>
<text text-anchor="middle" x="2510" y="-2085.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2078 2671.5,-2078 "/>
<text text-anchor="middle" x="2510" y="-2062.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2055 2671.5,-2055 "/>
<text text-anchor="middle" x="2510" y="-2039.8" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2032 2671.5,-2032 "/>
<text text-anchor="middle" x="2510" y="-2016.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-2009 2671.5,-2009 "/>
<text text-anchor="middle" x="2510" y="-1993.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1986 2671.5,-1986 "/>
<text text-anchor="middle" x="2510" y="-1970.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1963 2671.5,-1963 "/>
<text text-anchor="middle" x="2510" y="-1947.8" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1940 2671.5,-1940 "/>
<text text-anchor="middle" x="2510" y="-1924.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1917 2671.5,-1917 "/>
<text text-anchor="middle" x="2510" y="-1901.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1894 2671.5,-1894 "/>
<text text-anchor="middle" x="2510" y="-1878.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1871 2671.5,-1871 "/>
<text text-anchor="middle" x="2510" y="-1855.8" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1848 2671.5,-1848 "/>
<text text-anchor="middle" x="2510" y="-1832.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1825 2671.5,-1825 "/>
<text text-anchor="middle" x="2510" y="-1809.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1802 2671.5,-1802 "/>
<text text-anchor="middle" x="2510" y="-1786.8" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1779 2671.5,-1779 "/>
<text text-anchor="middle" x="2510" y="-1763.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1756 2671.5,-1756 "/>
<text text-anchor="middle" x="2510" y="-1740.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1733 2671.5,-1733 "/>
<text text-anchor="middle" x="2510" y="-1717.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2348.5,-1710 2671.5,-1710 "/>
<text text-anchor="middle" x="2510" y="-1694.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2671.5,-1687 2671.5,-2285 "/>
<text text-anchor="middle" x="2682" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge2" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2276.0046,-1686.9205C2264.8706,-1668.0535 2254.1085,-1649.8166 2244.0449,-1632.7634"/>
<polygon fill="#000000" stroke="#000000" points="2246.9443,-1630.7899 2238.8477,-1623.9565 2240.9158,-1634.3475 2246.9443,-1630.7899"/>
<text text-anchor="middle" x="2301.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge28" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M2692.7384,-2025.6057C2703.9387,-2015.6082 2710.5,-2002.4063 2710.5,-1986 2710.5,-1973.3108 2706.575,-1962.5384 2699.6144,-1953.6829"/>
<polygon fill="#000000" stroke="#000000" points="2702.1465,-1951.2665 2692.7384,-1946.3943 2697.0547,-1956.0701 2702.1465,-1951.2665"/>
<text text-anchor="middle" x="2726.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- assay -->
<g id="node6" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1015.5,-2656.5C1015.5,-2656.5 1047.5,-2656.5 1047.5,-2656.5 1053.5,-2656.5 1059.5,-2662.5 1059.5,-2668.5 1059.5,-2668.5 1059.5,-2680.5 1059.5,-2680.5 1059.5,-2686.5 1053.5,-2692.5 1047.5,-2692.5 1047.5,-2692.5 1015.5,-2692.5 1015.5,-2692.5 1009.5,-2692.5 1003.5,-2686.5 1003.5,-2680.5 1003.5,-2680.5 1003.5,-2668.5 1003.5,-2668.5 1003.5,-2662.5 1009.5,-2656.5 1015.5,-2656.5"/>
<text text-anchor="middle" x="1031.5" y="-2670.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- sample -->
<g id="node27" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M523,-1675.5C523,-1675.5 946,-1675.5 946,-1675.5 952,-1675.5 958,-1681.5 958,-1687.5 958,-1687.5 958,-2284.5 958,-2284.5 958,-2290.5 952,-2296.5 946,-2296.5 946,-2296.5 523,-2296.5 523,-2296.5 517,-2296.5 511,-2290.5 511,-2284.5 511,-2284.5 511,-1687.5 511,-1687.5 511,-1681.5 517,-1675.5 523,-1675.5"/>
<text text-anchor="middle" x="545" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="579,-1675.5 579,-2296.5 "/>
<text text-anchor="middle" x="589.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="600,-1675.5 600,-2296.5 "/>
<text text-anchor="middle" x="768.5" y="-2281.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="600,-2273.5 937,-2273.5 "/>
<text text-anchor="middle" x="768.5" y="-2258.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="600,-2250.5 937,-2250.5 "/>
<text text-anchor="middle" x="768.5" y="-2235.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="600,-2227.5 937,-2227.5 "/>
<text text-anchor="middle" x="768.5" y="-2212.3" font-family="Times,serif" font-size="14.00" fill="#000000">molecular_subtype</text>
<polyline fill="none" stroke="#000000" points="600,-2204.5 937,-2204.5 "/>
<text text-anchor="middle" x="768.5" y="-2189.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-2181.5 937,-2181.5 "/>
<text text-anchor="middle" x="768.5" y="-2166.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="600,-2158.5 937,-2158.5 "/>
<text text-anchor="middle" x="768.5" y="-2143.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-2135.5 937,-2135.5 "/>
<text text-anchor="middle" x="768.5" y="-2120.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="600,-2112.5 937,-2112.5 "/>
<text text-anchor="middle" x="768.5" y="-2097.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="600,-2089.5 937,-2089.5 "/>
<text text-anchor="middle" x="768.5" y="-2074.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-2066.5 937,-2066.5 "/>
<text text-anchor="middle" x="768.5" y="-2051.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_sample_type</text>
<polyline fill="none" stroke="#000000" points="600,-2043.5 937,-2043.5 "/>
<text text-anchor="middle" x="768.5" y="-2028.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="600,-2020.5 937,-2020.5 "/>
<text text-anchor="middle" x="768.5" y="-2005.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="600,-1997.5 937,-1997.5 "/>
<text text-anchor="middle" x="768.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="600,-1974.5 937,-1974.5 "/>
<text text-anchor="middle" x="768.5" y="-1959.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="600,-1951.5 937,-1951.5 "/>
<text text-anchor="middle" x="768.5" y="-1936.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-1928.5 937,-1928.5 "/>
<text text-anchor="middle" x="768.5" y="-1913.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-1905.5 937,-1905.5 "/>
<text text-anchor="middle" x="768.5" y="-1890.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="600,-1882.5 937,-1882.5 "/>
<text text-anchor="middle" x="768.5" y="-1867.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="600,-1859.5 937,-1859.5 "/>
<text text-anchor="middle" x="768.5" y="-1844.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_chronology</text>
<polyline fill="none" stroke="#000000" points="600,-1836.5 937,-1836.5 "/>
<text text-anchor="middle" x="768.5" y="-1821.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="600,-1813.5 937,-1813.5 "/>
<text text-anchor="middle" x="768.5" y="-1798.3" font-family="Times,serif" font-size="14.00" fill="#000000">volume_of_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-1790.5 937,-1790.5 "/>
<text text-anchor="middle" x="768.5" y="-1775.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="600,-1767.5 937,-1767.5 "/>
<text text-anchor="middle" x="768.5" y="-1752.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="600,-1744.5 937,-1744.5 "/>
<text text-anchor="middle" x="768.5" y="-1729.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="600,-1721.5 937,-1721.5 "/>
<text text-anchor="middle" x="768.5" y="-1706.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="600,-1698.5 937,-1698.5 "/>
<text text-anchor="middle" x="768.5" y="-1683.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="937,-1675.5 937,-2296.5 "/>
<text text-anchor="middle" x="947.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge27" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1027.8536,-2656.3829C1016.7171,-2602.7588 980.5818,-2440.7308 926.5,-2315 925.1934,-2311.9624 923.8646,-2308.918 922.515,-2305.8682"/>
<polygon fill="#000000" stroke="#000000" points="925.6907,-2304.396 918.405,-2296.7038 919.3036,-2307.2605 925.6907,-2304.396"/>
<text text-anchor="middle" x="1061" y="-2472.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge39" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1519.8194,-882.0843C1410.1988,-890.0661 1258.9126,-906.8047 1209.5,-940 1198.2266,-947.5734 1187.7499,-956.4234 1178.0354,-966.1573"/>
<polygon fill="#000000" stroke="#000000" points="1175.4898,-963.755 1171.0959,-973.3958 1180.5429,-968.5993 1175.4898,-963.755"/>
<text text-anchor="middle" x="1278.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge17" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1544.4931,-829.4377C1536.6133,-823.799 1529.1418,-817.6514 1522.5,-811 1496.3292,-784.7913 1476.9751,-747.3941 1464.6374,-718.2918"/>
<polygon fill="#000000" stroke="#000000" points="1467.7619,-716.6868 1460.7226,-708.7685 1461.2876,-719.3482 1467.7619,-716.6868"/>
<text text-anchor="middle" x="1563" y="-799.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node10" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2058,-582C2058,-582 2505,-582 2505,-582 2511,-582 2517,-588 2517,-594 2517,-594 2517,-754 2517,-754 2517,-760 2511,-766 2505,-766 2505,-766 2058,-766 2058,-766 2052,-766 2046,-760 2046,-754 2046,-754 2046,-594 2046,-594 2046,-588 2052,-582 2058,-582"/>
<text text-anchor="middle" x="2103.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2161,-582 2161,-766 "/>
<text text-anchor="middle" x="2171.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2182,-582 2182,-766 "/>
<text text-anchor="middle" x="2339" y="-750.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2182,-743 2496,-743 "/>
<text text-anchor="middle" x="2339" y="-727.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2182,-720 2496,-720 "/>
<text text-anchor="middle" x="2339" y="-704.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2182,-697 2496,-697 "/>
<text text-anchor="middle" x="2339" y="-681.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2182,-674 2496,-674 "/>
<text text-anchor="middle" x="2339" y="-658.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2182,-651 2496,-651 "/>
<text text-anchor="middle" x="2339" y="-635.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2182,-628 2496,-628 "/>
<text text-anchor="middle" x="2339" y="-612.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2182,-605 2496,-605 "/>
<text text-anchor="middle" x="2339" y="-589.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2496,-582 2496,-766 "/>
<text text-anchor="middle" x="2506.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1763.1387,-866.0222C1841.4143,-857.3513 1944.4161,-841.082 2031.5,-811 2062.342,-800.346 2093.8795,-786.0931 2123.7086,-770.8014"/>
<polygon fill="#000000" stroke="#000000" points="2125.6459,-773.7393 2132.9084,-766.0253 2122.4205,-767.5266 2125.6459,-773.7393"/>
<text text-anchor="middle" x="2139.5" y="-799.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge16" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1711.5319,-829.4868C1796.2173,-769.4197 1935.1401,-655.6712 1997.5,-519 2019.7642,-470.2046 2025.1359,-410.4005 2024.764,-361.7462"/>
<polygon fill="#000000" stroke="#000000" points="2028.2604,-361.484 2024.6015,-351.5411 2021.2613,-361.5956 2028.2604,-361.484"/>
<text text-anchor="middle" x="2029" y="-540.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node24" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2547,-570.5C2547,-570.5 2962,-570.5 2962,-570.5 2968,-570.5 2974,-576.5 2974,-582.5 2974,-582.5 2974,-765.5 2974,-765.5 2974,-771.5 2968,-777.5 2962,-777.5 2962,-777.5 2547,-777.5 2547,-777.5 2541,-777.5 2535,-771.5 2535,-765.5 2535,-765.5 2535,-582.5 2535,-582.5 2535,-576.5 2541,-570.5 2547,-570.5"/>
<text text-anchor="middle" x="2576.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2618,-570.5 2618,-777.5 "/>
<text text-anchor="middle" x="2628.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2639,-570.5 2639,-777.5 "/>
<text text-anchor="middle" x="2796" y="-762.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2639,-754.5 2953,-754.5 "/>
<text text-anchor="middle" x="2796" y="-739.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2639,-731.5 2953,-731.5 "/>
<text text-anchor="middle" x="2796" y="-716.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2639,-708.5 2953,-708.5 "/>
<text text-anchor="middle" x="2796" y="-693.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2639,-685.5 2953,-685.5 "/>
<text text-anchor="middle" x="2796" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2639,-662.5 2953,-662.5 "/>
<text text-anchor="middle" x="2796" y="-647.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2639,-639.5 2953,-639.5 "/>
<text text-anchor="middle" x="2796" y="-624.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2639,-616.5 2953,-616.5 "/>
<text text-anchor="middle" x="2796" y="-601.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2639,-593.5 2953,-593.5 "/>
<text text-anchor="middle" x="2796" y="-578.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2953,-570.5 2953,-777.5 "/>
<text text-anchor="middle" x="2963.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge22" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1763.1021,-866.9025C1966.4921,-851.7391 2368.038,-818.2525 2524.7396,-778.3025"/>
<polygon fill="#000000" stroke="#000000" points="2525.933,-781.6071 2534.7025,-775.6618 2524.1396,-774.8408 2525.933,-781.6071"/>
<text text-anchor="middle" x="2492" y="-799.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;study_arm -->
<g id="edge23" class="edge">
<title>case&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1643.7301,-829.2557C1644.5667,-765.6433 1637.8713,-649.9508 1585.5,-570 1570.7588,-547.4958 1549.5886,-528.4692 1527.3921,-512.9268"/>
<polygon fill="#000000" stroke="#000000" points="1529.0889,-509.8489 1518.846,-507.1406 1525.1643,-515.6453 1529.0889,-509.8489"/>
<text text-anchor="middle" x="1691" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- individual -->
<g id="node30" class="node">
<title>individual</title>
<path fill="none" stroke="#000000" d="M1227,-656C1227,-656 1290,-656 1290,-656 1296,-656 1302,-662 1302,-668 1302,-668 1302,-680 1302,-680 1302,-686 1296,-692 1290,-692 1290,-692 1227,-692 1227,-692 1221,-692 1215,-686 1215,-680 1215,-680 1215,-668 1215,-668 1215,-662 1221,-656 1227,-656"/>
<text text-anchor="middle" x="1258.5" y="-670.3" font-family="Times,serif" font-size="14.00" fill="#000000">individual</text>
</g>
<!-- case&#45;&gt;individual -->
<g id="edge25" class="edge">
<title>case&#45;&gt;individual</title>
<path fill="none" stroke="#000000" d="M1519.875,-850.3616C1439.3238,-831.7391 1342.7743,-805.0084 1310.5,-778 1287.0352,-758.3637 1273.1275,-725.5225 1265.6856,-701.9964"/>
<polygon fill="#000000" stroke="#000000" points="1268.9911,-700.8322 1262.7965,-692.237 1262.2791,-702.8192 1268.9911,-700.8322"/>
<text text-anchor="middle" x="1414.5" y="-799.8" font-family="Times,serif" font-size="14.00" fill="#000000">represents</text>
</g>
<!-- principal_investigator -->
<g id="node8" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M1650,-426.5C1650,-426.5 1977,-426.5 1977,-426.5 1983,-426.5 1989,-432.5 1989,-438.5 1989,-438.5 1989,-483.5 1989,-483.5 1989,-489.5 1983,-495.5 1977,-495.5 1977,-495.5 1650,-495.5 1650,-495.5 1644,-495.5 1638,-489.5 1638,-483.5 1638,-483.5 1638,-438.5 1638,-438.5 1638,-432.5 1644,-426.5 1650,-426.5"/>
<text text-anchor="middle" x="1725" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1812,-426.5 1812,-495.5 "/>
<text text-anchor="middle" x="1822.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1833,-426.5 1833,-495.5 "/>
<text text-anchor="middle" x="1900.5" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1833,-472.5 1968,-472.5 "/>
<text text-anchor="middle" x="1900.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1833,-449.5 1968,-449.5 "/>
<text text-anchor="middle" x="1900.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1968,-426.5 1968,-495.5 "/>
<text text-anchor="middle" x="1978.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge35" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1850.9167,-426.1511C1871.3315,-407.1373 1897.6098,-382.6624 1923.2334,-358.7973"/>
<polygon fill="#000000" stroke="#000000" points="1925.8639,-361.1303 1930.7961,-351.7536 1921.093,-356.0079 1925.8639,-361.1303"/>
<text text-anchor="middle" x="1940" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file -->
<g id="node9" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1159,-2744.5C1159,-2744.5 1344,-2744.5 1344,-2744.5 1350,-2744.5 1356,-2750.5 1356,-2756.5 1356,-2756.5 1356,-2939.5 1356,-2939.5 1356,-2945.5 1350,-2951.5 1344,-2951.5 1344,-2951.5 1159,-2951.5 1159,-2951.5 1153,-2951.5 1147,-2945.5 1147,-2939.5 1147,-2939.5 1147,-2756.5 1147,-2756.5 1147,-2750.5 1153,-2744.5 1159,-2744.5"/>
<text text-anchor="middle" x="1166.5" y="-2844.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1186,-2744.5 1186,-2951.5 "/>
<text text-anchor="middle" x="1196.5" y="-2844.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1207,-2744.5 1207,-2951.5 "/>
<text text-anchor="middle" x="1271" y="-2936.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1207,-2928.5 1335,-2928.5 "/>
<text text-anchor="middle" x="1271" y="-2913.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1207,-2905.5 1335,-2905.5 "/>
<text text-anchor="middle" x="1271" y="-2890.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1207,-2882.5 1335,-2882.5 "/>
<text text-anchor="middle" x="1271" y="-2867.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1207,-2859.5 1335,-2859.5 "/>
<text text-anchor="middle" x="1271" y="-2844.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1207,-2836.5 1335,-2836.5 "/>
<text text-anchor="middle" x="1271" y="-2821.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1207,-2813.5 1335,-2813.5 "/>
<text text-anchor="middle" x="1271" y="-2798.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1207,-2790.5 1335,-2790.5 "/>
<text text-anchor="middle" x="1271" y="-2775.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1207,-2767.5 1335,-2767.5 "/>
<text text-anchor="middle" x="1271" y="-2752.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1335,-2744.5 1335,-2951.5 "/>
<text text-anchor="middle" x="1345.5" y="-2844.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge6" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1146.9765,-2765.569C1116.108,-2741.225 1084.6631,-2716.4263 1062.3973,-2698.8667"/>
<polygon fill="#000000" stroke="#000000" points="1064.3528,-2695.9515 1054.3335,-2692.5073 1060.0181,-2701.4479 1064.3528,-2695.9515"/>
<text text-anchor="middle" x="1128" y="-2714.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- diagnosis -->
<g id="node11" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1257,-2315.5C1257,-2315.5 1600,-2315.5 1600,-2315.5 1606,-2315.5 1612,-2321.5 1612,-2327.5 1612,-2327.5 1612,-2625.5 1612,-2625.5 1612,-2631.5 1606,-2637.5 1600,-2637.5 1600,-2637.5 1257,-2637.5 1257,-2637.5 1251,-2637.5 1245,-2631.5 1245,-2625.5 1245,-2625.5 1245,-2327.5 1245,-2327.5 1245,-2321.5 1251,-2315.5 1257,-2315.5"/>
<text text-anchor="middle" x="1287" y="-2472.8" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1329,-2315.5 1329,-2637.5 "/>
<text text-anchor="middle" x="1339.5" y="-2472.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1350,-2315.5 1350,-2637.5 "/>
<text text-anchor="middle" x="1470.5" y="-2622.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1350,-2614.5 1591,-2614.5 "/>
<text text-anchor="middle" x="1470.5" y="-2599.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1350,-2591.5 1591,-2591.5 "/>
<text text-anchor="middle" x="1470.5" y="-2576.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1350,-2568.5 1591,-2568.5 "/>
<text text-anchor="middle" x="1470.5" y="-2553.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1350,-2545.5 1591,-2545.5 "/>
<text text-anchor="middle" x="1470.5" y="-2530.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1350,-2522.5 1591,-2522.5 "/>
<text text-anchor="middle" x="1470.5" y="-2507.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1350,-2499.5 1591,-2499.5 "/>
<text text-anchor="middle" x="1470.5" y="-2484.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1350,-2476.5 1591,-2476.5 "/>
<text text-anchor="middle" x="1470.5" y="-2461.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1350,-2453.5 1591,-2453.5 "/>
<text text-anchor="middle" x="1470.5" y="-2438.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1350,-2430.5 1591,-2430.5 "/>
<text text-anchor="middle" x="1470.5" y="-2415.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1350,-2407.5 1591,-2407.5 "/>
<text text-anchor="middle" x="1470.5" y="-2392.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1350,-2384.5 1591,-2384.5 "/>
<text text-anchor="middle" x="1470.5" y="-2369.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1350,-2361.5 1591,-2361.5 "/>
<text text-anchor="middle" x="1470.5" y="-2346.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1350,-2338.5 1591,-2338.5 "/>
<text text-anchor="middle" x="1470.5" y="-2323.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1591,-2315.5 1591,-2637.5 "/>
<text text-anchor="middle" x="1601.5" y="-2472.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge46" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1301.0397,-2744.0225C1315.3893,-2713.9048 1331.4461,-2680.2035 1347.1969,-2647.1446"/>
<polygon fill="#000000" stroke="#000000" points="1350.4881,-2648.374 1351.6296,-2637.8409 1344.1687,-2645.3631 1350.4881,-2648.374"/>
<text text-anchor="middle" x="1369" y="-2714.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge33" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1356.0249,-2844.2626C1761.563,-2829.0843 3208.5,-2768.3529 3208.5,-2674.5 3208.5,-2674.5 3208.5,-2674.5 3208.5,-461 3208.5,-358.0284 2505.276,-301.1197 2179.5516,-280.2832"/>
<polygon fill="#000000" stroke="#000000" points="2179.7527,-276.789 2169.5507,-279.6472 2179.3084,-283.7749 2179.7527,-276.789"/>
<text text-anchor="middle" x="3239" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge26" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1146.9337,-2823.9947C1073.6348,-2801.8835 978.8649,-2761.7831 921.5,-2693 831.5559,-2585.1531 784.4259,-2438.5195 759.9039,-2306.7478"/>
<polygon fill="#000000" stroke="#000000" points="763.3424,-2306.0936 758.1051,-2296.8837 756.456,-2307.3494 763.3424,-2306.0936"/>
<text text-anchor="middle" x="958" y="-2670.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge9" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1612.4819,-2434.2613C1685.8129,-2407.5693 1763.1864,-2364.7985 1807.5,-2297 1846.8784,-2236.7522 1826.5,-1721.4754 1826.5,-1649.5 1826.5,-1649.5 1826.5,-1649.5 1826.5,-1169 1826.5,-1074.4001 1797.2474,-1050.8483 1743.5,-973 1732.7547,-957.4364 1719.2138,-942.3927 1705.5407,-928.9706"/>
<polygon fill="#000000" stroke="#000000" points="1707.5876,-926.0841 1697.9479,-921.6878 1702.742,-931.1359 1707.5876,-926.0841"/>
<text text-anchor="middle" x="1853.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit -->
<g id="node12" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1452,-1497C1452,-1497 1627,-1497 1627,-1497 1633,-1497 1639,-1503 1639,-1509 1639,-1509 1639,-1531 1639,-1531 1639,-1537 1633,-1543 1627,-1543 1627,-1543 1452,-1543 1452,-1543 1446,-1543 1440,-1537 1440,-1531 1440,-1531 1440,-1509 1440,-1509 1440,-1503 1446,-1497 1452,-1497"/>
<text text-anchor="middle" x="1463.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1487,-1497 1487,-1543 "/>
<text text-anchor="middle" x="1497.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1508,-1497 1508,-1543 "/>
<text text-anchor="middle" x="1563" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1508,-1520 1618,-1520 "/>
<text text-anchor="middle" x="1563" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1618,-1497 1618,-1543 "/>
<text text-anchor="middle" x="1628.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge7" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1564.5772,-1496.5361C1592.7036,-1468.3891 1636.8245,-1418.289 1655.5,-1365 1715.7976,-1192.9462 1665.6107,-1137.2909 1668.5,-955 1668.6057,-948.3342 1669.8128,-946.5361 1668.5,-940 1667.9285,-937.1547 1667.2283,-934.2784 1666.4284,-931.4016"/>
<polygon fill="#000000" stroke="#000000" points="1669.7049,-930.1533 1663.3668,-921.6634 1663.0271,-932.2527 1669.7049,-930.1533"/>
<text text-anchor="middle" x="1712.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge29" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1597.5376,-1543.0098C1628.6529,-1546.9199 1657,-1539.25 1657,-1520 1657,-1502.8555 1634.5147,-1494.8964 1607.6145,-1496.1228"/>
<polygon fill="#000000" stroke="#000000" points="1607.2006,-1492.6454 1597.5376,-1496.9902 1607.801,-1499.6196 1607.2006,-1492.6454"/>
<text text-anchor="middle" x="1673" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node22" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1406.5,-1134.5C1406.5,-1134.5 1634.5,-1134.5 1634.5,-1134.5 1640.5,-1134.5 1646.5,-1140.5 1646.5,-1146.5 1646.5,-1146.5 1646.5,-1191.5 1646.5,-1191.5 1646.5,-1197.5 1640.5,-1203.5 1634.5,-1203.5 1634.5,-1203.5 1406.5,-1203.5 1406.5,-1203.5 1400.5,-1203.5 1394.5,-1197.5 1394.5,-1191.5 1394.5,-1191.5 1394.5,-1146.5 1394.5,-1146.5 1394.5,-1140.5 1400.5,-1134.5 1406.5,-1134.5"/>
<text text-anchor="middle" x="1421.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1448.5,-1134.5 1448.5,-1203.5 "/>
<text text-anchor="middle" x="1459" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1469.5,-1134.5 1469.5,-1203.5 "/>
<text text-anchor="middle" x="1547.5" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1469.5,-1180.5 1625.5,-1180.5 "/>
<text text-anchor="middle" x="1547.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1469.5,-1157.5 1625.5,-1157.5 "/>
<text text-anchor="middle" x="1547.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1625.5,-1134.5 1625.5,-1203.5 "/>
<text text-anchor="middle" x="1636" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge47" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1538.2534,-1496.9699C1535.1467,-1439.5781 1527.0168,-1289.3885 1522.9255,-1213.8082"/>
<polygon fill="#000000" stroke="#000000" points="1526.4115,-1213.4523 1522.376,-1203.6561 1519.4217,-1213.8307 1526.4115,-1213.4523"/>
<text text-anchor="middle" x="1563" y="-1386.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- image_collection -->
<g id="node13" class="node">
<title>image_collection</title>
<path fill="none" stroke="#000000" d="M2057,-403.5C2057,-403.5 2396,-403.5 2396,-403.5 2402,-403.5 2408,-409.5 2408,-415.5 2408,-415.5 2408,-506.5 2408,-506.5 2408,-512.5 2402,-518.5 2396,-518.5 2396,-518.5 2057,-518.5 2057,-518.5 2051,-518.5 2045,-512.5 2045,-506.5 2045,-506.5 2045,-415.5 2045,-415.5 2045,-409.5 2051,-403.5 2057,-403.5"/>
<text text-anchor="middle" x="2113.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection</text>
<polyline fill="none" stroke="#000000" points="2182,-403.5 2182,-518.5 "/>
<text text-anchor="middle" x="2192.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2203,-403.5 2203,-518.5 "/>
<text text-anchor="middle" x="2295" y="-503.3" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_name</text>
<polyline fill="none" stroke="#000000" points="2203,-495.5 2387,-495.5 "/>
<text text-anchor="middle" x="2295" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">image_collection_url</text>
<polyline fill="none" stroke="#000000" points="2203,-472.5 2387,-472.5 "/>
<text text-anchor="middle" x="2295" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">collection_access</text>
<polyline fill="none" stroke="#000000" points="2203,-449.5 2387,-449.5 "/>
<text text-anchor="middle" x="2295" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">image_type_included</text>
<polyline fill="none" stroke="#000000" points="2203,-426.5 2387,-426.5 "/>
<text text-anchor="middle" x="2295" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">repository_name</text>
<polyline fill="none" stroke="#000000" points="2387,-403.5 2387,-518.5 "/>
<text text-anchor="middle" x="2397.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- image_collection&#45;&gt;study -->
<g id="edge36" class="edge">
<title>image_collection&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2163.2259,-403.4781C2147.7019,-389.3654 2130.7323,-373.9385 2114.0355,-358.7595"/>
<polygon fill="#000000" stroke="#000000" points="2116.1431,-355.9454 2106.3893,-351.8085 2111.4344,-361.125 2116.1431,-355.9454"/>
<text text-anchor="middle" x="2172" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- image -->
<g id="node14" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M818.5,-2830C818.5,-2830 854.5,-2830 854.5,-2830 860.5,-2830 866.5,-2836 866.5,-2842 866.5,-2842 866.5,-2854 866.5,-2854 866.5,-2860 860.5,-2866 854.5,-2866 854.5,-2866 818.5,-2866 818.5,-2866 812.5,-2866 806.5,-2860 806.5,-2854 806.5,-2854 806.5,-2842 806.5,-2842 806.5,-2836 812.5,-2830 818.5,-2830"/>
<text text-anchor="middle" x="836.5" y="-2844.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge5" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M856.9999,-2829.7604C892.1105,-2798.5209 963.7968,-2734.7384 1003.4904,-2699.4214"/>
<polygon fill="#000000" stroke="#000000" points="1005.8378,-2702.0176 1010.9822,-2692.7556 1001.1847,-2696.788 1005.8378,-2702.0176"/>
<text text-anchor="middle" x="1020" y="-2714.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- disease_extent -->
<g id="node15" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1038.5,-1836.5C1038.5,-1836.5 1354.5,-1836.5 1354.5,-1836.5 1360.5,-1836.5 1366.5,-1842.5 1366.5,-1848.5 1366.5,-1848.5 1366.5,-2123.5 1366.5,-2123.5 1366.5,-2129.5 1360.5,-2135.5 1354.5,-2135.5 1354.5,-2135.5 1038.5,-2135.5 1038.5,-2135.5 1032.5,-2135.5 1026.5,-2129.5 1026.5,-2123.5 1026.5,-2123.5 1026.5,-1848.5 1026.5,-1848.5 1026.5,-1842.5 1032.5,-1836.5 1038.5,-1836.5"/>
<text text-anchor="middle" x="1088" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1149.5,-1836.5 1149.5,-2135.5 "/>
<text text-anchor="middle" x="1160" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1170.5,-1836.5 1170.5,-2135.5 "/>
<text text-anchor="middle" x="1258" y="-2120.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2112.5 1345.5,-2112.5 "/>
<text text-anchor="middle" x="1258" y="-2097.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2089.5 1345.5,-2089.5 "/>
<text text-anchor="middle" x="1258" y="-2074.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2066.5 1345.5,-2066.5 "/>
<text text-anchor="middle" x="1258" y="-2051.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2043.5 1345.5,-2043.5 "/>
<text text-anchor="middle" x="1258" y="-2028.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2020.5 1345.5,-2020.5 "/>
<text text-anchor="middle" x="1258" y="-2005.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1997.5 1345.5,-1997.5 "/>
<text text-anchor="middle" x="1258" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1974.5 1345.5,-1974.5 "/>
<text text-anchor="middle" x="1258" y="-1959.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1951.5 1345.5,-1951.5 "/>
<text text-anchor="middle" x="1258" y="-1936.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1928.5 1345.5,-1928.5 "/>
<text text-anchor="middle" x="1258" y="-1913.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1905.5 1345.5,-1905.5 "/>
<text text-anchor="middle" x="1258" y="-1890.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1882.5 1345.5,-1882.5 "/>
<text text-anchor="middle" x="1258" y="-1867.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1859.5 1345.5,-1859.5 "/>
<text text-anchor="middle" x="1258" y="-1844.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1345.5,-1836.5 1345.5,-2135.5 "/>
<text text-anchor="middle" x="1356" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge44" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1253.3683,-1836.1858C1282.0639,-1778.4176 1322.2812,-1716.4189 1375.5,-1675 1398.8182,-1656.852 1415.234,-1673.8596 1439.5,-1657 1478.0718,-1630.2009 1507.3983,-1583.6143 1524.0269,-1552.3004"/>
<polygon fill="#000000" stroke="#000000" points="1527.2939,-1553.6021 1528.776,-1543.1114 1521.0753,-1550.3881 1527.2939,-1553.6021"/>
<text text-anchor="middle" x="1485.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- registration -->
<g id="node16" class="node">
<title>registration</title>
<path fill="none" stroke="#000000" d="M1956.5,-1146C1956.5,-1146 2226.5,-1146 2226.5,-1146 2232.5,-1146 2238.5,-1152 2238.5,-1158 2238.5,-1158 2238.5,-1180 2238.5,-1180 2238.5,-1186 2232.5,-1192 2226.5,-1192 2226.5,-1192 1956.5,-1192 1956.5,-1192 1950.5,-1192 1944.5,-1186 1944.5,-1180 1944.5,-1180 1944.5,-1158 1944.5,-1158 1944.5,-1152 1950.5,-1146 1956.5,-1146"/>
<text text-anchor="middle" x="1995" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">registration</text>
<polyline fill="none" stroke="#000000" points="2045.5,-1146 2045.5,-1192 "/>
<text text-anchor="middle" x="2056" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2066.5,-1146 2066.5,-1192 "/>
<text text-anchor="middle" x="2142" y="-1176.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_id</text>
<polyline fill="none" stroke="#000000" points="2066.5,-1169 2217.5,-1169 "/>
<text text-anchor="middle" x="2142" y="-1153.8" font-family="Times,serif" font-size="14.00" fill="#000000">registration_origin</text>
<polyline fill="none" stroke="#000000" points="2217.5,-1146 2217.5,-1192 "/>
<text text-anchor="middle" x="2228" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- registration&#45;&gt;case -->
<g id="edge15" class="edge">
<title>registration&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2079.1402,-1145.7785C2051.8736,-1097.2681 1981.3732,-985.8831 1886.5,-940 1851.2421,-922.9484 1810.8709,-909.9554 1773.2088,-900.2606"/>
<polygon fill="#000000" stroke="#000000" points="1773.7343,-896.7838 1763.1827,-897.74 1772.0276,-903.5726 1773.7343,-896.7838"/>
<text text-anchor="middle" x="1935.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_surgery -->
<g id="node17" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2772.5,-1905.5C2772.5,-1905.5 3118.5,-1905.5 3118.5,-1905.5 3124.5,-1905.5 3130.5,-1911.5 3130.5,-1917.5 3130.5,-1917.5 3130.5,-2054.5 3130.5,-2054.5 3130.5,-2060.5 3124.5,-2066.5 3118.5,-2066.5 3118.5,-2066.5 2772.5,-2066.5 2772.5,-2066.5 2766.5,-2066.5 2760.5,-2060.5 2760.5,-2054.5 2760.5,-2054.5 2760.5,-1917.5 2760.5,-1917.5 2760.5,-1911.5 2766.5,-1905.5 2772.5,-1905.5"/>
<text text-anchor="middle" x="2818" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2875.5,-1905.5 2875.5,-2066.5 "/>
<text text-anchor="middle" x="2886" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2896.5,-1905.5 2896.5,-2066.5 "/>
<text text-anchor="middle" x="3003" y="-2051.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2896.5,-2043.5 3109.5,-2043.5 "/>
<text text-anchor="middle" x="3003" y="-2028.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2896.5,-2020.5 3109.5,-2020.5 "/>
<text text-anchor="middle" x="3003" y="-2005.3" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2896.5,-1997.5 3109.5,-1997.5 "/>
<text text-anchor="middle" x="3003" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2896.5,-1974.5 3109.5,-1974.5 "/>
<text text-anchor="middle" x="3003" y="-1959.3" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2896.5,-1951.5 3109.5,-1951.5 "/>
<text text-anchor="middle" x="3003" y="-1936.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2896.5,-1928.5 3109.5,-1928.5 "/>
<text text-anchor="middle" x="3003" y="-1913.3" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="3109.5,-1905.5 3109.5,-2066.5 "/>
<text text-anchor="middle" x="3120" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge4" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2915.2786,-1905.3861C2884.5935,-1834.4084 2830.3268,-1733.4948 2751.5,-1675 2691.4962,-1630.4732 2515.7818,-1586.7362 2374.4228,-1557.1364"/>
<polygon fill="#000000" stroke="#000000" points="2374.8099,-1553.642 2364.3064,-1555.0299 2373.3828,-1560.495 2374.8099,-1553.642"/>
<text text-anchor="middle" x="2769.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge31" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M3130.613,-2029.6163C3141.7907,-2019.2419 3148.5,-2004.7031 3148.5,-1986 3148.5,-1971.5343 3144.4865,-1959.5598 3137.4962,-1950.0763"/>
<polygon fill="#000000" stroke="#000000" points="3139.8895,-1947.5022 3130.613,-1942.3837 3134.6729,-1952.1699 3139.8895,-1947.5022"/>
<text text-anchor="middle" x="3164.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- lab_exam -->
<g id="node18" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1726.5,-1968C1726.5,-1968 1786.5,-1968 1786.5,-1968 1792.5,-1968 1798.5,-1974 1798.5,-1980 1798.5,-1980 1798.5,-1992 1798.5,-1992 1798.5,-1998 1792.5,-2004 1786.5,-2004 1786.5,-2004 1726.5,-2004 1726.5,-2004 1720.5,-2004 1714.5,-1998 1714.5,-1992 1714.5,-1992 1714.5,-1980 1714.5,-1980 1714.5,-1974 1720.5,-1968 1726.5,-1968"/>
<text text-anchor="middle" x="1756.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge43" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1757.3652,-1967.8889C1758.9669,-1917.9603 1758.2035,-1775.4046 1704.5,-1675 1676.0646,-1621.8369 1622.4627,-1576.7322 1584.0644,-1549.117"/>
<polygon fill="#000000" stroke="#000000" points="1585.8167,-1546.0695 1575.6305,-1543.1555 1581.7762,-1551.7857 1585.8167,-1546.0695"/>
<text text-anchor="middle" x="1720.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration -->
<g id="node19" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1744.5C12,-1744.5 481,-1744.5 481,-1744.5 487,-1744.5 493,-1750.5 493,-1756.5 493,-1756.5 493,-2215.5 493,-2215.5 493,-2221.5 487,-2227.5 481,-2227.5 481,-2227.5 12,-2227.5 12,-2227.5 6,-2227.5 0,-2221.5 0,-2215.5 0,-2215.5 0,-1756.5 0,-1756.5 0,-1750.5 6,-1744.5 12,-1744.5"/>
<text text-anchor="middle" x="85" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1744.5 170,-2227.5 "/>
<text text-anchor="middle" x="180.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1744.5 191,-2227.5 "/>
<text text-anchor="middle" x="331.5" y="-2212.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-2204.5 472,-2204.5 "/>
<text text-anchor="middle" x="331.5" y="-2189.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-2181.5 472,-2181.5 "/>
<text text-anchor="middle" x="331.5" y="-2166.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-2158.5 472,-2158.5 "/>
<text text-anchor="middle" x="331.5" y="-2143.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="191,-2135.5 472,-2135.5 "/>
<text text-anchor="middle" x="331.5" y="-2120.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="191,-2112.5 472,-2112.5 "/>
<text text-anchor="middle" x="331.5" y="-2097.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="191,-2089.5 472,-2089.5 "/>
<text text-anchor="middle" x="331.5" y="-2074.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-2066.5 472,-2066.5 "/>
<text text-anchor="middle" x="331.5" y="-2051.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2043.5 472,-2043.5 "/>
<text text-anchor="middle" x="331.5" y="-2028.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="191,-2020.5 472,-2020.5 "/>
<text text-anchor="middle" x="331.5" y="-2005.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1997.5 472,-1997.5 "/>
<text text-anchor="middle" x="331.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-1974.5 472,-1974.5 "/>
<text text-anchor="middle" x="331.5" y="-1959.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1951.5 472,-1951.5 "/>
<text text-anchor="middle" x="331.5" y="-1936.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-1928.5 472,-1928.5 "/>
<text text-anchor="middle" x="331.5" y="-1913.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1905.5 472,-1905.5 "/>
<text text-anchor="middle" x="331.5" y="-1890.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-1882.5 472,-1882.5 "/>
<text text-anchor="middle" x="331.5" y="-1867.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1859.5 472,-1859.5 "/>
<text text-anchor="middle" x="331.5" y="-1844.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="191,-1836.5 472,-1836.5 "/>
<text text-anchor="middle" x="331.5" y="-1821.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-1813.5 472,-1813.5 "/>
<text text-anchor="middle" x="331.5" y="-1798.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1790.5 472,-1790.5 "/>
<text text-anchor="middle" x="331.5" y="-1775.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-1767.5 472,-1767.5 "/>
<text text-anchor="middle" x="331.5" y="-1752.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="472,-1744.5 472,-2227.5 "/>
<text text-anchor="middle" x="482.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge37" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M230.887,-1744.3063C230.1004,-1512.6955 268.5175,-1170.0737 476.5,-973 537.5429,-915.1588 762.7877,-891.2669 911.1871,-881.6612"/>
<polygon fill="#000000" stroke="#000000" points="911.5329,-885.1464 921.2917,-881.0215 911.0905,-878.1604 911.5329,-885.1464"/>
<text text-anchor="middle" x="297.5" y="-1386.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge42" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M412.1398,-1744.2987C439.2452,-1717.5206 469.1628,-1693.349 501.5,-1675 658.7241,-1585.7869 1195.8269,-1541.7512 1429.465,-1526.4562"/>
<polygon fill="#000000" stroke="#000000" points="1429.9292,-1529.9335 1439.6815,-1525.7931 1429.4758,-1522.9482 1429.9292,-1529.9335"/>
<text text-anchor="middle" x="608.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- follow_up -->
<g id="node20" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2268.5,-1065.5C2268.5,-1065.5 2600.5,-1065.5 2600.5,-1065.5 2606.5,-1065.5 2612.5,-1071.5 2612.5,-1077.5 2612.5,-1077.5 2612.5,-1260.5 2612.5,-1260.5 2612.5,-1266.5 2606.5,-1272.5 2600.5,-1272.5 2600.5,-1272.5 2268.5,-1272.5 2268.5,-1272.5 2262.5,-1272.5 2256.5,-1266.5 2256.5,-1260.5 2256.5,-1260.5 2256.5,-1077.5 2256.5,-1077.5 2256.5,-1071.5 2262.5,-1065.5 2268.5,-1065.5"/>
<text text-anchor="middle" x="2299" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2341.5,-1065.5 2341.5,-1272.5 "/>
<text text-anchor="middle" x="2352" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2362.5,-1065.5 2362.5,-1272.5 "/>
<text text-anchor="middle" x="2477" y="-1257.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1249.5 2591.5,-1249.5 "/>
<text text-anchor="middle" x="2477" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1226.5 2591.5,-1226.5 "/>
<text text-anchor="middle" x="2477" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1203.5 2591.5,-1203.5 "/>
<text text-anchor="middle" x="2477" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1180.5 2591.5,-1180.5 "/>
<text text-anchor="middle" x="2477" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1157.5 2591.5,-1157.5 "/>
<text text-anchor="middle" x="2477" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1134.5 2591.5,-1134.5 "/>
<text text-anchor="middle" x="2477" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1111.5 2591.5,-1111.5 "/>
<text text-anchor="middle" x="2477" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2362.5,-1088.5 2591.5,-1088.5 "/>
<text text-anchor="middle" x="2477" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2591.5,-1065.5 2591.5,-1272.5 "/>
<text text-anchor="middle" x="2602" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge11" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2358.5434,-1065.2825C2327.8917,-1030.6333 2289.7486,-995.2215 2247.5,-973 2167.3496,-930.8432 1926.4922,-901.6858 1773.6606,-886.8497"/>
<polygon fill="#000000" stroke="#000000" points="1773.5575,-883.3237 1763.2682,-885.8497 1772.887,-890.2915 1773.5575,-883.3237"/>
<text text-anchor="middle" x="2228.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- demographic -->
<g id="node21" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M497.5,-1088.5C497.5,-1088.5 833.5,-1088.5 833.5,-1088.5 839.5,-1088.5 845.5,-1094.5 845.5,-1100.5 845.5,-1100.5 845.5,-1237.5 845.5,-1237.5 845.5,-1243.5 839.5,-1249.5 833.5,-1249.5 833.5,-1249.5 497.5,-1249.5 497.5,-1249.5 491.5,-1249.5 485.5,-1243.5 485.5,-1237.5 485.5,-1237.5 485.5,-1100.5 485.5,-1100.5 485.5,-1094.5 491.5,-1088.5 497.5,-1088.5"/>
<text text-anchor="middle" x="540.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="595.5,-1088.5 595.5,-1249.5 "/>
<text text-anchor="middle" x="606" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="616.5,-1088.5 616.5,-1249.5 "/>
<text text-anchor="middle" x="720.5" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="616.5,-1226.5 824.5,-1226.5 "/>
<text text-anchor="middle" x="720.5" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="616.5,-1203.5 824.5,-1203.5 "/>
<text text-anchor="middle" x="720.5" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="616.5,-1180.5 824.5,-1180.5 "/>
<text text-anchor="middle" x="720.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="616.5,-1157.5 824.5,-1157.5 "/>
<text text-anchor="middle" x="720.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="616.5,-1134.5 824.5,-1134.5 "/>
<text text-anchor="middle" x="720.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="616.5,-1111.5 824.5,-1111.5 "/>
<text text-anchor="middle" x="720.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="824.5,-1088.5 824.5,-1249.5 "/>
<text text-anchor="middle" x="835" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge10" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M725.128,-1088.2295C758.8611,-1047.9757 804.295,-1001.8562 854.5,-973 908.0512,-942.2204 928.5912,-950.2582 989.5,-940 1073.5809,-925.8392 1095.6378,-930.2786 1180.5,-922 1291.429,-911.1785 1417.3236,-898.4495 1509.4891,-889.0478"/>
<polygon fill="#000000" stroke="#000000" points="1510.1165,-892.502 1519.7094,-888.0047 1509.4057,-885.5382 1510.1165,-892.502"/>
<text text-anchor="middle" x="1016.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge12" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1534.5988,-1134.4408C1552.9201,-1089.5803 1585.9468,-1008.8797 1614.5,-940 1615.7319,-937.0283 1616.9981,-933.9806 1618.2782,-930.9046"/>
<polygon fill="#000000" stroke="#000000" points="1621.5234,-932.216 1622.1403,-921.6392 1615.0622,-929.5228 1621.5234,-932.216"/>
<text text-anchor="middle" x="1641.5" y="-943.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- program -->
<g id="node25" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1863.5,-.5C1863.5,-.5 2171.5,-.5 2171.5,-.5 2177.5,-.5 2183.5,-6.5 2183.5,-12.5 2183.5,-12.5 2183.5,-126.5 2183.5,-126.5 2183.5,-132.5 2177.5,-138.5 2171.5,-138.5 2171.5,-138.5 1863.5,-138.5 1863.5,-138.5 1857.5,-138.5 1851.5,-132.5 1851.5,-126.5 1851.5,-126.5 1851.5,-12.5 1851.5,-12.5 1851.5,-6.5 1857.5,-.5 1863.5,-.5"/>
<text text-anchor="middle" x="1890.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1929.5,-.5 1929.5,-138.5 "/>
<text text-anchor="middle" x="1940" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1950.5,-.5 1950.5,-138.5 "/>
<text text-anchor="middle" x="2056.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1950.5,-115.5 2162.5,-115.5 "/>
<text text-anchor="middle" x="2056.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1950.5,-92.5 2162.5,-92.5 "/>
<text text-anchor="middle" x="2056.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1950.5,-69.5 2162.5,-69.5 "/>
<text text-anchor="middle" x="2056.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1950.5,-46.5 2162.5,-46.5 "/>
<text text-anchor="middle" x="2056.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1950.5,-23.5 2162.5,-23.5 "/>
<text text-anchor="middle" x="2056.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2162.5,-.5 2162.5,-138.5 "/>
<text text-anchor="middle" x="2173" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge20" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2017.5,-190.4932C2017.5,-176.7786 2017.5,-162.5421 2017.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="2021.0001,-148.5183 2017.5,-138.5184 2014.0001,-148.5184 2021.0001,-148.5183"/>
<text text-anchor="middle" x="2058" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node26" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2438,-426.5C2438,-426.5 2755,-426.5 2755,-426.5 2761,-426.5 2767,-432.5 2767,-438.5 2767,-438.5 2767,-483.5 2767,-483.5 2767,-489.5 2761,-495.5 2755,-495.5 2755,-495.5 2438,-495.5 2438,-495.5 2432,-495.5 2426,-489.5 2426,-483.5 2426,-483.5 2426,-438.5 2426,-438.5 2426,-432.5 2432,-426.5 2438,-426.5"/>
<text text-anchor="middle" x="2471" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2516,-426.5 2516,-495.5 "/>
<text text-anchor="middle" x="2526.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2537,-426.5 2537,-495.5 "/>
<text text-anchor="middle" x="2641.5" y="-480.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2537,-472.5 2746,-472.5 "/>
<text text-anchor="middle" x="2641.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2537,-449.5 2746,-449.5 "/>
<text text-anchor="middle" x="2641.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2746,-426.5 2746,-495.5 "/>
<text text-anchor="middle" x="2756.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge34" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2491.3118,-426.4823C2404.2181,-397.9023 2279.0262,-356.8203 2179.1994,-324.062"/>
<polygon fill="#000000" stroke="#000000" points="2180.2129,-320.711 2169.6201,-320.9185 2178.0303,-327.362 2180.2129,-320.711"/>
<text text-anchor="middle" x="2389" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge8" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M958.1186,-1737.1423C978.0162,-1715.9495 998.004,-1694.9901 1017.5,-1675 1156.649,-1532.3246 1253.0898,-1543.6123 1341.5,-1365 1419.2727,-1207.8784 1278.1024,-1111.5697 1385.5,-973 1415.8274,-933.8701 1463.8189,-910.4415 1510.0948,-896.4151"/>
<polygon fill="#000000" stroke="#000000" points="1511.3063,-899.7081 1519.9366,-893.5625 1509.3575,-892.9848 1511.3063,-899.7081"/>
<text text-anchor="middle" x="1358.5" y="-1386.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge40" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M958.2084,-1710.3572C977.0842,-1696.7851 996.884,-1684.7678 1017.5,-1675 1086.4767,-1642.3191 1289.0754,-1683.9138 1360.5,-1657 1370.5678,-1653.2063 1370.9997,-1648.5953 1379.5,-1642 1420.6687,-1610.0573 1468.1851,-1573.9172 1500.6736,-1549.317"/>
<polygon fill="#000000" stroke="#000000" points="1503.1461,-1551.8351 1509.008,-1543.0097 1498.9219,-1546.2533 1503.1461,-1551.8351"/>
<text text-anchor="middle" x="1407.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge32" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M958.0955,-2026.79C969.3572,-2016.6592 976,-2003.0625 976,-1986 976,-1972.8032 972.0262,-1961.6797 965.0151,-1952.6295"/>
<polygon fill="#000000" stroke="#000000" points="967.4756,-1950.136 958.0955,-1945.21 962.3563,-1954.9103 967.4756,-1950.136"/>
<text text-anchor="middle" x="992" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- vital_signs -->
<g id="node28" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1397,-1825C1397,-1825 1684,-1825 1684,-1825 1690,-1825 1696,-1831 1696,-1837 1696,-1837 1696,-2135 1696,-2135 1696,-2141 1690,-2147 1684,-2147 1684,-2147 1397,-2147 1397,-2147 1391,-2147 1385,-2141 1385,-2135 1385,-2135 1385,-1837 1385,-1837 1385,-1831 1391,-1825 1397,-1825"/>
<text text-anchor="middle" x="1431.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1478,-1825 1478,-2147 "/>
<text text-anchor="middle" x="1488.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1499,-1825 1499,-2147 "/>
<text text-anchor="middle" x="1587" y="-2131.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1499,-2124 1675,-2124 "/>
<text text-anchor="middle" x="1587" y="-2108.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1499,-2101 1675,-2101 "/>
<text text-anchor="middle" x="1587" y="-2085.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1499,-2078 1675,-2078 "/>
<text text-anchor="middle" x="1587" y="-2062.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1499,-2055 1675,-2055 "/>
<text text-anchor="middle" x="1587" y="-2039.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1499,-2032 1675,-2032 "/>
<text text-anchor="middle" x="1587" y="-2016.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1499,-2009 1675,-2009 "/>
<text text-anchor="middle" x="1587" y="-1993.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1499,-1986 1675,-1986 "/>
<text text-anchor="middle" x="1587" y="-1970.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1499,-1963 1675,-1963 "/>
<text text-anchor="middle" x="1587" y="-1947.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1499,-1940 1675,-1940 "/>
<text text-anchor="middle" x="1587" y="-1924.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1499,-1917 1675,-1917 "/>
<text text-anchor="middle" x="1587" y="-1901.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1499,-1894 1675,-1894 "/>
<text text-anchor="middle" x="1587" y="-1878.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1499,-1871 1675,-1871 "/>
<text text-anchor="middle" x="1587" y="-1855.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1499,-1848 1675,-1848 "/>
<text text-anchor="middle" x="1587" y="-1832.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1675,-1825 1675,-2147 "/>
<text text-anchor="middle" x="1685.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge41" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1540.1545,-1824.9767C1539.9434,-1726.6117 1539.6916,-1609.2684 1539.5711,-1553.1243"/>
<polygon fill="#000000" stroke="#000000" points="1543.071,-1553.0455 1539.5495,-1543.0531 1536.071,-1553.0606 1543.071,-1553.0455"/>
<text text-anchor="middle" x="1568.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge21" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1567.6699,-414.8851C1654.6385,-387.0668 1765.6385,-351.5618 1855.6135,-322.7819"/>
<polygon fill="#000000" stroke="#000000" points="1856.9046,-326.0437 1865.3629,-319.6634 1854.772,-319.3764 1856.9046,-326.0437"/>
<text text-anchor="middle" x="1744" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- physical_exam -->
<g id="node31" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1866.5,-1894C1866.5,-1894 2182.5,-1894 2182.5,-1894 2188.5,-1894 2194.5,-1900 2194.5,-1906 2194.5,-1906 2194.5,-2066 2194.5,-2066 2194.5,-2072 2188.5,-2078 2182.5,-2078 2182.5,-2078 1866.5,-2078 1866.5,-2078 1860.5,-2078 1854.5,-2072 1854.5,-2066 1854.5,-2066 1854.5,-1906 1854.5,-1906 1854.5,-1900 1860.5,-1894 1866.5,-1894"/>
<text text-anchor="middle" x="1915.5" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1976.5,-1894 1976.5,-2078 "/>
<text text-anchor="middle" x="1987" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1997.5,-1894 1997.5,-2078 "/>
<text text-anchor="middle" x="2085.5" y="-2062.8" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1997.5,-2055 2173.5,-2055 "/>
<text text-anchor="middle" x="2085.5" y="-2039.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1997.5,-2032 2173.5,-2032 "/>
<text text-anchor="middle" x="2085.5" y="-2016.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1997.5,-2009 2173.5,-2009 "/>
<text text-anchor="middle" x="2085.5" y="-1993.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1997.5,-1986 2173.5,-1986 "/>
<text text-anchor="middle" x="2085.5" y="-1970.8" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1997.5,-1963 2173.5,-1963 "/>
<text text-anchor="middle" x="2085.5" y="-1947.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1997.5,-1940 2173.5,-1940 "/>
<text text-anchor="middle" x="2085.5" y="-1924.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1997.5,-1917 2173.5,-1917 "/>
<text text-anchor="middle" x="2085.5" y="-1901.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2173.5,-1894 2173.5,-2078 "/>
<text text-anchor="middle" x="2184" y="-1982.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge3" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2054.7279,-1893.9334C2079.2897,-1819.1243 2114.0452,-1713.2677 2140.3111,-1633.2683"/>
<polygon fill="#000000" stroke="#000000" points="2143.6767,-1634.2371 2143.4709,-1623.6443 2137.026,-1632.0535 2143.6767,-1634.2371"/>
<text text-anchor="middle" x="2186.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge45" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1974.3865,-1893.8617C1935.1324,-1827.5046 1875.841,-1738.7942 1807.5,-1675 1747.0192,-1618.5431 1662.3758,-1573.9398 1604.4942,-1547.3473"/>
<polygon fill="#000000" stroke="#000000" points="1605.6373,-1544.0225 1595.085,-1543.0746 1602.743,-1550.3961 1605.6373,-1544.0225"/>
<text text-anchor="middle" x="1810.5" y="-1645.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
</g>
</svg>
</div>
