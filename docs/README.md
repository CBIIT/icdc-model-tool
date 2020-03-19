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
<svg width="3974pt" height="2966pt"
 viewBox="0.00 0.00 3974.00 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3970,-2962 3970,4 -4,4"/>
<!-- physical_exam -->
<g id="node1" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1828.5,-1934.5C1828.5,-1934.5 2144.5,-1934.5 2144.5,-1934.5 2150.5,-1934.5 2156.5,-1940.5 2156.5,-1946.5 2156.5,-1946.5 2156.5,-2106.5 2156.5,-2106.5 2156.5,-2112.5 2150.5,-2118.5 2144.5,-2118.5 2144.5,-2118.5 1828.5,-2118.5 1828.5,-2118.5 1822.5,-2118.5 1816.5,-2112.5 1816.5,-2106.5 1816.5,-2106.5 1816.5,-1946.5 1816.5,-1946.5 1816.5,-1940.5 1822.5,-1934.5 1828.5,-1934.5"/>
<text text-anchor="middle" x="1877.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1938.5,-1934.5 1938.5,-2118.5 "/>
<text text-anchor="middle" x="1949" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1959.5,-1934.5 1959.5,-2118.5 "/>
<text text-anchor="middle" x="2047.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2095.5 2135.5,-2095.5 "/>
<text text-anchor="middle" x="2047.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2072.5 2135.5,-2072.5 "/>
<text text-anchor="middle" x="2047.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2049.5 2135.5,-2049.5 "/>
<text text-anchor="middle" x="2047.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2026.5 2135.5,-2026.5 "/>
<text text-anchor="middle" x="2047.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1959.5,-2003.5 2135.5,-2003.5 "/>
<text text-anchor="middle" x="2047.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1980.5 2135.5,-1980.5 "/>
<text text-anchor="middle" x="2047.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1959.5,-1957.5 2135.5,-1957.5 "/>
<text text-anchor="middle" x="2047.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="2135.5,-1934.5 2135.5,-2118.5 "/>
<text text-anchor="middle" x="2146" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment -->
<g id="node21" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2003,-1468.5C2003,-1468.5 2352,-1468.5 2352,-1468.5 2358,-1468.5 2364,-1474.5 2364,-1480.5 2364,-1480.5 2364,-1663.5 2364,-1663.5 2364,-1669.5 2358,-1675.5 2352,-1675.5 2352,-1675.5 2003,-1675.5 2003,-1675.5 1997,-1675.5 1991,-1669.5 1991,-1663.5 1991,-1663.5 1991,-1480.5 1991,-1480.5 1991,-1474.5 1997,-1468.5 2003,-1468.5"/>
<text text-anchor="middle" x="2038.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2086,-1468.5 2086,-1675.5 "/>
<text text-anchor="middle" x="2096.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2107,-1468.5 2107,-1675.5 "/>
<text text-anchor="middle" x="2225" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2107,-1652.5 2343,-1652.5 "/>
<text text-anchor="middle" x="2225" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2107,-1629.5 2343,-1629.5 "/>
<text text-anchor="middle" x="2225" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2107,-1606.5 2343,-1606.5 "/>
<text text-anchor="middle" x="2225" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2107,-1583.5 2343,-1583.5 "/>
<text text-anchor="middle" x="2225" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2107,-1560.5 2343,-1560.5 "/>
<text text-anchor="middle" x="2225" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2107,-1537.5 2343,-1537.5 "/>
<text text-anchor="middle" x="2225" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2107,-1514.5 2343,-1514.5 "/>
<text text-anchor="middle" x="2225" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2107,-1491.5 2343,-1491.5 "/>
<text text-anchor="middle" x="2225" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2343,-1468.5 2343,-1675.5 "/>
<text text-anchor="middle" x="2353.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge4" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2025.2668,-1934.2514C2055.5482,-1862.1941 2097.7675,-1761.73 2130.0654,-1684.8744"/>
<polygon fill="#000000" stroke="#000000" points="2133.3059,-1686.1973 2133.9536,-1675.6223 2126.8526,-1683.4853 2133.3059,-1686.1973"/>
<text text-anchor="middle" x="2171.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- visit -->
<g id="node22" class="node">
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
<!-- physical_exam&#45;&gt;visit -->
<g id="edge40" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1946.5376,-1934.3072C1915.3854,-1870.362 1867.2475,-1786.3543 1806.5,-1727 1747.1812,-1669.0416 1661.9429,-1625.1082 1602.7574,-1599.0715"/>
<polygon fill="#000000" stroke="#000000" points="1604.0567,-1595.82 1593.4901,-1595.047 1601.2683,-1602.2407 1604.0567,-1595.82"/>
<text text-anchor="middle" x="1809.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node2" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M3018.5,-.5C3018.5,-.5 3326.5,-.5 3326.5,-.5 3332.5,-.5 3338.5,-6.5 3338.5,-12.5 3338.5,-12.5 3338.5,-126.5 3338.5,-126.5 3338.5,-132.5 3332.5,-138.5 3326.5,-138.5 3326.5,-138.5 3018.5,-138.5 3018.5,-138.5 3012.5,-138.5 3006.5,-132.5 3006.5,-126.5 3006.5,-126.5 3006.5,-12.5 3006.5,-12.5 3006.5,-6.5 3012.5,-.5 3018.5,-.5"/>
<text text-anchor="middle" x="3045.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="3084.5,-.5 3084.5,-138.5 "/>
<text text-anchor="middle" x="3095" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3105.5,-.5 3105.5,-138.5 "/>
<text text-anchor="middle" x="3211.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="3105.5,-115.5 3317.5,-115.5 "/>
<text text-anchor="middle" x="3211.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="3105.5,-92.5 3317.5,-92.5 "/>
<text text-anchor="middle" x="3211.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3105.5,-69.5 3317.5,-69.5 "/>
<text text-anchor="middle" x="3211.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="3105.5,-46.5 3317.5,-46.5 "/>
<text text-anchor="middle" x="3211.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="3105.5,-23.5 3317.5,-23.5 "/>
<text text-anchor="middle" x="3211.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="3317.5,-.5 3317.5,-138.5 "/>
<text text-anchor="middle" x="3328" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle -->
<g id="node3" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1618.5,-1278.5C1618.5,-1278.5 1846.5,-1278.5 1846.5,-1278.5 1852.5,-1278.5 1858.5,-1284.5 1858.5,-1290.5 1858.5,-1290.5 1858.5,-1335.5 1858.5,-1335.5 1858.5,-1341.5 1852.5,-1347.5 1846.5,-1347.5 1846.5,-1347.5 1618.5,-1347.5 1618.5,-1347.5 1612.5,-1347.5 1606.5,-1341.5 1606.5,-1335.5 1606.5,-1335.5 1606.5,-1290.5 1606.5,-1290.5 1606.5,-1284.5 1612.5,-1278.5 1618.5,-1278.5"/>
<text text-anchor="middle" x="1633.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1660.5,-1278.5 1660.5,-1347.5 "/>
<text text-anchor="middle" x="1671" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1681.5,-1278.5 1681.5,-1347.5 "/>
<text text-anchor="middle" x="1759.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1681.5,-1324.5 1837.5,-1324.5 "/>
<text text-anchor="middle" x="1759.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1681.5,-1301.5 1837.5,-1301.5 "/>
<text text-anchor="middle" x="1759.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1837.5,-1278.5 1837.5,-1347.5 "/>
<text text-anchor="middle" x="1848" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node9" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M2187,-1065.5C2187,-1065.5 2406,-1065.5 2406,-1065.5 2412,-1065.5 2418,-1071.5 2418,-1077.5 2418,-1077.5 2418,-1145.5 2418,-1145.5 2418,-1151.5 2412,-1157.5 2406,-1157.5 2406,-1157.5 2187,-1157.5 2187,-1157.5 2181,-1157.5 2175,-1151.5 2175,-1145.5 2175,-1145.5 2175,-1077.5 2175,-1077.5 2175,-1071.5 2181,-1065.5 2187,-1065.5"/>
<text text-anchor="middle" x="2199.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="2224,-1065.5 2224,-1157.5 "/>
<text text-anchor="middle" x="2234.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2245,-1065.5 2245,-1157.5 "/>
<text text-anchor="middle" x="2321" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2245,-1134.5 2397,-1134.5 "/>
<text text-anchor="middle" x="2321" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2245,-1111.5 2397,-1111.5 "/>
<text text-anchor="middle" x="2321" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2245,-1088.5 2397,-1088.5 "/>
<text text-anchor="middle" x="2321" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2397,-1065.5 2397,-1157.5 "/>
<text text-anchor="middle" x="2407.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge14" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1762.8661,-1278.2094C1792.9241,-1246.1948 1841.9483,-1200.1354 1894.5,-1176 1941.5415,-1154.3952 2066.3494,-1136.3984 2164.5369,-1124.9534"/>
<polygon fill="#000000" stroke="#000000" points="2165.0219,-1128.4208 2174.5548,-1123.7975 2164.2195,-1121.4669 2165.0219,-1128.4208"/>
<text text-anchor="middle" x="1921.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node4" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M523,-1750.5C523,-1750.5 946,-1750.5 946,-1750.5 952,-1750.5 958,-1756.5 958,-1762.5 958,-1762.5 958,-2290.5 958,-2290.5 958,-2296.5 952,-2302.5 946,-2302.5 946,-2302.5 523,-2302.5 523,-2302.5 517,-2302.5 511,-2296.5 511,-2290.5 511,-2290.5 511,-1762.5 511,-1762.5 511,-1756.5 517,-1750.5 523,-1750.5"/>
<text text-anchor="middle" x="545" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="579,-1750.5 579,-2302.5 "/>
<text text-anchor="middle" x="589.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="600,-1750.5 600,-2302.5 "/>
<text text-anchor="middle" x="768.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_preservation</text>
<polyline fill="none" stroke="#000000" points="600,-2279.5 937,-2279.5 "/>
<text text-anchor="middle" x="768.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="600,-2256.5 937,-2256.5 "/>
<text text-anchor="middle" x="768.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="600,-2233.5 937,-2233.5 "/>
<text text-anchor="middle" x="768.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="600,-2210.5 937,-2210.5 "/>
<text text-anchor="middle" x="768.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="600,-2187.5 937,-2187.5 "/>
<text text-anchor="middle" x="768.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-2164.5 937,-2164.5 "/>
<text text-anchor="middle" x="768.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="600,-2141.5 937,-2141.5 "/>
<text text-anchor="middle" x="768.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_grade</text>
<polyline fill="none" stroke="#000000" points="600,-2118.5 937,-2118.5 "/>
<text text-anchor="middle" x="768.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-2095.5 937,-2095.5 "/>
<text text-anchor="middle" x="768.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_sample_origin</text>
<polyline fill="none" stroke="#000000" points="600,-2072.5 937,-2072.5 "/>
<text text-anchor="middle" x="768.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="600,-2049.5 937,-2049.5 "/>
<text text-anchor="middle" x="768.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="600,-2026.5 937,-2026.5 "/>
<text text-anchor="middle" x="768.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="600,-2003.5 937,-2003.5 "/>
<text text-anchor="middle" x="768.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="600,-1980.5 937,-1980.5 "/>
<text text-anchor="middle" x="768.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="600,-1957.5 937,-1957.5 "/>
<text text-anchor="middle" x="768.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="600,-1934.5 937,-1934.5 "/>
<text text-anchor="middle" x="768.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-1911.5 937,-1911.5 "/>
<text text-anchor="middle" x="768.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="600,-1888.5 937,-1888.5 "/>
<text text-anchor="middle" x="768.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="600,-1865.5 937,-1865.5 "/>
<text text-anchor="middle" x="768.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="600,-1842.5 937,-1842.5 "/>
<text text-anchor="middle" x="768.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="600,-1819.5 937,-1819.5 "/>
<text text-anchor="middle" x="768.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">summarized_sample_type</text>
<polyline fill="none" stroke="#000000" points="600,-1796.5 937,-1796.5 "/>
<text text-anchor="middle" x="768.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="600,-1773.5 937,-1773.5 "/>
<text text-anchor="middle" x="768.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="937,-1750.5 937,-2302.5 "/>
<text text-anchor="middle" x="947.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge35" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M958.0955,-2065.8333C969.3572,-2056.0642 976,-2042.9531 976,-2026.5 976,-2013.9031 972.1061,-2003.2652 965.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="967.5485,-1991.9513 958.0955,-1987.1667 962.5016,-1996.802 967.5485,-1991.9513"/>
<text text-anchor="middle" x="992" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge13" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M943.4895,-1750.147C1101.2477,-1563.6433 1334.9364,-1330.1954 1597.5,-1209 1695.7178,-1163.6642 1990.9857,-1134.4836 2164.7533,-1120.7405"/>
<polygon fill="#000000" stroke="#000000" points="2165.0378,-1124.229 2174.7334,-1119.9576 2164.4903,-1117.2504 2165.0378,-1124.229"/>
<text text-anchor="middle" x="1273.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge43" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M958.0005,-1769.5464C977.194,-1753.9914 997.1006,-1739.5772 1017.5,-1727 1145.1237,-1648.3139 1315.1783,-1607.4379 1424.7676,-1587.8465"/>
<polygon fill="#000000" stroke="#000000" points="1425.6086,-1591.2524 1434.8513,-1586.0734 1424.3963,-1584.3582 1425.6086,-1591.2524"/>
<text text-anchor="middle" x="1096.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- follow_up -->
<g id="node5" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2201.5,-1209.5C2201.5,-1209.5 2533.5,-1209.5 2533.5,-1209.5 2539.5,-1209.5 2545.5,-1215.5 2545.5,-1221.5 2545.5,-1221.5 2545.5,-1404.5 2545.5,-1404.5 2545.5,-1410.5 2539.5,-1416.5 2533.5,-1416.5 2533.5,-1416.5 2201.5,-1416.5 2201.5,-1416.5 2195.5,-1416.5 2189.5,-1410.5 2189.5,-1404.5 2189.5,-1404.5 2189.5,-1221.5 2189.5,-1221.5 2189.5,-1215.5 2195.5,-1209.5 2201.5,-1209.5"/>
<text text-anchor="middle" x="2232" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2274.5,-1209.5 2274.5,-1416.5 "/>
<text text-anchor="middle" x="2285" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2295.5,-1209.5 2295.5,-1416.5 "/>
<text text-anchor="middle" x="2410" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1393.5 2524.5,-1393.5 "/>
<text text-anchor="middle" x="2410" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1370.5 2524.5,-1370.5 "/>
<text text-anchor="middle" x="2410" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1347.5 2524.5,-1347.5 "/>
<text text-anchor="middle" x="2410" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1324.5 2524.5,-1324.5 "/>
<text text-anchor="middle" x="2410" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1301.5 2524.5,-1301.5 "/>
<text text-anchor="middle" x="2410" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1278.5 2524.5,-1278.5 "/>
<text text-anchor="middle" x="2410" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1255.5 2524.5,-1255.5 "/>
<text text-anchor="middle" x="2410" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2295.5,-1232.5 2524.5,-1232.5 "/>
<text text-anchor="middle" x="2410" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2524.5,-1209.5 2524.5,-1416.5 "/>
<text text-anchor="middle" x="2535" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge10" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2330.9601,-1209.2987C2325.8698,-1194.8523 2320.808,-1180.4868 2316.1939,-1167.3918"/>
<polygon fill="#000000" stroke="#000000" points="2319.3841,-1165.9137 2312.7596,-1157.6452 2312.7819,-1168.2401 2319.3841,-1165.9137"/>
<text text-anchor="middle" x="2350.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent_administration -->
<g id="node6" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1785C12,-1785 481,-1785 481,-1785 487,-1785 493,-1791 493,-1797 493,-1797 493,-2256 493,-2256 493,-2262 487,-2268 481,-2268 481,-2268 12,-2268 12,-2268 6,-2268 0,-2262 0,-2256 0,-2256 0,-1797 0,-1797 0,-1791 6,-1785 12,-1785"/>
<text text-anchor="middle" x="85" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1785 170,-2268 "/>
<text text-anchor="middle" x="180.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1785 191,-2268 "/>
<text text-anchor="middle" x="331.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-2245 472,-2245 "/>
<text text-anchor="middle" x="331.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2222 472,-2222 "/>
<text text-anchor="middle" x="331.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-2199 472,-2199 "/>
<text text-anchor="middle" x="331.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="191,-2176 472,-2176 "/>
<text text-anchor="middle" x="331.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2153 472,-2153 "/>
<text text-anchor="middle" x="331.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2130 472,-2130 "/>
<text text-anchor="middle" x="331.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="191,-2107 472,-2107 "/>
<text text-anchor="middle" x="331.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-2084 472,-2084 "/>
<text text-anchor="middle" x="331.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2061 472,-2061 "/>
<text text-anchor="middle" x="331.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2038 472,-2038 "/>
<text text-anchor="middle" x="331.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2015 472,-2015 "/>
<text text-anchor="middle" x="331.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-1992 472,-1992 "/>
<text text-anchor="middle" x="331.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="191,-1969 472,-1969 "/>
<text text-anchor="middle" x="331.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="191,-1946 472,-1946 "/>
<text text-anchor="middle" x="331.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-1923 472,-1923 "/>
<text text-anchor="middle" x="331.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-1900 472,-1900 "/>
<text text-anchor="middle" x="331.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="191,-1877 472,-1877 "/>
<text text-anchor="middle" x="331.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-1854 472,-1854 "/>
<text text-anchor="middle" x="331.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-1831 472,-1831 "/>
<text text-anchor="middle" x="331.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-1808 472,-1808 "/>
<text text-anchor="middle" x="331.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="472,-1785 472,-2268 "/>
<text text-anchor="middle" x="482.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent -->
<g id="node15" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M2260.5,-524.5C2260.5,-524.5 2486.5,-524.5 2486.5,-524.5 2492.5,-524.5 2498.5,-530.5 2498.5,-536.5 2498.5,-536.5 2498.5,-558.5 2498.5,-558.5 2498.5,-564.5 2492.5,-570.5 2486.5,-570.5 2486.5,-570.5 2260.5,-570.5 2260.5,-570.5 2254.5,-570.5 2248.5,-564.5 2248.5,-558.5 2248.5,-558.5 2248.5,-536.5 2248.5,-536.5 2248.5,-530.5 2254.5,-524.5 2260.5,-524.5"/>
<text text-anchor="middle" x="2277" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="2305.5,-524.5 2305.5,-570.5 "/>
<text text-anchor="middle" x="2316" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2326.5,-524.5 2326.5,-570.5 "/>
<text text-anchor="middle" x="2402" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2326.5,-547.5 2477.5,-547.5 "/>
<text text-anchor="middle" x="2402" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2477.5,-524.5 2477.5,-570.5 "/>
<text text-anchor="middle" x="2488" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge25" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M280.082,-1784.8928C287.1414,-1716.2355 292.5,-1641.2966 292.5,-1572 292.5,-1572 292.5,-1572 292.5,-818 292.5,-621.0672 1776.974,-563.8324 2238.3533,-550.7995"/>
<polygon fill="#000000" stroke="#000000" points="2238.4996,-554.2969 2248.3977,-550.5182 2238.3036,-547.2997 2238.4996,-554.2969"/>
<text text-anchor="middle" x="323.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge38" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M422.7717,-1784.7526C447.0953,-1762.5514 473.4444,-1742.5905 501.5,-1727 658.6711,-1639.6601 1192.1802,-1594.6253 1424.6838,-1578.7617"/>
<polygon fill="#000000" stroke="#000000" points="1425.1106,-1582.2409 1434.8514,-1578.0735 1424.6378,-1575.2569 1425.1106,-1582.2409"/>
<text text-anchor="middle" x="608.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- image -->
<g id="node7" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1163.5,-2836C1163.5,-2836 1199.5,-2836 1199.5,-2836 1205.5,-2836 1211.5,-2842 1211.5,-2848 1211.5,-2848 1211.5,-2860 1211.5,-2860 1211.5,-2866 1205.5,-2872 1199.5,-2872 1199.5,-2872 1163.5,-2872 1163.5,-2872 1157.5,-2872 1151.5,-2866 1151.5,-2860 1151.5,-2860 1151.5,-2848 1151.5,-2848 1151.5,-2842 1157.5,-2836 1163.5,-2836"/>
<text text-anchor="middle" x="1181.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node28" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1360.5,-2662.5C1360.5,-2662.5 1392.5,-2662.5 1392.5,-2662.5 1398.5,-2662.5 1404.5,-2668.5 1404.5,-2674.5 1404.5,-2674.5 1404.5,-2686.5 1404.5,-2686.5 1404.5,-2692.5 1398.5,-2698.5 1392.5,-2698.5 1392.5,-2698.5 1360.5,-2698.5 1360.5,-2698.5 1354.5,-2698.5 1348.5,-2692.5 1348.5,-2686.5 1348.5,-2686.5 1348.5,-2674.5 1348.5,-2674.5 1348.5,-2668.5 1354.5,-2662.5 1360.5,-2662.5"/>
<text text-anchor="middle" x="1376.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge15" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1201.9999,-2835.7604C1237.1105,-2804.5209 1308.7968,-2740.7384 1348.4904,-2705.4214"/>
<polygon fill="#000000" stroke="#000000" points="1350.8378,-2708.0176 1355.9822,-2698.7556 1346.1847,-2702.788 1350.8378,-2708.0176"/>
<text text-anchor="middle" x="1365" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- off_study -->
<g id="node8" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2663,-714.5C2663,-714.5 3078,-714.5 3078,-714.5 3084,-714.5 3090,-720.5 3090,-726.5 3090,-726.5 3090,-909.5 3090,-909.5 3090,-915.5 3084,-921.5 3078,-921.5 3078,-921.5 2663,-921.5 2663,-921.5 2657,-921.5 2651,-915.5 2651,-909.5 2651,-909.5 2651,-726.5 2651,-726.5 2651,-720.5 2657,-714.5 2663,-714.5"/>
<text text-anchor="middle" x="2692.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2734,-714.5 2734,-921.5 "/>
<text text-anchor="middle" x="2744.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2755,-714.5 2755,-921.5 "/>
<text text-anchor="middle" x="2912" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2755,-898.5 3069,-898.5 "/>
<text text-anchor="middle" x="2912" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2755,-875.5 3069,-875.5 "/>
<text text-anchor="middle" x="2912" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2755,-852.5 3069,-852.5 "/>
<text text-anchor="middle" x="2912" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2755,-829.5 3069,-829.5 "/>
<text text-anchor="middle" x="2912" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2755,-806.5 3069,-806.5 "/>
<text text-anchor="middle" x="2912" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2755,-783.5 3069,-783.5 "/>
<text text-anchor="middle" x="2912" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2755,-760.5 3069,-760.5 "/>
<text text-anchor="middle" x="2912" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2755,-737.5 3069,-737.5 "/>
<text text-anchor="middle" x="2912" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="3069,-714.5 3069,-921.5 "/>
<text text-anchor="middle" x="3079.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge32" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2418.3223,-1090.7198C2486.9562,-1075.7554 2572.6555,-1051.467 2642.5,-1014 2684.7998,-991.3089 2726.1302,-959.6289 2761.7295,-928.3457"/>
<polygon fill="#000000" stroke="#000000" points="2764.0832,-930.9364 2769.2373,-921.6797 2759.4356,-925.7019 2764.0832,-930.9364"/>
<text text-anchor="middle" x="2653" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- adverse_event -->
<g id="node13" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M2176,-622.5C2176,-622.5 2571,-622.5 2571,-622.5 2577,-622.5 2583,-628.5 2583,-634.5 2583,-634.5 2583,-1001.5 2583,-1001.5 2583,-1007.5 2577,-1013.5 2571,-1013.5 2571,-1013.5 2176,-1013.5 2176,-1013.5 2170,-1013.5 2164,-1007.5 2164,-1001.5 2164,-1001.5 2164,-634.5 2164,-634.5 2164,-628.5 2170,-622.5 2176,-622.5"/>
<text text-anchor="middle" x="2224" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="2284,-622.5 2284,-1013.5 "/>
<text text-anchor="middle" x="2294.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2305,-622.5 2305,-1013.5 "/>
<text text-anchor="middle" x="2433.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2305,-990.5 2562,-990.5 "/>
<text text-anchor="middle" x="2433.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2305,-967.5 2562,-967.5 "/>
<text text-anchor="middle" x="2433.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="2305,-944.5 2562,-944.5 "/>
<text text-anchor="middle" x="2433.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2305,-921.5 2562,-921.5 "/>
<text text-anchor="middle" x="2433.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="2305,-898.5 2562,-898.5 "/>
<text text-anchor="middle" x="2433.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="2305,-875.5 2562,-875.5 "/>
<text text-anchor="middle" x="2433.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2305,-852.5 2562,-852.5 "/>
<text text-anchor="middle" x="2433.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="2305,-829.5 2562,-829.5 "/>
<text text-anchor="middle" x="2433.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2305,-806.5 2562,-806.5 "/>
<text text-anchor="middle" x="2433.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="2305,-783.5 2562,-783.5 "/>
<text text-anchor="middle" x="2433.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2305,-760.5 2562,-760.5 "/>
<text text-anchor="middle" x="2433.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2305,-737.5 2562,-737.5 "/>
<text text-anchor="middle" x="2433.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="2305,-714.5 2562,-714.5 "/>
<text text-anchor="middle" x="2433.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="2305,-691.5 2562,-691.5 "/>
<text text-anchor="middle" x="2433.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="2305,-668.5 2562,-668.5 "/>
<text text-anchor="middle" x="2433.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="2305,-645.5 2562,-645.5 "/>
<text text-anchor="middle" x="2433.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2562,-622.5 2562,-1013.5 "/>
<text text-anchor="middle" x="2572.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge27" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2341.2216,-1065.4575C2345.2386,-1059.5721 2348.8007,-1053.3682 2351.5,-1047 2354.7137,-1039.4185 2357.5524,-1031.5728 2360.0557,-1023.5548"/>
<polygon fill="#000000" stroke="#000000" points="2363.4915,-1024.2759 2362.9455,-1013.6951 2356.7741,-1022.307 2363.4915,-1024.2759"/>
<text text-anchor="middle" x="2424.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- study -->
<g id="node18" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M3032.5,-190.5C3032.5,-190.5 3312.5,-190.5 3312.5,-190.5 3318.5,-190.5 3324.5,-196.5 3324.5,-202.5 3324.5,-202.5 3324.5,-339.5 3324.5,-339.5 3324.5,-345.5 3318.5,-351.5 3312.5,-351.5 3312.5,-351.5 3032.5,-351.5 3032.5,-351.5 3026.5,-351.5 3020.5,-345.5 3020.5,-339.5 3020.5,-339.5 3020.5,-202.5 3020.5,-202.5 3020.5,-196.5 3026.5,-190.5 3032.5,-190.5"/>
<text text-anchor="middle" x="3048.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="3076.5,-190.5 3076.5,-351.5 "/>
<text text-anchor="middle" x="3087" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3097.5,-190.5 3097.5,-351.5 "/>
<text text-anchor="middle" x="3200.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="3097.5,-328.5 3303.5,-328.5 "/>
<text text-anchor="middle" x="3200.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="3097.5,-305.5 3303.5,-305.5 "/>
<text text-anchor="middle" x="3200.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3097.5,-282.5 3303.5,-282.5 "/>
<text text-anchor="middle" x="3200.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3097.5,-259.5 3303.5,-259.5 "/>
<text text-anchor="middle" x="3200.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="3097.5,-236.5 3303.5,-236.5 "/>
<text text-anchor="middle" x="3200.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="3097.5,-213.5 3303.5,-213.5 "/>
<text text-anchor="middle" x="3200.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="3303.5,-190.5 3303.5,-351.5 "/>
<text text-anchor="middle" x="3314" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge17" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2418.1282,-1105.0174C2630.9366,-1092.4815 3052.7831,-1061.8609 3099.5,-1014 3160.6325,-951.3704 3118.5,-905.5195 3118.5,-818 3118.5,-818 3118.5,-818 3118.5,-438 3118.5,-412.4447 3124.2956,-385.7102 3132.0894,-361.3118"/>
<polygon fill="#000000" stroke="#000000" points="3135.4423,-362.3211 3135.2899,-351.7273 3128.8027,-360.1039 3135.4423,-362.3211"/>
<text text-anchor="middle" x="3159" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node19" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1687,-726C1687,-726 2134,-726 2134,-726 2140,-726 2146,-732 2146,-738 2146,-738 2146,-898 2146,-898 2146,-904 2140,-910 2134,-910 2134,-910 1687,-910 1687,-910 1681,-910 1675,-904 1675,-898 1675,-898 1675,-738 1675,-738 1675,-732 1681,-726 1687,-726"/>
<text text-anchor="middle" x="1732.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1790,-726 1790,-910 "/>
<text text-anchor="middle" x="1800.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1811,-726 1811,-910 "/>
<text text-anchor="middle" x="1968" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1811,-887 2125,-887 "/>
<text text-anchor="middle" x="1968" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1811,-864 2125,-864 "/>
<text text-anchor="middle" x="1968" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1811,-841 2125,-841 "/>
<text text-anchor="middle" x="1968" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1811,-818 2125,-818 "/>
<text text-anchor="middle" x="1968" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1811,-795 2125,-795 "/>
<text text-anchor="middle" x="1968" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1811,-772 2125,-772 "/>
<text text-anchor="middle" x="1968" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1811,-749 2125,-749 "/>
<text text-anchor="middle" x="1968" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2125,-726 2125,-910 "/>
<text text-anchor="middle" x="2135.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge6" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2180.8627,-1065.4676C2169.9814,-1059.7489 2159.3503,-1053.5776 2149.5,-1047 2094.9497,-1010.5736 2041.5297,-961.1035 1999.0772,-917.4634"/>
<polygon fill="#000000" stroke="#000000" points="2001.5564,-914.9922 1992.0909,-910.2325 1996.5223,-919.8561 2001.5564,-914.9922"/>
<text text-anchor="middle" x="2220.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- cohort -->
<g id="node23" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2562,-524.5C2562,-524.5 2795,-524.5 2795,-524.5 2801,-524.5 2807,-530.5 2807,-536.5 2807,-536.5 2807,-558.5 2807,-558.5 2807,-564.5 2801,-570.5 2795,-570.5 2795,-570.5 2562,-570.5 2562,-570.5 2556,-570.5 2550,-564.5 2550,-558.5 2550,-558.5 2550,-536.5 2550,-536.5 2550,-530.5 2556,-524.5 2562,-524.5"/>
<text text-anchor="middle" x="2581.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2613,-524.5 2613,-570.5 "/>
<text text-anchor="middle" x="2623.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2634,-524.5 2634,-570.5 "/>
<text text-anchor="middle" x="2710" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2634,-547.5 2786,-547.5 "/>
<text text-anchor="middle" x="2710" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2786,-524.5 2786,-570.5 "/>
<text text-anchor="middle" x="2796.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge18" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2174.8523,-1103.4513C1981.6992,-1089.4202 1622.6646,-1057.747 1584.5,-1014 1469.9677,-882.715 1464.7528,-748.5464 1584.5,-622 1655.0965,-547.3951 2405.2598,-580.8334 2507.5,-571 2518.0054,-569.9896 2528.8566,-568.8124 2539.7598,-567.5335"/>
<polygon fill="#000000" stroke="#000000" points="2540.2668,-570.9979 2549.779,-566.3323 2539.4335,-564.0477 2540.2668,-570.9979"/>
<text text-anchor="middle" x="1625" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_surgery -->
<g id="node10" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2734.5,-1946C2734.5,-1946 3080.5,-1946 3080.5,-1946 3086.5,-1946 3092.5,-1952 3092.5,-1958 3092.5,-1958 3092.5,-2095 3092.5,-2095 3092.5,-2101 3086.5,-2107 3080.5,-2107 3080.5,-2107 2734.5,-2107 2734.5,-2107 2728.5,-2107 2722.5,-2101 2722.5,-2095 2722.5,-2095 2722.5,-1958 2722.5,-1958 2722.5,-1952 2728.5,-1946 2734.5,-1946"/>
<text text-anchor="middle" x="2780" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2837.5,-1946 2837.5,-2107 "/>
<text text-anchor="middle" x="2848" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2858.5,-1946 2858.5,-2107 "/>
<text text-anchor="middle" x="2965" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2858.5,-2084 3071.5,-2084 "/>
<text text-anchor="middle" x="2965" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2858.5,-2061 3071.5,-2061 "/>
<text text-anchor="middle" x="2965" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2858.5,-2038 3071.5,-2038 "/>
<text text-anchor="middle" x="2965" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2858.5,-2015 3071.5,-2015 "/>
<text text-anchor="middle" x="2965" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2858.5,-1992 3071.5,-1992 "/>
<text text-anchor="middle" x="2965" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2858.5,-1969 3071.5,-1969 "/>
<text text-anchor="middle" x="2965" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="3071.5,-1946 3071.5,-2107 "/>
<text text-anchor="middle" x="3082" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge37" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M3092.613,-2068.5585C3103.7907,-2058.5547 3110.5,-2044.5352 3110.5,-2026.5 3110.5,-2012.5509 3106.4865,-2001.004 3099.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="3101.9806,-1989.3911 3092.613,-1984.4415 3096.8494,-1994.1525 3101.9806,-1989.3911"/>
<text text-anchor="middle" x="3126.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge5" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2874.7368,-1945.8348C2843.1397,-1877.888 2788.9764,-1783.0494 2713.5,-1727 2614.9887,-1653.8447 2482.7346,-1615.1356 2374.249,-1594.6952"/>
<polygon fill="#000000" stroke="#000000" points="2374.629,-1591.2064 2364.1599,-1592.8338 2373.3589,-1598.0902 2374.629,-1591.2064"/>
<text text-anchor="middle" x="2725.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- lab_exam -->
<g id="node11" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1396.5,-2008.5C1396.5,-2008.5 1456.5,-2008.5 1456.5,-2008.5 1462.5,-2008.5 1468.5,-2014.5 1468.5,-2020.5 1468.5,-2020.5 1468.5,-2032.5 1468.5,-2032.5 1468.5,-2038.5 1462.5,-2044.5 1456.5,-2044.5 1456.5,-2044.5 1396.5,-2044.5 1396.5,-2044.5 1390.5,-2044.5 1384.5,-2038.5 1384.5,-2032.5 1384.5,-2032.5 1384.5,-2020.5 1384.5,-2020.5 1384.5,-2014.5 1390.5,-2008.5 1396.5,-2008.5"/>
<text text-anchor="middle" x="1426.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge42" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1428.4113,-2008.3608C1433.6209,-1961.3131 1449.5794,-1831.7332 1477.5,-1727 1489.0293,-1683.7525 1507.6926,-1635.6133 1520.5025,-1604.6293"/>
<polygon fill="#000000" stroke="#000000" points="1523.8162,-1605.7769 1524.4394,-1595.2004 1517.3566,-1603.0797 1523.8162,-1605.7769"/>
<text text-anchor="middle" x="1514.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- file -->
<g id="node12" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1457,-2750.5C1457,-2750.5 1642,-2750.5 1642,-2750.5 1648,-2750.5 1654,-2756.5 1654,-2762.5 1654,-2762.5 1654,-2945.5 1654,-2945.5 1654,-2951.5 1648,-2957.5 1642,-2957.5 1642,-2957.5 1457,-2957.5 1457,-2957.5 1451,-2957.5 1445,-2951.5 1445,-2945.5 1445,-2945.5 1445,-2762.5 1445,-2762.5 1445,-2756.5 1451,-2750.5 1457,-2750.5"/>
<text text-anchor="middle" x="1464.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1484,-2750.5 1484,-2957.5 "/>
<text text-anchor="middle" x="1494.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1505,-2750.5 1505,-2957.5 "/>
<text text-anchor="middle" x="1569" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1505,-2934.5 1633,-2934.5 "/>
<text text-anchor="middle" x="1569" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1505,-2911.5 1633,-2911.5 "/>
<text text-anchor="middle" x="1569" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1505,-2888.5 1633,-2888.5 "/>
<text text-anchor="middle" x="1569" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1505,-2865.5 1633,-2865.5 "/>
<text text-anchor="middle" x="1569" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1505,-2842.5 1633,-2842.5 "/>
<text text-anchor="middle" x="1569" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1505,-2819.5 1633,-2819.5 "/>
<text text-anchor="middle" x="1569" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1505,-2796.5 1633,-2796.5 "/>
<text text-anchor="middle" x="1569" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1505,-2773.5 1633,-2773.5 "/>
<text text-anchor="middle" x="1569" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1633,-2750.5 1633,-2957.5 "/>
<text text-anchor="middle" x="1643.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge23" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1444.7146,-2809.1051C1388.4496,-2782.0414 1319.8911,-2744.0894 1266.5,-2699 1135.0351,-2587.9765 1013.831,-2440.1118 920.4227,-2311.3081"/>
<polygon fill="#000000" stroke="#000000" points="923.0052,-2308.9062 914.3104,-2302.8522 917.3321,-2313.007 923.0052,-2308.9062"/>
<text text-anchor="middle" x="1303" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge29" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1654.1492,-2848.6947C2021.1269,-2829.4083 3227.5,-2759.9646 3227.5,-2680.5 3227.5,-2680.5 3227.5,-2680.5 3227.5,-438 3227.5,-412.3996 3221.5971,-385.6495 3213.6589,-361.2505"/>
<polygon fill="#000000" stroke="#000000" points="3216.9329,-360.0069 3210.3991,-351.6666 3210.3058,-362.261 3216.9329,-360.0069"/>
<text text-anchor="middle" x="3258" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- diagnosis -->
<g id="node25" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2726,-2344.5C2726,-2344.5 3069,-2344.5 3069,-2344.5 3075,-2344.5 3081,-2350.5 3081,-2356.5 3081,-2356.5 3081,-2631.5 3081,-2631.5 3081,-2637.5 3075,-2643.5 3069,-2643.5 3069,-2643.5 2726,-2643.5 2726,-2643.5 2720,-2643.5 2714,-2637.5 2714,-2631.5 2714,-2631.5 2714,-2356.5 2714,-2356.5 2714,-2350.5 2720,-2344.5 2726,-2344.5"/>
<text text-anchor="middle" x="2756" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2798,-2344.5 2798,-2643.5 "/>
<text text-anchor="middle" x="2808.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2819,-2344.5 2819,-2643.5 "/>
<text text-anchor="middle" x="2939.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2819,-2620.5 3060,-2620.5 "/>
<text text-anchor="middle" x="2939.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2819,-2597.5 3060,-2597.5 "/>
<text text-anchor="middle" x="2939.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2819,-2574.5 3060,-2574.5 "/>
<text text-anchor="middle" x="2939.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2819,-2551.5 3060,-2551.5 "/>
<text text-anchor="middle" x="2939.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2819,-2528.5 3060,-2528.5 "/>
<text text-anchor="middle" x="2939.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2819,-2505.5 3060,-2505.5 "/>
<text text-anchor="middle" x="2939.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2819,-2482.5 3060,-2482.5 "/>
<text text-anchor="middle" x="2939.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2819,-2459.5 3060,-2459.5 "/>
<text text-anchor="middle" x="2939.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2819,-2436.5 3060,-2436.5 "/>
<text text-anchor="middle" x="2939.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2819,-2413.5 3060,-2413.5 "/>
<text text-anchor="middle" x="2939.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2819,-2390.5 3060,-2390.5 "/>
<text text-anchor="middle" x="2939.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2819,-2367.5 3060,-2367.5 "/>
<text text-anchor="middle" x="2939.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="3060,-2344.5 3060,-2643.5 "/>
<text text-anchor="middle" x="3070.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge28" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1654.1536,-2826.051C1879.7737,-2765.7963 2414.9033,-2622.8834 2704.0782,-2545.6557"/>
<polygon fill="#000000" stroke="#000000" points="2705.0772,-2549.0116 2713.8355,-2543.0499 2703.271,-2542.2486 2705.0772,-2549.0116"/>
<text text-anchor="middle" x="2107" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge16" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1445.8689,-2750.0694C1429.4212,-2733.5742 1413.8343,-2717.9422 1401.6175,-2705.6901"/>
<polygon fill="#000000" stroke="#000000" points="1404.008,-2703.1306 1394.4687,-2698.5206 1399.0511,-2708.0732 1404.008,-2703.1306"/>
<text text-anchor="middle" x="1459" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge7" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2301.2151,-1013.5185C2299.8389,-1019.7167 2298.5928,-1025.8873 2297.5,-1032 2296.1656,-1039.4637 2295.3578,-1047.3846 2294.9121,-1055.2229"/>
<polygon fill="#000000" stroke="#000000" points="2291.4064,-1055.3074 2294.5209,-1065.4342 2298.4013,-1055.5755 2291.4064,-1055.3074"/>
<text text-anchor="middle" x="2324.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge36" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2583.2046,-845.2761C2594.376,-838.5862 2601,-829.4941 2601,-818 2601,-809.7386 2597.5781,-802.7181 2591.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2593.3073,-793.9155 2583.2046,-790.7239 2589.1119,-799.519 2593.3073,-793.9155"/>
<text text-anchor="middle" x="2617" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge26" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2373.5,-622.4901C2373.5,-606.8636 2373.5,-592.5861 2373.5,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="2377.0001,-580.664 2373.5,-570.6641 2370.0001,-580.6641 2377.0001,-580.664"/>
<text text-anchor="middle" x="2404.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- vital_signs -->
<g id="node14" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1499,-1865.5C1499,-1865.5 1786,-1865.5 1786,-1865.5 1792,-1865.5 1798,-1871.5 1798,-1877.5 1798,-1877.5 1798,-2175.5 1798,-2175.5 1798,-2181.5 1792,-2187.5 1786,-2187.5 1786,-2187.5 1499,-2187.5 1499,-2187.5 1493,-2187.5 1487,-2181.5 1487,-2175.5 1487,-2175.5 1487,-1877.5 1487,-1877.5 1487,-1871.5 1493,-1865.5 1499,-1865.5"/>
<text text-anchor="middle" x="1533.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1580,-1865.5 1580,-2187.5 "/>
<text text-anchor="middle" x="1590.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1601,-1865.5 1601,-2187.5 "/>
<text text-anchor="middle" x="1689" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1601,-2164.5 1777,-2164.5 "/>
<text text-anchor="middle" x="1689" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1601,-2141.5 1777,-2141.5 "/>
<text text-anchor="middle" x="1689" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1601,-2118.5 1777,-2118.5 "/>
<text text-anchor="middle" x="1689" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1601,-2095.5 1777,-2095.5 "/>
<text text-anchor="middle" x="1689" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1601,-2072.5 1777,-2072.5 "/>
<text text-anchor="middle" x="1689" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1601,-2049.5 1777,-2049.5 "/>
<text text-anchor="middle" x="1689" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1601,-2026.5 1777,-2026.5 "/>
<text text-anchor="middle" x="1689" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1601,-2003.5 1777,-2003.5 "/>
<text text-anchor="middle" x="1689" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1601,-1980.5 1777,-1980.5 "/>
<text text-anchor="middle" x="1689" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1601,-1957.5 1777,-1957.5 "/>
<text text-anchor="middle" x="1689" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1601,-1934.5 1777,-1934.5 "/>
<text text-anchor="middle" x="1689" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1601,-1911.5 1777,-1911.5 "/>
<text text-anchor="middle" x="1689" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1601,-1888.5 1777,-1888.5 "/>
<text text-anchor="middle" x="1689" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1777,-1865.5 1777,-2187.5 "/>
<text text-anchor="middle" x="1787.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge41" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1604.1952,-1865.3007C1581.6872,-1770.5793 1555.1949,-1659.0912 1542.3172,-1604.8973"/>
<polygon fill="#000000" stroke="#000000" points="1545.7188,-1604.0727 1540.0017,-1595.1528 1538.9084,-1605.6911 1545.7188,-1604.0727"/>
<text text-anchor="middle" x="1594.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_arm -->
<g id="node24" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2494,-403.5C2494,-403.5 2863,-403.5 2863,-403.5 2869,-403.5 2875,-409.5 2875,-415.5 2875,-415.5 2875,-460.5 2875,-460.5 2875,-466.5 2869,-472.5 2863,-472.5 2863,-472.5 2494,-472.5 2494,-472.5 2488,-472.5 2482,-466.5 2482,-460.5 2482,-460.5 2482,-415.5 2482,-415.5 2482,-409.5 2488,-403.5 2494,-403.5"/>
<text text-anchor="middle" x="2528" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2574,-403.5 2574,-472.5 "/>
<text text-anchor="middle" x="2584.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2595,-403.5 2595,-472.5 "/>
<text text-anchor="middle" x="2724.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2595,-449.5 2854,-449.5 "/>
<text text-anchor="middle" x="2724.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2595,-426.5 2854,-426.5 "/>
<text text-anchor="middle" x="2724.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="2854,-403.5 2854,-472.5 "/>
<text text-anchor="middle" x="2864.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge2" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2437.81,-524.4117C2476.9699,-510.3526 2527.9507,-492.0497 2572.9064,-475.9098"/>
<polygon fill="#000000" stroke="#000000" points="2574.1725,-479.1741 2582.4017,-472.5009 2571.8072,-472.5858 2574.1725,-479.1741"/>
<text text-anchor="middle" x="2574" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- principal_investigator -->
<g id="node16" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3268,-403.5C3268,-403.5 3595,-403.5 3595,-403.5 3601,-403.5 3607,-409.5 3607,-415.5 3607,-415.5 3607,-460.5 3607,-460.5 3607,-466.5 3601,-472.5 3595,-472.5 3595,-472.5 3268,-472.5 3268,-472.5 3262,-472.5 3256,-466.5 3256,-460.5 3256,-460.5 3256,-415.5 3256,-415.5 3256,-409.5 3262,-403.5 3268,-403.5"/>
<text text-anchor="middle" x="3343" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3430,-403.5 3430,-472.5 "/>
<text text-anchor="middle" x="3440.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3451,-403.5 3451,-472.5 "/>
<text text-anchor="middle" x="3518.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3451,-449.5 3586,-449.5 "/>
<text text-anchor="middle" x="3518.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3451,-426.5 3586,-426.5 "/>
<text text-anchor="middle" x="3518.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3586,-403.5 3586,-472.5 "/>
<text text-anchor="middle" x="3596.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge31" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3377.835,-403.3975C3356.7354,-389.7927 3331.4887,-373.5139 3306.034,-357.1011"/>
<polygon fill="#000000" stroke="#000000" points="3307.7003,-354.011 3297.3992,-351.5335 3303.9069,-359.8941 3307.7003,-354.011"/>
<text text-anchor="middle" x="3378" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- disease_extent -->
<g id="node17" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1038.5,-1877C1038.5,-1877 1354.5,-1877 1354.5,-1877 1360.5,-1877 1366.5,-1883 1366.5,-1889 1366.5,-1889 1366.5,-2164 1366.5,-2164 1366.5,-2170 1360.5,-2176 1354.5,-2176 1354.5,-2176 1038.5,-2176 1038.5,-2176 1032.5,-2176 1026.5,-2170 1026.5,-2164 1026.5,-2164 1026.5,-1889 1026.5,-1889 1026.5,-1883 1032.5,-1877 1038.5,-1877"/>
<text text-anchor="middle" x="1088" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1149.5,-1877 1149.5,-2176 "/>
<text text-anchor="middle" x="1160" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1170.5,-1877 1170.5,-2176 "/>
<text text-anchor="middle" x="1258" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2153 1345.5,-2153 "/>
<text text-anchor="middle" x="1258" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2130 1345.5,-2130 "/>
<text text-anchor="middle" x="1258" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2107 1345.5,-2107 "/>
<text text-anchor="middle" x="1258" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2084 1345.5,-2084 "/>
<text text-anchor="middle" x="1258" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2061 1345.5,-2061 "/>
<text text-anchor="middle" x="1258" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2038 1345.5,-2038 "/>
<text text-anchor="middle" x="1258" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1170.5,-2015 1345.5,-2015 "/>
<text text-anchor="middle" x="1258" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1992 1345.5,-1992 "/>
<text text-anchor="middle" x="1258" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1969 1345.5,-1969 "/>
<text text-anchor="middle" x="1258" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1946 1345.5,-1946 "/>
<text text-anchor="middle" x="1258" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1923 1345.5,-1923 "/>
<text text-anchor="middle" x="1258" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1170.5,-1900 1345.5,-1900 "/>
<text text-anchor="middle" x="1258" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1345.5,-1877 1345.5,-2176 "/>
<text text-anchor="middle" x="1356" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge39" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1275.7358,-1876.7782C1304.5666,-1827.2809 1339.0849,-1773.1136 1375.5,-1727 1413.2114,-1679.2448 1464.8664,-1631.4524 1498.9331,-1601.8242"/>
<polygon fill="#000000" stroke="#000000" points="1501.4885,-1604.242 1506.771,-1595.058 1496.9143,-1598.9432 1501.4885,-1604.242"/>
<text text-anchor="middle" x="1431.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge19" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3172.5,-190.4932C3172.5,-176.7786 3172.5,-162.5421 3172.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3176.0001,-148.5183 3172.5,-138.5184 3169.0001,-148.5184 3176.0001,-148.5183"/>
<text text-anchor="middle" x="3213" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_therapy -->
<g id="node20" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2186.5,-1727.5C2186.5,-1727.5 2642.5,-1727.5 2642.5,-1727.5 2648.5,-1727.5 2654.5,-1733.5 2654.5,-1739.5 2654.5,-1739.5 2654.5,-2313.5 2654.5,-2313.5 2654.5,-2319.5 2648.5,-2325.5 2642.5,-2325.5 2642.5,-2325.5 2186.5,-2325.5 2186.5,-2325.5 2180.5,-2325.5 2174.5,-2319.5 2174.5,-2313.5 2174.5,-2313.5 2174.5,-1739.5 2174.5,-1739.5 2174.5,-1733.5 2180.5,-1727.5 2186.5,-1727.5"/>
<text text-anchor="middle" x="2232" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2289.5,-1727.5 2289.5,-2325.5 "/>
<text text-anchor="middle" x="2300" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2310.5,-1727.5 2310.5,-2325.5 "/>
<text text-anchor="middle" x="2472" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2302.5 2633.5,-2302.5 "/>
<text text-anchor="middle" x="2472" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2279.5 2633.5,-2279.5 "/>
<text text-anchor="middle" x="2472" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2256.5 2633.5,-2256.5 "/>
<text text-anchor="middle" x="2472" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2233.5 2633.5,-2233.5 "/>
<text text-anchor="middle" x="2472" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2210.5 2633.5,-2210.5 "/>
<text text-anchor="middle" x="2472" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2187.5 2633.5,-2187.5 "/>
<text text-anchor="middle" x="2472" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2164.5 2633.5,-2164.5 "/>
<text text-anchor="middle" x="2472" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2141.5 2633.5,-2141.5 "/>
<text text-anchor="middle" x="2472" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2118.5 2633.5,-2118.5 "/>
<text text-anchor="middle" x="2472" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2095.5 2633.5,-2095.5 "/>
<text text-anchor="middle" x="2472" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2072.5 2633.5,-2072.5 "/>
<text text-anchor="middle" x="2472" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2049.5 2633.5,-2049.5 "/>
<text text-anchor="middle" x="2472" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2026.5 2633.5,-2026.5 "/>
<text text-anchor="middle" x="2472" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2310.5,-2003.5 2633.5,-2003.5 "/>
<text text-anchor="middle" x="2472" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1980.5 2633.5,-1980.5 "/>
<text text-anchor="middle" x="2472" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1957.5 2633.5,-1957.5 "/>
<text text-anchor="middle" x="2472" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1934.5 2633.5,-1934.5 "/>
<text text-anchor="middle" x="2472" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1911.5 2633.5,-1911.5 "/>
<text text-anchor="middle" x="2472" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1888.5 2633.5,-1888.5 "/>
<text text-anchor="middle" x="2472" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1865.5 2633.5,-1865.5 "/>
<text text-anchor="middle" x="2472" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1842.5 2633.5,-1842.5 "/>
<text text-anchor="middle" x="2472" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1819.5 2633.5,-1819.5 "/>
<text text-anchor="middle" x="2472" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1796.5 2633.5,-1796.5 "/>
<text text-anchor="middle" x="2472" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1773.5 2633.5,-1773.5 "/>
<text text-anchor="middle" x="2472" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2310.5,-1750.5 2633.5,-1750.5 "/>
<text text-anchor="middle" x="2472" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2633.5,-1727.5 2633.5,-2325.5 "/>
<text text-anchor="middle" x="2644" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge33" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M2654.7384,-2064.6912C2665.9387,-2055.0507 2672.5,-2042.3203 2672.5,-2026.5 2672.5,-2014.3876 2668.6539,-2004.0864 2661.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="2664.219,-1993.0385 2654.7384,-1988.3088 2659.2002,-1997.9183 2664.219,-1993.0385"/>
<text text-anchor="middle" x="2688.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge3" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2258.5647,-1727.4595C2250.8025,-1712.5737 2243.279,-1698.1459 2236.1478,-1684.4701"/>
<polygon fill="#000000" stroke="#000000" points="2239.2467,-1682.8431 2231.5196,-1675.5945 2233.0399,-1686.0797 2239.2467,-1682.8431"/>
<text text-anchor="middle" x="2297.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge11" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2129.7988,-1468.2874C2102.1434,-1391.7848 2080.8845,-1287.7472 2126.5,-1209 2136.9789,-1190.91 2152.2212,-1175.8871 2169.3365,-1163.5009"/>
<polygon fill="#000000" stroke="#000000" points="2171.6184,-1166.1795 2177.8764,-1157.6304 2167.653,-1160.411 2171.6184,-1166.1795"/>
<text text-anchor="middle" x="2153.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge1" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1552.4204,-1548.5587C1585.7414,-1504.9721 1657.6686,-1410.8856 1699.8416,-1355.7198"/>
<polygon fill="#000000" stroke="#000000" points="1702.7991,-1357.614 1706.092,-1347.5438 1697.238,-1353.3626 1702.7991,-1357.614"/>
<text text-anchor="middle" x="1663" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge12" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1606.3547,-1548.8906C1677.3521,-1523.788 1786.7453,-1478.8365 1867.5,-1417 1963.4198,-1343.5511 1944.0993,-1279.0904 2042.5,-1209 2079.1737,-1182.8775 2123.7536,-1162.6903 2165.2668,-1147.6402"/>
<polygon fill="#000000" stroke="#000000" points="2166.655,-1150.8615 2174.9068,-1144.2164 2164.3121,-1144.2652 2166.655,-1150.8615"/>
<text text-anchor="middle" x="2069.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge34" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1592.5376,-1595.0098C1623.6529,-1598.9199 1652,-1591.25 1652,-1572 1652,-1554.8555 1629.5147,-1546.8964 1602.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1602.2006,-1544.6454 1592.5376,-1548.9902 1602.801,-1551.6196 1602.2006,-1544.6454"/>
<text text-anchor="middle" x="1668" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge21" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2757.3508,-524.4219C2796.6099,-511.585 2844.175,-493.9597 2884.5,-473 2946.8685,-440.5828 3011.3691,-396.4851 3063.4786,-357.7617"/>
<polygon fill="#000000" stroke="#000000" points="3065.8162,-360.3843 3071.7332,-351.5956 3061.627,-354.7761 3065.8162,-360.3843"/>
<text text-anchor="middle" x="3039" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge20" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2678.5,-524.2779C2678.5,-512.2547 2678.5,-497.1545 2678.5,-482.9615"/>
<polygon fill="#000000" stroke="#000000" points="2682.0001,-482.844 2678.5,-472.844 2675.0001,-482.844 2682.0001,-482.844"/>
<text text-anchor="middle" x="2719" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge22" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2780.5575,-403.4988C2846.9376,-381.0585 2934.9305,-351.312 3010.722,-325.6901"/>
<polygon fill="#000000" stroke="#000000" points="3012.0248,-328.9444 3020.3772,-322.4261 3009.783,-322.313 3012.0248,-328.9444"/>
<text text-anchor="middle" x="2907" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge9" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M3081.3052,-2405.2725C3109.527,-2383.3809 3134.7911,-2357.0847 3151.5,-2326 3271.2616,-2103.1999 3132.1,-1364.3788 2932.5,-1209 2856.0357,-1149.4763 2591.107,-1125.8514 2428.2794,-1116.806"/>
<polygon fill="#000000" stroke="#000000" points="2428.3644,-1113.3056 2418.1889,-1116.2568 2427.9839,-1120.2952 2428.3644,-1113.3056"/>
<text text-anchor="middle" x="3172.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node26" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3637,-403.5C3637,-403.5 3954,-403.5 3954,-403.5 3960,-403.5 3966,-409.5 3966,-415.5 3966,-415.5 3966,-460.5 3966,-460.5 3966,-466.5 3960,-472.5 3954,-472.5 3954,-472.5 3637,-472.5 3637,-472.5 3631,-472.5 3625,-466.5 3625,-460.5 3625,-460.5 3625,-415.5 3625,-415.5 3625,-409.5 3631,-403.5 3637,-403.5"/>
<text text-anchor="middle" x="3670" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3715,-403.5 3715,-472.5 "/>
<text text-anchor="middle" x="3725.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3736,-403.5 3736,-472.5 "/>
<text text-anchor="middle" x="3840.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3736,-449.5 3945,-449.5 "/>
<text text-anchor="middle" x="3840.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3736,-426.5 3945,-426.5 "/>
<text text-anchor="middle" x="3840.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3945,-403.5 3945,-472.5 "/>
<text text-anchor="middle" x="3955.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge30" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3666.7919,-403.4988C3570.4893,-377.6841 3438.1168,-342.2007 3334.5933,-314.4504"/>
<polygon fill="#000000" stroke="#000000" points="3335.2323,-310.9982 3324.6671,-311.7896 3333.4199,-317.7595 3335.2323,-310.9982"/>
<text text-anchor="middle" x="3624" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- demographic -->
<g id="node27" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2575.5,-1232.5C2575.5,-1232.5 2911.5,-1232.5 2911.5,-1232.5 2917.5,-1232.5 2923.5,-1238.5 2923.5,-1244.5 2923.5,-1244.5 2923.5,-1381.5 2923.5,-1381.5 2923.5,-1387.5 2917.5,-1393.5 2911.5,-1393.5 2911.5,-1393.5 2575.5,-1393.5 2575.5,-1393.5 2569.5,-1393.5 2563.5,-1387.5 2563.5,-1381.5 2563.5,-1381.5 2563.5,-1244.5 2563.5,-1244.5 2563.5,-1238.5 2569.5,-1232.5 2575.5,-1232.5"/>
<text text-anchor="middle" x="2618.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2673.5,-1232.5 2673.5,-1393.5 "/>
<text text-anchor="middle" x="2684" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2694.5,-1232.5 2694.5,-1393.5 "/>
<text text-anchor="middle" x="2798.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2694.5,-1370.5 2902.5,-1370.5 "/>
<text text-anchor="middle" x="2798.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2694.5,-1347.5 2902.5,-1347.5 "/>
<text text-anchor="middle" x="2798.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2694.5,-1324.5 2902.5,-1324.5 "/>
<text text-anchor="middle" x="2798.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2694.5,-1301.5 2902.5,-1301.5 "/>
<text text-anchor="middle" x="2798.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2694.5,-1278.5 2902.5,-1278.5 "/>
<text text-anchor="middle" x="2798.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2694.5,-1255.5 2902.5,-1255.5 "/>
<text text-anchor="middle" x="2798.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2902.5,-1232.5 2902.5,-1393.5 "/>
<text text-anchor="middle" x="2913" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge8" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2602.1951,-1232.4342C2586.2682,-1224.1966 2570.1439,-1216.216 2554.5,-1209 2513.9598,-1190.3002 2468.7266,-1172.2885 2427.5965,-1156.9442"/>
<polygon fill="#000000" stroke="#000000" points="2428.6569,-1153.6046 2418.0639,-1153.408 2426.2222,-1160.1675 2428.6569,-1153.6046"/>
<text text-anchor="middle" x="2539.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge24" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1377.25,-2662.4611C1378.5472,-2604.9702 1373.9498,-2425.0898 1271.5,-2344 1227.1306,-2308.8812 1068.6423,-2350.2164 1017.5,-2326 1000.0191,-2317.7226 983.0739,-2307.8529 966.7464,-2296.8196"/>
<polygon fill="#000000" stroke="#000000" points="968.4787,-2293.7619 958.2649,-2290.9461 964.4934,-2299.5167 968.4787,-2293.7619"/>
<text text-anchor="middle" x="1414" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
</g>
</svg>
</div>
