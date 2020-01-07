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
<svg width="3608pt" height="2966pt"
 viewBox="0.00 0.00 3608.00 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3604,-2962 3604,4 -4,4"/>
<!-- cohort -->
<g id="node1" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1892,-795C1892,-795 2125,-795 2125,-795 2131,-795 2137,-801 2137,-807 2137,-807 2137,-829 2137,-829 2137,-835 2131,-841 2125,-841 2125,-841 1892,-841 1892,-841 1886,-841 1880,-835 1880,-829 1880,-829 1880,-807 1880,-807 1880,-801 1886,-795 1892,-795"/>
<text text-anchor="middle" x="1911.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1943,-795 1943,-841 "/>
<text text-anchor="middle" x="1953.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1964,-795 1964,-841 "/>
<text text-anchor="middle" x="2040" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1964,-818 2116,-818 "/>
<text text-anchor="middle" x="2040" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2116,-795 2116,-841 "/>
<text text-anchor="middle" x="2126.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node11" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1596.5,-190.5C1596.5,-190.5 1876.5,-190.5 1876.5,-190.5 1882.5,-190.5 1888.5,-196.5 1888.5,-202.5 1888.5,-202.5 1888.5,-339.5 1888.5,-339.5 1888.5,-345.5 1882.5,-351.5 1876.5,-351.5 1876.5,-351.5 1596.5,-351.5 1596.5,-351.5 1590.5,-351.5 1584.5,-345.5 1584.5,-339.5 1584.5,-339.5 1584.5,-202.5 1584.5,-202.5 1584.5,-196.5 1590.5,-190.5 1596.5,-190.5"/>
<text text-anchor="middle" x="1612.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1640.5,-190.5 1640.5,-351.5 "/>
<text text-anchor="middle" x="1651" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1661.5,-190.5 1661.5,-351.5 "/>
<text text-anchor="middle" x="1764.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1661.5,-328.5 1867.5,-328.5 "/>
<text text-anchor="middle" x="1764.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1661.5,-305.5 1867.5,-305.5 "/>
<text text-anchor="middle" x="1764.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1661.5,-282.5 1867.5,-282.5 "/>
<text text-anchor="middle" x="1764.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1661.5,-259.5 1867.5,-259.5 "/>
<text text-anchor="middle" x="1764.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1661.5,-236.5 1867.5,-236.5 "/>
<text text-anchor="middle" x="1764.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1661.5,-213.5 1867.5,-213.5 "/>
<text text-anchor="middle" x="1764.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1867.5,-190.5 1867.5,-351.5 "/>
<text text-anchor="middle" x="1878" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge10" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1996.9862,-794.8455C1960.401,-721.2715 1845.4401,-490.0817 1781.1456,-360.7835"/>
<polygon fill="#000000" stroke="#000000" points="1784.1922,-359.0494 1776.6057,-351.6537 1777.9243,-362.1662 1784.1922,-359.0494"/>
<text text-anchor="middle" x="1892" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node19" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1168,-403.5C1168,-403.5 1537,-403.5 1537,-403.5 1543,-403.5 1549,-409.5 1549,-415.5 1549,-415.5 1549,-460.5 1549,-460.5 1549,-466.5 1543,-472.5 1537,-472.5 1537,-472.5 1168,-472.5 1168,-472.5 1162,-472.5 1156,-466.5 1156,-460.5 1156,-460.5 1156,-415.5 1156,-415.5 1156,-409.5 1162,-403.5 1168,-403.5"/>
<text text-anchor="middle" x="1202" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1248,-403.5 1248,-472.5 "/>
<text text-anchor="middle" x="1258.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1269,-403.5 1269,-472.5 "/>
<text text-anchor="middle" x="1398.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1269,-449.5 1528,-449.5 "/>
<text text-anchor="middle" x="1398.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1269,-426.5 1528,-426.5 "/>
<text text-anchor="middle" x="1398.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="1528,-403.5 1528,-472.5 "/>
<text text-anchor="middle" x="1538.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge11" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1999.9878,-794.7332C1982.9258,-751.8718 1940.1016,-661.2436 1870.5,-622 1728.2678,-541.805 1248.8793,-690.398 1137.5,-571 1100.4795,-531.3142 1149.3827,-498.9366 1209.8415,-476.0662"/>
<polygon fill="#000000" stroke="#000000" points="1211.0517,-479.3504 1219.2337,-472.6195 1208.6401,-472.7789 1211.0517,-479.3504"/>
<text text-anchor="middle" x="1178" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- image -->
<g id="node2" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1516.5,-2836C1516.5,-2836 1552.5,-2836 1552.5,-2836 1558.5,-2836 1564.5,-2842 1564.5,-2848 1564.5,-2848 1564.5,-2860 1564.5,-2860 1564.5,-2866 1558.5,-2872 1552.5,-2872 1552.5,-2872 1516.5,-2872 1516.5,-2872 1510.5,-2872 1504.5,-2866 1504.5,-2860 1504.5,-2860 1504.5,-2848 1504.5,-2848 1504.5,-2842 1510.5,-2836 1516.5,-2836"/>
<text text-anchor="middle" x="1534.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node15" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1518.5,-2662.5C1518.5,-2662.5 1550.5,-2662.5 1550.5,-2662.5 1556.5,-2662.5 1562.5,-2668.5 1562.5,-2674.5 1562.5,-2674.5 1562.5,-2686.5 1562.5,-2686.5 1562.5,-2692.5 1556.5,-2698.5 1550.5,-2698.5 1550.5,-2698.5 1518.5,-2698.5 1518.5,-2698.5 1512.5,-2698.5 1506.5,-2692.5 1506.5,-2686.5 1506.5,-2686.5 1506.5,-2674.5 1506.5,-2674.5 1506.5,-2668.5 1512.5,-2662.5 1518.5,-2662.5"/>
<text text-anchor="middle" x="1534.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge4" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1534.5,-2835.7604C1534.5,-2805.5622 1534.5,-2744.9545 1534.5,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1538.0001,-2708.7555 1534.5,-2698.7556 1531.0001,-2708.7556 1538.0001,-2708.7555"/>
<text text-anchor="middle" x="1565" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- lab_exam -->
<g id="node3" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1396.5,-2008.5C1396.5,-2008.5 1456.5,-2008.5 1456.5,-2008.5 1462.5,-2008.5 1468.5,-2014.5 1468.5,-2020.5 1468.5,-2020.5 1468.5,-2032.5 1468.5,-2032.5 1468.5,-2038.5 1462.5,-2044.5 1456.5,-2044.5 1456.5,-2044.5 1396.5,-2044.5 1396.5,-2044.5 1390.5,-2044.5 1384.5,-2038.5 1384.5,-2032.5 1384.5,-2032.5 1384.5,-2020.5 1384.5,-2020.5 1384.5,-2014.5 1390.5,-2008.5 1396.5,-2008.5"/>
<text text-anchor="middle" x="1426.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- visit -->
<g id="node28" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1447,-1549C1447,-1549 1622,-1549 1622,-1549 1628,-1549 1634,-1555 1634,-1561 1634,-1561 1634,-1583 1634,-1583 1634,-1589 1628,-1595 1622,-1595 1622,-1595 1447,-1595 1447,-1595 1441,-1595 1435,-1589 1435,-1583 1435,-1583 1435,-1561 1435,-1561 1435,-1555 1441,-1549 1447,-1549"/>
<text text-anchor="middle" x="1458.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1482,-1549 1482,-1595 "/>
<text text-anchor="middle" x="1492.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1503,-1549 1503,-1595 "/>
<text text-anchor="middle" x="1558" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1503,-1572 1613,-1572 "/>
<text text-anchor="middle" x="1558" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1613,-1549 1613,-1595 "/>
<text text-anchor="middle" x="1623.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge24" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1428.4113,-2008.3608C1433.6209,-1961.3131 1449.5794,-1831.7332 1477.5,-1727 1489.0293,-1683.7525 1507.6926,-1635.6133 1520.5025,-1604.6293"/>
<polygon fill="#000000" stroke="#000000" points="1523.8162,-1605.7769 1524.4394,-1595.2004 1517.3566,-1603.0797 1523.8162,-1605.7769"/>
<text text-anchor="middle" x="1514.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration -->
<g id="node4" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M527,-1785C527,-1785 996,-1785 996,-1785 1002,-1785 1008,-1791 1008,-1797 1008,-1797 1008,-2256 1008,-2256 1008,-2262 1002,-2268 996,-2268 996,-2268 527,-2268 527,-2268 521,-2268 515,-2262 515,-2256 515,-2256 515,-1797 515,-1797 515,-1791 521,-1785 527,-1785"/>
<text text-anchor="middle" x="600" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="685,-1785 685,-2268 "/>
<text text-anchor="middle" x="695.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="706,-1785 706,-2268 "/>
<text text-anchor="middle" x="846.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-2245 987,-2245 "/>
<text text-anchor="middle" x="846.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="706,-2222 987,-2222 "/>
<text text-anchor="middle" x="846.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="706,-2199 987,-2199 "/>
<text text-anchor="middle" x="846.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="706,-2176 987,-2176 "/>
<text text-anchor="middle" x="846.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="706,-2153 987,-2153 "/>
<text text-anchor="middle" x="846.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="706,-2130 987,-2130 "/>
<text text-anchor="middle" x="846.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-2107 987,-2107 "/>
<text text-anchor="middle" x="846.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="706,-2084 987,-2084 "/>
<text text-anchor="middle" x="846.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="706,-2061 987,-2061 "/>
<text text-anchor="middle" x="846.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="706,-2038 987,-2038 "/>
<text text-anchor="middle" x="846.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="706,-2015 987,-2015 "/>
<text text-anchor="middle" x="846.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="706,-1992 987,-1992 "/>
<text text-anchor="middle" x="846.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="706,-1969 987,-1969 "/>
<text text-anchor="middle" x="846.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="706,-1946 987,-1946 "/>
<text text-anchor="middle" x="846.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="706,-1923 987,-1923 "/>
<text text-anchor="middle" x="846.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-1900 987,-1900 "/>
<text text-anchor="middle" x="846.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="706,-1877 987,-1877 "/>
<text text-anchor="middle" x="846.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="706,-1854 987,-1854 "/>
<text text-anchor="middle" x="846.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="706,-1831 987,-1831 "/>
<text text-anchor="middle" x="846.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="706,-1808 987,-1808 "/>
<text text-anchor="middle" x="846.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="987,-1785 987,-2268 "/>
<text text-anchor="middle" x="997.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent -->
<g id="node17" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1239.5,-524.5C1239.5,-524.5 1465.5,-524.5 1465.5,-524.5 1471.5,-524.5 1477.5,-530.5 1477.5,-536.5 1477.5,-536.5 1477.5,-558.5 1477.5,-558.5 1477.5,-564.5 1471.5,-570.5 1465.5,-570.5 1465.5,-570.5 1239.5,-570.5 1239.5,-570.5 1233.5,-570.5 1227.5,-564.5 1227.5,-558.5 1227.5,-558.5 1227.5,-536.5 1227.5,-536.5 1227.5,-530.5 1233.5,-524.5 1239.5,-524.5"/>
<text text-anchor="middle" x="1256" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1284.5,-524.5 1284.5,-570.5 "/>
<text text-anchor="middle" x="1295" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1305.5,-524.5 1305.5,-570.5 "/>
<text text-anchor="middle" x="1381" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1305.5,-547.5 1456.5,-547.5 "/>
<text text-anchor="middle" x="1381" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1456.5,-524.5 1456.5,-570.5 "/>
<text text-anchor="middle" x="1467" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge38" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M820.7935,-1784.9641C833.145,-1716.5575 842.5,-1641.7301 842.5,-1572 842.5,-1572 842.5,-1572 842.5,-1111.5 842.5,-890.913 768.7964,-778.253 924.5,-622 969.7929,-576.5473 1140.0399,-582.0154 1217.0491,-571.7225"/>
<polygon fill="#000000" stroke="#000000" points="1217.9181,-575.1304 1227.2739,-570.1586 1216.8597,-568.2109 1217.9181,-575.1304"/>
<text text-anchor="middle" x="873.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge23" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M945.1439,-1784.6638C967.8965,-1763.2809 992.1389,-1743.5222 1017.5,-1727 1143.3142,-1645.0349 1314.1955,-1604.9504 1424.4247,-1586.4314"/>
<polygon fill="#000000" stroke="#000000" points="1425.2702,-1589.8394 1434.5677,-1584.7595 1424.1316,-1582.9326 1425.2702,-1589.8394"/>
<text text-anchor="middle" x="1096.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event -->
<g id="node5" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M2167,-622.5C2167,-622.5 2562,-622.5 2562,-622.5 2568,-622.5 2574,-628.5 2574,-634.5 2574,-634.5 2574,-1001.5 2574,-1001.5 2574,-1007.5 2568,-1013.5 2562,-1013.5 2562,-1013.5 2167,-1013.5 2167,-1013.5 2161,-1013.5 2155,-1007.5 2155,-1001.5 2155,-1001.5 2155,-634.5 2155,-634.5 2155,-628.5 2161,-622.5 2167,-622.5"/>
<text text-anchor="middle" x="2215" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="2275,-622.5 2275,-1013.5 "/>
<text text-anchor="middle" x="2285.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2296,-622.5 2296,-1013.5 "/>
<text text-anchor="middle" x="2424.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="2296,-990.5 2553,-990.5 "/>
<text text-anchor="middle" x="2424.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="2296,-967.5 2553,-967.5 "/>
<text text-anchor="middle" x="2424.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="2296,-944.5 2553,-944.5 "/>
<text text-anchor="middle" x="2424.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="2296,-921.5 2553,-921.5 "/>
<text text-anchor="middle" x="2424.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="2296,-898.5 2553,-898.5 "/>
<text text-anchor="middle" x="2424.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2296,-875.5 2553,-875.5 "/>
<text text-anchor="middle" x="2424.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2296,-852.5 2553,-852.5 "/>
<text text-anchor="middle" x="2424.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2296,-829.5 2553,-829.5 "/>
<text text-anchor="middle" x="2424.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="2296,-806.5 2553,-806.5 "/>
<text text-anchor="middle" x="2424.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2296,-783.5 2553,-783.5 "/>
<text text-anchor="middle" x="2424.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2296,-760.5 2553,-760.5 "/>
<text text-anchor="middle" x="2424.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2296,-737.5 2553,-737.5 "/>
<text text-anchor="middle" x="2424.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2296,-714.5 2553,-714.5 "/>
<text text-anchor="middle" x="2424.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="2296,-691.5 2553,-691.5 "/>
<text text-anchor="middle" x="2424.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2296,-668.5 2553,-668.5 "/>
<text text-anchor="middle" x="2424.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="2296,-645.5 2553,-645.5 "/>
<text text-anchor="middle" x="2424.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="2553,-622.5 2553,-1013.5 "/>
<text text-anchor="middle" x="2563.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge32" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2574.2046,-845.2761C2585.376,-838.5862 2592,-829.4941 2592,-818 2592,-809.7386 2588.5781,-802.7181 2582.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2584.3073,-793.9155 2574.2046,-790.7239 2580.1119,-799.519 2584.3073,-793.9155"/>
<text text-anchor="middle" x="2608" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- case -->
<g id="node9" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1531,-1065.5C1531,-1065.5 1750,-1065.5 1750,-1065.5 1756,-1065.5 1762,-1071.5 1762,-1077.5 1762,-1077.5 1762,-1145.5 1762,-1145.5 1762,-1151.5 1756,-1157.5 1750,-1157.5 1750,-1157.5 1531,-1157.5 1531,-1157.5 1525,-1157.5 1519,-1151.5 1519,-1145.5 1519,-1145.5 1519,-1077.5 1519,-1077.5 1519,-1071.5 1525,-1065.5 1531,-1065.5"/>
<text text-anchor="middle" x="1543.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1568,-1065.5 1568,-1157.5 "/>
<text text-anchor="middle" x="1578.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1589,-1065.5 1589,-1157.5 "/>
<text text-anchor="middle" x="1665" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1589,-1134.5 1741,-1134.5 "/>
<text text-anchor="middle" x="1665" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1589,-1111.5 1741,-1111.5 "/>
<text text-anchor="middle" x="1665" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1589,-1088.5 1741,-1088.5 "/>
<text text-anchor="middle" x="1665" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1741,-1065.5 1741,-1157.5 "/>
<text text-anchor="middle" x="1751.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge17" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2309.467,-1013.5246C2300.3905,-1026.1434 2289.8171,-1037.5523 2277.5,-1047 2238.3504,-1077.0294 1947.0869,-1096.4307 1772.2578,-1105.5014"/>
<polygon fill="#000000" stroke="#000000" points="1772.0175,-1102.009 1762.2104,-1106.018 1772.377,-1108.9998 1772.0175,-1102.009"/>
<text text-anchor="middle" x="2319.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge37" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2154.9244,-626.3225C2151.7981,-624.821 2148.6561,-623.3787 2145.5,-622 2030.9127,-571.9442 1682.4472,-555.4313 1487.7477,-550.0501"/>
<polygon fill="#000000" stroke="#000000" points="1487.8244,-546.5509 1477.7335,-549.7793 1487.6352,-553.5484 1487.8244,-546.5509"/>
<text text-anchor="middle" x="2115.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- principal_investigator -->
<g id="node6" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M500,-403.5C500,-403.5 827,-403.5 827,-403.5 833,-403.5 839,-409.5 839,-415.5 839,-415.5 839,-460.5 839,-460.5 839,-466.5 833,-472.5 827,-472.5 827,-472.5 500,-472.5 500,-472.5 494,-472.5 488,-466.5 488,-460.5 488,-460.5 488,-415.5 488,-415.5 488,-409.5 494,-403.5 500,-403.5"/>
<text text-anchor="middle" x="575" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="662,-403.5 662,-472.5 "/>
<text text-anchor="middle" x="672.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="683,-403.5 683,-472.5 "/>
<text text-anchor="middle" x="750.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="683,-449.5 818,-449.5 "/>
<text text-anchor="middle" x="750.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="683,-426.5 818,-426.5 "/>
<text text-anchor="middle" x="750.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="818,-403.5 818,-472.5 "/>
<text text-anchor="middle" x="828.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge3" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M718.0175,-403.3516C740.2916,-390.7958 766.8218,-377.7972 792.5,-370 934.4683,-326.8911 1343.7905,-295.4449 1574.1039,-280.5837"/>
<polygon fill="#000000" stroke="#000000" points="1574.5002,-284.0656 1584.2554,-279.9319 1574.0516,-277.0799 1574.5002,-284.0656"/>
<text text-anchor="middle" x="823" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- off_study -->
<g id="node7" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M946,-714.5C946,-714.5 1361,-714.5 1361,-714.5 1367,-714.5 1373,-720.5 1373,-726.5 1373,-726.5 1373,-909.5 1373,-909.5 1373,-915.5 1367,-921.5 1361,-921.5 1361,-921.5 946,-921.5 946,-921.5 940,-921.5 934,-915.5 934,-909.5 934,-909.5 934,-726.5 934,-726.5 934,-720.5 940,-714.5 946,-714.5"/>
<text text-anchor="middle" x="975.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1017,-714.5 1017,-921.5 "/>
<text text-anchor="middle" x="1027.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1038,-714.5 1038,-921.5 "/>
<text text-anchor="middle" x="1195" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1038,-898.5 1352,-898.5 "/>
<text text-anchor="middle" x="1195" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1038,-875.5 1352,-875.5 "/>
<text text-anchor="middle" x="1195" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1038,-852.5 1352,-852.5 "/>
<text text-anchor="middle" x="1195" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1038,-829.5 1352,-829.5 "/>
<text text-anchor="middle" x="1195" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1038,-806.5 1352,-806.5 "/>
<text text-anchor="middle" x="1195" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1038,-783.5 1352,-783.5 "/>
<text text-anchor="middle" x="1195" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1038,-760.5 1352,-760.5 "/>
<text text-anchor="middle" x="1195" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1038,-737.5 1352,-737.5 "/>
<text text-anchor="middle" x="1195" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1352,-714.5 1352,-921.5 "/>
<text text-anchor="middle" x="1362.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs -->
<g id="node8" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1499,-1865.5C1499,-1865.5 1786,-1865.5 1786,-1865.5 1792,-1865.5 1798,-1871.5 1798,-1877.5 1798,-1877.5 1798,-2175.5 1798,-2175.5 1798,-2181.5 1792,-2187.5 1786,-2187.5 1786,-2187.5 1499,-2187.5 1499,-2187.5 1493,-2187.5 1487,-2181.5 1487,-2175.5 1487,-2175.5 1487,-1877.5 1487,-1877.5 1487,-1871.5 1493,-1865.5 1499,-1865.5"/>
<text text-anchor="middle" x="1533.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1580,-1865.5 1580,-2187.5 "/>
<text text-anchor="middle" x="1590.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1601,-1865.5 1601,-2187.5 "/>
<text text-anchor="middle" x="1689" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1601,-2164.5 1777,-2164.5 "/>
<text text-anchor="middle" x="1689" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1601,-2141.5 1777,-2141.5 "/>
<text text-anchor="middle" x="1689" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1601,-2118.5 1777,-2118.5 "/>
<text text-anchor="middle" x="1689" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1601,-2095.5 1777,-2095.5 "/>
<text text-anchor="middle" x="1689" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1601,-2072.5 1777,-2072.5 "/>
<text text-anchor="middle" x="1689" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1601,-2049.5 1777,-2049.5 "/>
<text text-anchor="middle" x="1689" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1601,-2026.5 1777,-2026.5 "/>
<text text-anchor="middle" x="1689" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1601,-2003.5 1777,-2003.5 "/>
<text text-anchor="middle" x="1689" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1601,-1980.5 1777,-1980.5 "/>
<text text-anchor="middle" x="1689" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1601,-1957.5 1777,-1957.5 "/>
<text text-anchor="middle" x="1689" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1601,-1934.5 1777,-1934.5 "/>
<text text-anchor="middle" x="1689" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1601,-1911.5 1777,-1911.5 "/>
<text text-anchor="middle" x="1689" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1601,-1888.5 1777,-1888.5 "/>
<text text-anchor="middle" x="1689" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1777,-1865.5 1777,-2187.5 "/>
<text text-anchor="middle" x="1787.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge28" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1604.1952,-1865.3007C1581.6872,-1770.5793 1555.1949,-1659.0912 1542.3172,-1604.8973"/>
<polygon fill="#000000" stroke="#000000" points="1545.7188,-1604.0727 1540.0017,-1595.1528 1538.9084,-1605.6911 1545.7188,-1604.0727"/>
<text text-anchor="middle" x="1594.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge6" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1762.1332,-1074.5466C1799.3417,-1059.555 1838.778,-1039.6075 1870.5,-1014 1927.3985,-968.069 1971.2025,-892.8528 1993.0823,-850.1908"/>
<polygon fill="#000000" stroke="#000000" points="1996.2906,-851.6016 1997.6665,-841.0965 1990.0398,-848.4507 1996.2906,-851.6016"/>
<text text-anchor="middle" x="1884" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge42" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1762.1281,-1095.6241C1889.3707,-1077.6777 2079.6033,-1046.6794 2145.5,-1014 2145.5964,-1013.9522 2145.6928,-1013.9043 2145.7892,-1013.8564"/>
<polygon fill="#000000" stroke="#000000" points="2147.4416,-1016.9423 2154.7237,-1009.2467 2144.232,-1010.7215 2147.4416,-1016.9423"/>
<text text-anchor="middle" x="2166.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge29" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1518.8344,-1075.5737C1474.0688,-1059.844 1423.9676,-1039.1717 1381.5,-1014 1341.2147,-990.1219 1301.1637,-958.9082 1266.1302,-928.4332"/>
<polygon fill="#000000" stroke="#000000" points="1268.0944,-925.5002 1258.2696,-921.5348 1263.4772,-930.7615 1268.0944,-925.5002"/>
<text text-anchor="middle" x="1497" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge7" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1518.6961,-1102.1297C1326.1514,-1086.2564 968.6503,-1052.0686 924.5,-1014 855.7939,-954.7581 867.5,-908.72 867.5,-818 867.5,-818 867.5,-818 867.5,-438 867.5,-366.8412 1322.6688,-311.2098 1574.1681,-285.9025"/>
<polygon fill="#000000" stroke="#000000" points="1574.5358,-289.3832 1584.1373,-284.9044 1573.8384,-282.4181 1574.5358,-289.3832"/>
<text text-anchor="middle" x="908" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node26" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1403,-726C1403,-726 1850,-726 1850,-726 1856,-726 1862,-732 1862,-738 1862,-738 1862,-898 1862,-898 1862,-904 1856,-910 1850,-910 1850,-910 1403,-910 1403,-910 1397,-910 1391,-904 1391,-898 1391,-898 1391,-738 1391,-738 1391,-732 1397,-726 1403,-726"/>
<text text-anchor="middle" x="1448.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1506,-726 1506,-910 "/>
<text text-anchor="middle" x="1516.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1527,-726 1527,-910 "/>
<text text-anchor="middle" x="1684" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1527,-887 1841,-887 "/>
<text text-anchor="middle" x="1684" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1527,-864 1841,-864 "/>
<text text-anchor="middle" x="1684" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1527,-841 1841,-841 "/>
<text text-anchor="middle" x="1684" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1527,-818 1841,-818 "/>
<text text-anchor="middle" x="1684" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1527,-795 1841,-795 "/>
<text text-anchor="middle" x="1684" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1527,-772 1841,-772 "/>
<text text-anchor="middle" x="1684" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1527,-749 1841,-749 "/>
<text text-anchor="middle" x="1684" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1841,-726 1841,-910 "/>
<text text-anchor="middle" x="1851.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge30" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1638.2971,-1065.3178C1636.4457,-1026.5035 1633.7315,-969.604 1631.3733,-920.1644"/>
<polygon fill="#000000" stroke="#000000" points="1634.8639,-919.8826 1630.8913,-910.0607 1627.8718,-920.2162 1634.8639,-919.8826"/>
<text text-anchor="middle" x="1708.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- diagnosis -->
<g id="node10" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2784,-2344.5C2784,-2344.5 3127,-2344.5 3127,-2344.5 3133,-2344.5 3139,-2350.5 3139,-2356.5 3139,-2356.5 3139,-2631.5 3139,-2631.5 3139,-2637.5 3133,-2643.5 3127,-2643.5 3127,-2643.5 2784,-2643.5 2784,-2643.5 2778,-2643.5 2772,-2637.5 2772,-2631.5 2772,-2631.5 2772,-2356.5 2772,-2356.5 2772,-2350.5 2778,-2344.5 2784,-2344.5"/>
<text text-anchor="middle" x="2814" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2856,-2344.5 2856,-2643.5 "/>
<text text-anchor="middle" x="2866.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2877,-2344.5 2877,-2643.5 "/>
<text text-anchor="middle" x="2997.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2877,-2620.5 3118,-2620.5 "/>
<text text-anchor="middle" x="2997.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2877,-2597.5 3118,-2597.5 "/>
<text text-anchor="middle" x="2997.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2877,-2574.5 3118,-2574.5 "/>
<text text-anchor="middle" x="2997.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2877,-2551.5 3118,-2551.5 "/>
<text text-anchor="middle" x="2997.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2877,-2528.5 3118,-2528.5 "/>
<text text-anchor="middle" x="2997.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2877,-2505.5 3118,-2505.5 "/>
<text text-anchor="middle" x="2997.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2877,-2482.5 3118,-2482.5 "/>
<text text-anchor="middle" x="2997.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2877,-2459.5 3118,-2459.5 "/>
<text text-anchor="middle" x="2997.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2877,-2436.5 3118,-2436.5 "/>
<text text-anchor="middle" x="2997.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2877,-2413.5 3118,-2413.5 "/>
<text text-anchor="middle" x="2997.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2877,-2390.5 3118,-2390.5 "/>
<text text-anchor="middle" x="2997.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2877,-2367.5 3118,-2367.5 "/>
<text text-anchor="middle" x="2997.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="3118,-2344.5 3118,-2643.5 "/>
<text text-anchor="middle" x="3128.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge12" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M3139.0923,-2348.8177C3143.7239,-2341.4472 3147.895,-2333.838 3151.5,-2326 3207.1214,-2205.0668 3217.9942,-1842.313 3151.5,-1727 2921.9134,-1328.855 2689.6614,-1362.6251 2256.5,-1209 2095.6657,-1151.9585 1899.3866,-1128.1972 1772.2665,-1118.3584"/>
<polygon fill="#000000" stroke="#000000" points="1772.3285,-1114.8532 1762.0931,-1117.5893 1771.8008,-1121.8333 1772.3285,-1114.8532"/>
<text text-anchor="middle" x="3146.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- program -->
<g id="node18" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1582.5,-.5C1582.5,-.5 1890.5,-.5 1890.5,-.5 1896.5,-.5 1902.5,-6.5 1902.5,-12.5 1902.5,-12.5 1902.5,-126.5 1902.5,-126.5 1902.5,-132.5 1896.5,-138.5 1890.5,-138.5 1890.5,-138.5 1582.5,-138.5 1582.5,-138.5 1576.5,-138.5 1570.5,-132.5 1570.5,-126.5 1570.5,-126.5 1570.5,-12.5 1570.5,-12.5 1570.5,-6.5 1576.5,-.5 1582.5,-.5"/>
<text text-anchor="middle" x="1609.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1648.5,-.5 1648.5,-138.5 "/>
<text text-anchor="middle" x="1659" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1669.5,-.5 1669.5,-138.5 "/>
<text text-anchor="middle" x="1775.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1669.5,-115.5 1881.5,-115.5 "/>
<text text-anchor="middle" x="1775.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1669.5,-92.5 1881.5,-92.5 "/>
<text text-anchor="middle" x="1775.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1669.5,-69.5 1881.5,-69.5 "/>
<text text-anchor="middle" x="1775.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1669.5,-46.5 1881.5,-46.5 "/>
<text text-anchor="middle" x="1775.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1669.5,-23.5 1881.5,-23.5 "/>
<text text-anchor="middle" x="1775.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1881.5,-.5 1881.5,-138.5 "/>
<text text-anchor="middle" x="1892" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge9" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1736.5,-190.4932C1736.5,-176.7786 1736.5,-162.5421 1736.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="1740.0001,-148.5183 1736.5,-138.5184 1733.0001,-148.5184 1740.0001,-148.5183"/>
<text text-anchor="middle" x="1777" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- physical_exam -->
<g id="node12" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1828.5,-1934.5C1828.5,-1934.5 2144.5,-1934.5 2144.5,-1934.5 2150.5,-1934.5 2156.5,-1940.5 2156.5,-1946.5 2156.5,-1946.5 2156.5,-2106.5 2156.5,-2106.5 2156.5,-2112.5 2150.5,-2118.5 2144.5,-2118.5 2144.5,-2118.5 1828.5,-2118.5 1828.5,-2118.5 1822.5,-2118.5 1816.5,-2112.5 1816.5,-2106.5 1816.5,-2106.5 1816.5,-1946.5 1816.5,-1946.5 1816.5,-1940.5 1822.5,-1934.5 1828.5,-1934.5"/>
<text text-anchor="middle" x="1877.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1938.5,-1934.5 1938.5,-2118.5 "/>
<text text-anchor="middle" x="1949" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1959.5,-1934.5 1959.5,-2118.5 "/>
<text text-anchor="middle" x="2047.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2095.5 2135.5,-2095.5 "/>
<text text-anchor="middle" x="2047.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2072.5 2135.5,-2072.5 "/>
<text text-anchor="middle" x="2047.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2049.5 2135.5,-2049.5 "/>
<text text-anchor="middle" x="2047.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2026.5 2135.5,-2026.5 "/>
<text text-anchor="middle" x="2047.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2003.5 2135.5,-2003.5 "/>
<text text-anchor="middle" x="2047.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1980.5 2135.5,-1980.5 "/>
<text text-anchor="middle" x="2047.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1957.5 2135.5,-1957.5 "/>
<text text-anchor="middle" x="2047.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2135.5,-1934.5 2135.5,-2118.5 "/>
<text text-anchor="middle" x="2146" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment -->
<g id="node25" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2141,-1468.5C2141,-1468.5 2490,-1468.5 2490,-1468.5 2496,-1468.5 2502,-1474.5 2502,-1480.5 2502,-1480.5 2502,-1663.5 2502,-1663.5 2502,-1669.5 2496,-1675.5 2490,-1675.5 2490,-1675.5 2141,-1675.5 2141,-1675.5 2135,-1675.5 2129,-1669.5 2129,-1663.5 2129,-1663.5 2129,-1480.5 2129,-1480.5 2129,-1474.5 2135,-1468.5 2141,-1468.5"/>
<text text-anchor="middle" x="2176.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2224,-1468.5 2224,-1675.5 "/>
<text text-anchor="middle" x="2234.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2245,-1468.5 2245,-1675.5 "/>
<text text-anchor="middle" x="2363" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2245,-1652.5 2481,-1652.5 "/>
<text text-anchor="middle" x="2363" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2245,-1629.5 2481,-1629.5 "/>
<text text-anchor="middle" x="2363" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2245,-1606.5 2481,-1606.5 "/>
<text text-anchor="middle" x="2363" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2245,-1583.5 2481,-1583.5 "/>
<text text-anchor="middle" x="2363" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2245,-1560.5 2481,-1560.5 "/>
<text text-anchor="middle" x="2363" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2245,-1537.5 2481,-1537.5 "/>
<text text-anchor="middle" x="2363" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2245,-1514.5 2481,-1514.5 "/>
<text text-anchor="middle" x="2363" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2245,-1491.5 2481,-1491.5 "/>
<text text-anchor="middle" x="2363" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2481,-1468.5 2481,-1675.5 "/>
<text text-anchor="middle" x="2491.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge40" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2034.4053,-1934.2116C2067.8299,-1873.1266 2115.2988,-1792.5111 2165.5,-1727 2176.7498,-1712.3193 2189.2422,-1697.5338 2202.0789,-1683.2304"/>
<polygon fill="#000000" stroke="#000000" points="2204.694,-1685.5569 2208.8183,-1675.7978 2199.5083,-1680.8549 2204.694,-1685.5569"/>
<text text-anchor="middle" x="2242.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge26" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1946.5376,-1934.3072C1915.3854,-1870.362 1867.2475,-1786.3543 1806.5,-1727 1747.1812,-1669.0416 1661.9429,-1625.1082 1602.7574,-1599.0715"/>
<polygon fill="#000000" stroke="#000000" points="1604.0567,-1595.82 1593.4901,-1595.047 1601.2683,-1602.2407 1604.0567,-1595.82"/>
<text text-anchor="middle" x="1809.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- prior_surgery -->
<g id="node13" class="node">
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
<text text-anchor="middle" x="2417" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2038 2523.5,-2038 "/>
<text text-anchor="middle" x="2417" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2015 2523.5,-2015 "/>
<text text-anchor="middle" x="2417" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1992 2523.5,-1992 "/>
<text text-anchor="middle" x="2417" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1969 2523.5,-1969 "/>
<text text-anchor="middle" x="2417" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2523.5,-1946 2523.5,-2107 "/>
<text text-anchor="middle" x="2534" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge33" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2544.613,-2068.5585C2555.7907,-2058.5547 2562.5,-2044.5352 2562.5,-2026.5 2562.5,-2012.5509 2558.4865,-2001.004 2551.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2553.9806,-1989.3911 2544.613,-1984.4415 2548.8494,-1994.1525 2553.9806,-1989.3911"/>
<text text-anchor="middle" x="2578.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge39" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2351.6844,-1945.7682C2344.6863,-1873.4814 2334.3502,-1766.714 2326.5149,-1685.7784"/>
<polygon fill="#000000" stroke="#000000" points="2329.9711,-1685.1563 2325.5237,-1675.5401 2323.0036,-1685.8308 2329.9711,-1685.1563"/>
<text text-anchor="middle" x="2379.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- disease_extent -->
<g id="node14" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1038.5,-1877C1038.5,-1877 1354.5,-1877 1354.5,-1877 1360.5,-1877 1366.5,-1883 1366.5,-1889 1366.5,-1889 1366.5,-2164 1366.5,-2164 1366.5,-2170 1360.5,-2176 1354.5,-2176 1354.5,-2176 1038.5,-2176 1038.5,-2176 1032.5,-2176 1026.5,-2170 1026.5,-2164 1026.5,-2164 1026.5,-1889 1026.5,-1889 1026.5,-1883 1032.5,-1877 1038.5,-1877"/>
<text text-anchor="middle" x="1088" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1149.5,-1877 1149.5,-2176 "/>
<text text-anchor="middle" x="1160" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1170.5,-1877 1170.5,-2176 "/>
<text text-anchor="middle" x="1258" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2153 1345.5,-2153 "/>
<text text-anchor="middle" x="1258" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2130 1345.5,-2130 "/>
<text text-anchor="middle" x="1258" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2107 1345.5,-2107 "/>
<text text-anchor="middle" x="1258" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2084 1345.5,-2084 "/>
<text text-anchor="middle" x="1258" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2061 1345.5,-2061 "/>
<text text-anchor="middle" x="1258" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2038 1345.5,-2038 "/>
<text text-anchor="middle" x="1258" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2015 1345.5,-2015 "/>
<text text-anchor="middle" x="1258" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1992 1345.5,-1992 "/>
<text text-anchor="middle" x="1258" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1969 1345.5,-1969 "/>
<text text-anchor="middle" x="1258" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1946 1345.5,-1946 "/>
<text text-anchor="middle" x="1258" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1923 1345.5,-1923 "/>
<text text-anchor="middle" x="1258" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1900 1345.5,-1900 "/>
<text text-anchor="middle" x="1258" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1345.5,-1877 1345.5,-2176 "/>
<text text-anchor="middle" x="1356" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge25" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1275.7358,-1876.7782C1304.5666,-1827.2809 1339.0849,-1773.1136 1375.5,-1727 1413.2114,-1679.2448 1464.8664,-1631.4524 1498.9331,-1601.8242"/>
<polygon fill="#000000" stroke="#000000" points="1501.4885,-1604.242 1506.771,-1595.058 1496.9143,-1598.9432 1501.4885,-1604.242"/>
<text text-anchor="middle" x="1431.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample -->
<g id="node20" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M12,-1796.5C12,-1796.5 435,-1796.5 435,-1796.5 441,-1796.5 447,-1802.5 447,-1808.5 447,-1808.5 447,-2244.5 447,-2244.5 447,-2250.5 441,-2256.5 435,-2256.5 435,-2256.5 12,-2256.5 12,-2256.5 6,-2256.5 0,-2250.5 0,-2244.5 0,-2244.5 0,-1808.5 0,-1808.5 0,-1802.5 6,-1796.5 12,-1796.5"/>
<text text-anchor="middle" x="34" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="68,-1796.5 68,-2256.5 "/>
<text text-anchor="middle" x="78.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="89,-1796.5 89,-2256.5 "/>
<text text-anchor="middle" x="257.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="89,-2233.5 426,-2233.5 "/>
<text text-anchor="middle" x="257.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-2210.5 426,-2210.5 "/>
<text text-anchor="middle" x="257.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2187.5 426,-2187.5 "/>
<text text-anchor="middle" x="257.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="89,-2164.5 426,-2164.5 "/>
<text text-anchor="middle" x="257.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-2141.5 426,-2141.5 "/>
<text text-anchor="middle" x="257.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-2118.5 426,-2118.5 "/>
<text text-anchor="middle" x="257.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="89,-2095.5 426,-2095.5 "/>
<text text-anchor="middle" x="257.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-2072.5 426,-2072.5 "/>
<text text-anchor="middle" x="257.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-2049.5 426,-2049.5 "/>
<text text-anchor="middle" x="257.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="89,-2026.5 426,-2026.5 "/>
<text text-anchor="middle" x="257.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="89,-2003.5 426,-2003.5 "/>
<text text-anchor="middle" x="257.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1980.5 426,-1980.5 "/>
<text text-anchor="middle" x="257.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="89,-1957.5 426,-1957.5 "/>
<text text-anchor="middle" x="257.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1934.5 426,-1934.5 "/>
<text text-anchor="middle" x="257.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="89,-1911.5 426,-1911.5 "/>
<text text-anchor="middle" x="257.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-1888.5 426,-1888.5 "/>
<text text-anchor="middle" x="257.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="89,-1865.5 426,-1865.5 "/>
<text text-anchor="middle" x="257.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="89,-1842.5 426,-1842.5 "/>
<text text-anchor="middle" x="257.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="89,-1819.5 426,-1819.5 "/>
<text text-anchor="middle" x="257.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="426,-1796.5 426,-2256.5 "/>
<text text-anchor="middle" x="436.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge22" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1506.108,-2675.8912C1379.8776,-2654.3933 860.2083,-2555.1773 505.5,-2326 477.5189,-2307.9214 450.3721,-2286.4875 424.6847,-2263.5213"/>
<polygon fill="#000000" stroke="#000000" points="426.8843,-2260.7914 417.1209,-2256.6771 422.1876,-2265.9819 426.8843,-2260.7914"/>
<text text-anchor="middle" x="1369" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- demographic -->
<g id="node16" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M882.5,-1232.5C882.5,-1232.5 1218.5,-1232.5 1218.5,-1232.5 1224.5,-1232.5 1230.5,-1238.5 1230.5,-1244.5 1230.5,-1244.5 1230.5,-1381.5 1230.5,-1381.5 1230.5,-1387.5 1224.5,-1393.5 1218.5,-1393.5 1218.5,-1393.5 882.5,-1393.5 882.5,-1393.5 876.5,-1393.5 870.5,-1387.5 870.5,-1381.5 870.5,-1381.5 870.5,-1244.5 870.5,-1244.5 870.5,-1238.5 876.5,-1232.5 882.5,-1232.5"/>
<text text-anchor="middle" x="925.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="980.5,-1232.5 980.5,-1393.5 "/>
<text text-anchor="middle" x="991" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1001.5,-1232.5 1001.5,-1393.5 "/>
<text text-anchor="middle" x="1105.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1001.5,-1370.5 1209.5,-1370.5 "/>
<text text-anchor="middle" x="1105.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1001.5,-1347.5 1209.5,-1347.5 "/>
<text text-anchor="middle" x="1105.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1001.5,-1324.5 1209.5,-1324.5 "/>
<text text-anchor="middle" x="1105.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1001.5,-1301.5 1209.5,-1301.5 "/>
<text text-anchor="middle" x="1105.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1001.5,-1278.5 1209.5,-1278.5 "/>
<text text-anchor="middle" x="1105.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1001.5,-1255.5 1209.5,-1255.5 "/>
<text text-anchor="middle" x="1105.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1209.5,-1232.5 1209.5,-1393.5 "/>
<text text-anchor="middle" x="1220" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge13" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1187.0436,-1232.4033C1204.3794,-1223.8063 1222.1337,-1215.7513 1239.5,-1209 1326.5926,-1175.1418 1429.0243,-1150.4763 1508.5608,-1134.4248"/>
<polygon fill="#000000" stroke="#000000" points="1509.5166,-1137.8031 1518.6375,-1132.4124 1508.1457,-1130.9386 1509.5166,-1137.8031"/>
<text text-anchor="middle" x="1363.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge43" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1352.5,-524.2779C1352.5,-512.2547 1352.5,-497.1545 1352.5,-482.9615"/>
<polygon fill="#000000" stroke="#000000" points="1356.0001,-482.844 1352.5,-472.844 1349.0001,-482.844 1356.0001,-482.844"/>
<text text-anchor="middle" x="1401" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge8" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1432.065,-403.3975C1473.53,-385.3646 1525.7973,-362.6337 1575.2668,-341.1196"/>
<polygon fill="#000000" stroke="#000000" points="1576.6936,-344.3159 1584.4681,-337.118 1573.9019,-337.8966 1576.6936,-344.3159"/>
<text text-anchor="middle" x="1540" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge16" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M337.0654,-1796.361C444.4086,-1605.2364 624.3034,-1343.6495 861.5,-1209 916.4943,-1177.7813 1301.1515,-1140.5857 1508.5955,-1122.4858"/>
<polygon fill="#000000" stroke="#000000" points="1508.9836,-1125.9654 1518.6428,-1121.612 1508.3771,-1118.9917 1508.9836,-1125.9654"/>
<text text-anchor="middle" x="616.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge34" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M447.0955,-2065.8333C458.3572,-2056.0642 465,-2042.9531 465,-2026.5 465,-2013.9031 461.1061,-2003.2652 454.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="456.5485,-1991.9513 447.0955,-1987.1667 451.5016,-1996.802 456.5485,-1991.9513"/>
<text text-anchor="middle" x="481" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge27" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M403.5727,-1796.3055C434.684,-1768.8507 468.9097,-1744.4303 505.5,-1727 554.5848,-1703.6178 695.5426,-1715.6819 749.5,-1709 991.9206,-1678.9794 1273.371,-1625.1978 1424.6897,-1594.7132"/>
<polygon fill="#000000" stroke="#000000" points="1425.8025,-1598.0592 1434.9121,-1592.6493 1424.4172,-1591.1976 1425.8025,-1598.0592"/>
<text text-anchor="middle" x="885.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cycle -->
<g id="node21" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1724.5,-1278.5C1724.5,-1278.5 1952.5,-1278.5 1952.5,-1278.5 1958.5,-1278.5 1964.5,-1284.5 1964.5,-1290.5 1964.5,-1290.5 1964.5,-1335.5 1964.5,-1335.5 1964.5,-1341.5 1958.5,-1347.5 1952.5,-1347.5 1952.5,-1347.5 1724.5,-1347.5 1724.5,-1347.5 1718.5,-1347.5 1712.5,-1341.5 1712.5,-1335.5 1712.5,-1335.5 1712.5,-1290.5 1712.5,-1290.5 1712.5,-1284.5 1718.5,-1278.5 1724.5,-1278.5"/>
<text text-anchor="middle" x="1739.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1766.5,-1278.5 1766.5,-1347.5 "/>
<text text-anchor="middle" x="1777" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1787.5,-1278.5 1787.5,-1347.5 "/>
<text text-anchor="middle" x="1865.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1787.5,-1324.5 1943.5,-1324.5 "/>
<text text-anchor="middle" x="1865.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1787.5,-1301.5 1943.5,-1301.5 "/>
<text text-anchor="middle" x="1865.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1943.5,-1278.5 1943.5,-1347.5 "/>
<text text-anchor="middle" x="1954" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge18" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1804.4626,-1278.3609C1773.9076,-1247.2659 1728.5714,-1201.1282 1693.3108,-1165.2444"/>
<polygon fill="#000000" stroke="#000000" points="1695.4538,-1162.4315 1685.9485,-1157.7519 1690.4609,-1167.3377 1695.4538,-1162.4315"/>
<text text-anchor="middle" x="1743.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node22" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3271,-403.5C3271,-403.5 3588,-403.5 3588,-403.5 3594,-403.5 3600,-409.5 3600,-415.5 3600,-415.5 3600,-460.5 3600,-460.5 3600,-466.5 3594,-472.5 3588,-472.5 3588,-472.5 3271,-472.5 3271,-472.5 3265,-472.5 3259,-466.5 3259,-460.5 3259,-460.5 3259,-415.5 3259,-415.5 3259,-409.5 3265,-403.5 3271,-403.5"/>
<text text-anchor="middle" x="3304" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3349,-403.5 3349,-472.5 "/>
<text text-anchor="middle" x="3359.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3370,-403.5 3370,-472.5 "/>
<text text-anchor="middle" x="3474.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3370,-449.5 3579,-449.5 "/>
<text text-anchor="middle" x="3474.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3370,-426.5 3579,-426.5 "/>
<text text-anchor="middle" x="3474.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3579,-403.5 3579,-472.5 "/>
<text text-anchor="middle" x="3589.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge2" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3350.8421,-403.4246C3318.5139,-390.7183 3280.3184,-377.5931 3244.5,-370 2991.4986,-316.3663 2233.8484,-286.627 1898.85,-275.7875"/>
<polygon fill="#000000" stroke="#000000" points="1898.6827,-272.2804 1888.5752,-275.4567 1898.4574,-279.2768 1898.6827,-272.2804"/>
<text text-anchor="middle" x="3327" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- follow_up -->
<g id="node23" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1260.5,-1209.5C1260.5,-1209.5 1592.5,-1209.5 1592.5,-1209.5 1598.5,-1209.5 1604.5,-1215.5 1604.5,-1221.5 1604.5,-1221.5 1604.5,-1404.5 1604.5,-1404.5 1604.5,-1410.5 1598.5,-1416.5 1592.5,-1416.5 1592.5,-1416.5 1260.5,-1416.5 1260.5,-1416.5 1254.5,-1416.5 1248.5,-1410.5 1248.5,-1404.5 1248.5,-1404.5 1248.5,-1221.5 1248.5,-1221.5 1248.5,-1215.5 1254.5,-1209.5 1260.5,-1209.5"/>
<text text-anchor="middle" x="1291" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1333.5,-1209.5 1333.5,-1416.5 "/>
<text text-anchor="middle" x="1344" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1354.5,-1209.5 1354.5,-1416.5 "/>
<text text-anchor="middle" x="1469" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1393.5 1583.5,-1393.5 "/>
<text text-anchor="middle" x="1469" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1370.5 1583.5,-1370.5 "/>
<text text-anchor="middle" x="1469" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1347.5 1583.5,-1347.5 "/>
<text text-anchor="middle" x="1469" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1324.5 1583.5,-1324.5 "/>
<text text-anchor="middle" x="1469" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1301.5 1583.5,-1301.5 "/>
<text text-anchor="middle" x="1469" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1278.5 1583.5,-1278.5 "/>
<text text-anchor="middle" x="1469" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1255.5 1583.5,-1255.5 "/>
<text text-anchor="middle" x="1469" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1354.5,-1232.5 1583.5,-1232.5 "/>
<text text-anchor="middle" x="1469" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1583.5,-1209.5 1583.5,-1416.5 "/>
<text text-anchor="middle" x="1594" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge19" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1536.6344,-1209.2987C1553.0299,-1193.8608 1569.3273,-1178.5154 1583.9848,-1164.7141"/>
<polygon fill="#000000" stroke="#000000" points="1586.611,-1167.0487 1591.4921,-1157.6452 1581.8123,-1161.9523 1586.611,-1167.0487"/>
<text text-anchor="middle" x="1598.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node24" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2587,-2750.5C2587,-2750.5 2772,-2750.5 2772,-2750.5 2778,-2750.5 2784,-2756.5 2784,-2762.5 2784,-2762.5 2784,-2945.5 2784,-2945.5 2784,-2951.5 2778,-2957.5 2772,-2957.5 2772,-2957.5 2587,-2957.5 2587,-2957.5 2581,-2957.5 2575,-2951.5 2575,-2945.5 2575,-2945.5 2575,-2762.5 2575,-2762.5 2575,-2756.5 2581,-2750.5 2587,-2750.5"/>
<text text-anchor="middle" x="2594.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2614,-2750.5 2614,-2957.5 "/>
<text text-anchor="middle" x="2624.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2635,-2750.5 2635,-2957.5 "/>
<text text-anchor="middle" x="2699" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2635,-2934.5 2763,-2934.5 "/>
<text text-anchor="middle" x="2699" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2635,-2911.5 2763,-2911.5 "/>
<text text-anchor="middle" x="2699" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2635,-2888.5 2763,-2888.5 "/>
<text text-anchor="middle" x="2699" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2635,-2865.5 2763,-2865.5 "/>
<text text-anchor="middle" x="2699" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2635,-2842.5 2763,-2842.5 "/>
<text text-anchor="middle" x="2699" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2635,-2819.5 2763,-2819.5 "/>
<text text-anchor="middle" x="2699" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2635,-2796.5 2763,-2796.5 "/>
<text text-anchor="middle" x="2699" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2635,-2773.5 2763,-2773.5 "/>
<text text-anchor="middle" x="2699" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2763,-2750.5 2763,-2957.5 "/>
<text text-anchor="middle" x="2773.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge31" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2758.9603,-2750.3561C2782.5492,-2719.588 2808.9393,-2685.1661 2834.5354,-2651.7799"/>
<polygon fill="#000000" stroke="#000000" points="2837.3676,-2653.8383 2840.6743,-2643.7727 2831.8123,-2649.5792 2837.3676,-2653.8383"/>
<text text-anchor="middle" x="2837" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge1" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2784.1111,-2842.6498C2943.9155,-2822.3646 3230.5,-2773.0802 3230.5,-2680.5 3230.5,-2680.5 3230.5,-2680.5 3230.5,-438 3230.5,-371.5877 2285.7911,-305.1969 1898.8291,-280.7882"/>
<polygon fill="#000000" stroke="#000000" points="1898.8683,-277.2839 1888.6682,-280.1489 1898.4286,-284.27 1898.8683,-277.2839"/>
<text text-anchor="middle" x="3261" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge5" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2574.8535,-2838.1431C2330.3859,-2801.0993 1730.5691,-2710.21 1572.9526,-2686.3267"/>
<polygon fill="#000000" stroke="#000000" points="1573.2095,-2682.8257 1562.798,-2684.7879 1572.1607,-2689.7467 1573.2095,-2682.8257"/>
<text text-anchor="middle" x="1904" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge21" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2574.872,-2796.6768C2362.7343,-2683.968 1863.5027,-2436.4498 1409.5,-2344 1360.278,-2333.9768 551.4135,-2346.377 505.5,-2326 470.7445,-2310.5751 438.248,-2288.6115 408.574,-2263.4962"/>
<polygon fill="#000000" stroke="#000000" points="410.5444,-2260.5735 400.6869,-2256.6901 405.9712,-2265.8731 410.5444,-2260.5735"/>
<text text-anchor="middle" x="2413" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge14" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2242.5831,-1468.4563C2179.9838,-1386.8401 2082.7476,-1275.9809 1973.5,-1209 1912.3179,-1171.4886 1835.9631,-1147.775 1771.8076,-1133.141"/>
<polygon fill="#000000" stroke="#000000" points="1772.5498,-1129.7206 1762.0275,-1130.9584 1771.0251,-1136.5525 1772.5498,-1129.7206"/>
<text text-anchor="middle" x="2225.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node27" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2624.5,-1727.5C2624.5,-1727.5 3080.5,-1727.5 3080.5,-1727.5 3086.5,-1727.5 3092.5,-1733.5 3092.5,-1739.5 3092.5,-1739.5 3092.5,-2313.5 3092.5,-2313.5 3092.5,-2319.5 3086.5,-2325.5 3080.5,-2325.5 3080.5,-2325.5 2624.5,-2325.5 2624.5,-2325.5 2618.5,-2325.5 2612.5,-2319.5 2612.5,-2313.5 2612.5,-2313.5 2612.5,-1739.5 2612.5,-1739.5 2612.5,-1733.5 2618.5,-1727.5 2624.5,-1727.5"/>
<text text-anchor="middle" x="2670" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2727.5,-1727.5 2727.5,-2325.5 "/>
<text text-anchor="middle" x="2738" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2748.5,-1727.5 2748.5,-2325.5 "/>
<text text-anchor="middle" x="2910" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2302.5 3071.5,-2302.5 "/>
<text text-anchor="middle" x="2910" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2279.5 3071.5,-2279.5 "/>
<text text-anchor="middle" x="2910" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2256.5 3071.5,-2256.5 "/>
<text text-anchor="middle" x="2910" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2233.5 3071.5,-2233.5 "/>
<text text-anchor="middle" x="2910" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2210.5 3071.5,-2210.5 "/>
<text text-anchor="middle" x="2910" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2187.5 3071.5,-2187.5 "/>
<text text-anchor="middle" x="2910" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2164.5 3071.5,-2164.5 "/>
<text text-anchor="middle" x="2910" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2141.5 3071.5,-2141.5 "/>
<text text-anchor="middle" x="2910" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2118.5 3071.5,-2118.5 "/>
<text text-anchor="middle" x="2910" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2095.5 3071.5,-2095.5 "/>
<text text-anchor="middle" x="2910" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2072.5 3071.5,-2072.5 "/>
<text text-anchor="middle" x="2910" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2049.5 3071.5,-2049.5 "/>
<text text-anchor="middle" x="2910" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2026.5 3071.5,-2026.5 "/>
<text text-anchor="middle" x="2910" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2748.5,-2003.5 3071.5,-2003.5 "/>
<text text-anchor="middle" x="2910" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1980.5 3071.5,-1980.5 "/>
<text text-anchor="middle" x="2910" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1957.5 3071.5,-1957.5 "/>
<text text-anchor="middle" x="2910" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1934.5 3071.5,-1934.5 "/>
<text text-anchor="middle" x="2910" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1911.5 3071.5,-1911.5 "/>
<text text-anchor="middle" x="2910" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1888.5 3071.5,-1888.5 "/>
<text text-anchor="middle" x="2910" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1865.5 3071.5,-1865.5 "/>
<text text-anchor="middle" x="2910" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1842.5 3071.5,-1842.5 "/>
<text text-anchor="middle" x="2910" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1819.5 3071.5,-1819.5 "/>
<text text-anchor="middle" x="2910" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1796.5 3071.5,-1796.5 "/>
<text text-anchor="middle" x="2910" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1773.5 3071.5,-1773.5 "/>
<text text-anchor="middle" x="2910" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748.5,-1750.5 3071.5,-1750.5 "/>
<text text-anchor="middle" x="2910" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="3071.5,-1727.5 3071.5,-2325.5 "/>
<text text-anchor="middle" x="3082" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge41" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2612.4998,-1734.5025C2609.5102,-1731.9632 2606.5099,-1729.4613 2603.5,-1727 2575.4757,-1704.0831 2543.5471,-1682.9672 2511.3972,-1664.1766"/>
<polygon fill="#000000" stroke="#000000" points="2512.7366,-1660.9085 2502.3265,-1658.9388 2509.2362,-1666.9704 2512.7366,-1660.9085"/>
<text text-anchor="middle" x="2625.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge35" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3092.7384,-2064.6912C3103.9387,-2055.0507 3110.5,-2042.3203 3110.5,-2026.5 3110.5,-2014.3876 3106.6539,-2004.0864 3099.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3102.219,-1993.0385 3092.7384,-1988.3088 3097.2002,-1997.9183 3102.219,-1993.0385"/>
<text text-anchor="middle" x="3126.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge15" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1549.9645,-1548.7584C1568.6032,-1519.4291 1599.1973,-1466.785 1613.5,-1417 1637.752,-1332.5833 1641.9603,-1230.1118 1641.8862,-1167.9034"/>
<polygon fill="#000000" stroke="#000000" points="1645.3843,-1167.5044 1641.8334,-1157.5224 1638.3844,-1167.5401 1645.3843,-1167.5044"/>
<text text-anchor="middle" x="1668.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge20" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1561.7455,-1548.7875C1613.2816,-1504.8802 1725.6487,-1409.1463 1790.2338,-1354.1215"/>
<polygon fill="#000000" stroke="#000000" points="1792.5237,-1356.7687 1797.8659,-1347.6192 1787.984,-1351.4403 1792.5237,-1356.7687"/>
<text text-anchor="middle" x="1716" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge36" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1592.5376,-1595.0098C1623.6529,-1598.9199 1652,-1591.25 1652,-1572 1652,-1554.8555 1629.5147,-1546.8964 1602.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1602.2006,-1544.6454 1592.5376,-1548.9902 1602.801,-1551.6196 1602.2006,-1544.6454"/>
<text text-anchor="middle" x="1668" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
</g>
</svg>
</div>
